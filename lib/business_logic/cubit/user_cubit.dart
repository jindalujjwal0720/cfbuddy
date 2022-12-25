import 'package:bloc/bloc.dart';
import 'package:bloc1/business_logic/cubit/app_initialisation_cubit.dart';
import 'package:bloc1/data/constants/constants.dart';
import 'package:bloc1/data/models/user_model.dart';
import 'package:bloc1/data/repositories/user_repository.dart';
import 'package:bloc1/data/services/shared_preferences.dart';
import 'package:equatable/equatable.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial()) {
    emit(UserLoading());
  }

  // handle to be given only when user is entering app for the first time - otherwise errors
  Future<void> loadUser({String handle = ""}) async {
    emit(UserLoading());
    final UserModel user;
    // trim handle for whitespace, and lower case characters
    handle = handle.replaceAll(RegExp(r'[^A-Za-z0-9_\-.]'), '').toLowerCase();

    /// For reducing API Calls to the server, a CONSTANTS file is created to store data
    if (userConstants.isUserLoaded == false || handle.isNotEmpty) {
      user = (await UserRepositoryImpl().getUsersDetails([handle]))[0];
      userConstants = userConstants.copyWith(user: user, isUserLoaded: true);
    } else {
      user = userConstants.user;
    }
    if (handle.isNotEmpty) {
      AppInitialisationCubit().setAuthStatus(handle);
    }
    emit(UserLoaded(user));
  }

  Future<void> loadUserFriends({List<String> extraHandles = const []}) async {
    emit(UserLoading());
    List<UserModel> newFriends, allFriends = [];
    allFriends.addAll(userConstants.friends);
    List<String> friendsHandles = [];
    // fetch from the CONSTANTS file for already present list of friends
    for (var friend in allFriends) {
      friendsHandles.add(friend.handle);
    }
    friendsHandles.addAll(extraHandles);

    if (userConstants.isUserLoaded == false) {
      await loadUser();
    }

    // trim every string in the list for whitespaces and lowercase
    for (int i = 0; i < friendsHandles.length; i++) {
      friendsHandles[i] = friendsHandles[i]
          .replaceAll(RegExp(r'[^A-Za-z0-9_\-.]'), '')
          .toLowerCase();
    }

    // remove USER from friends list if occur
    friendsHandles.removeWhere((handle) =>
        handle
            .toLowerCase()
            .compareTo(userConstants.user.handle.toLowerCase()) ==
        0);
    // remove duplicates
    friendsHandles = friendsHandles.toSet().toList();
    // remove handles already present in CONSTANTS file
    friendsHandles.removeWhere((handle) => (userConstants.friends.where(
            (element) => element.handle.toLowerCase() == handle.toLowerCase()))
        .isNotEmpty);

    // For reducing API Calls to the server, a CONSTANTS file is created to store data
    if (userConstants.areFriendsLoaded == false || friendsHandles.isNotEmpty) {
      newFriends = await UserRepositoryImpl().getUsersDetails(friendsHandles);
      allFriends.addAll(newFriends);
      allFriends = allFriends.toSet().toList();
      userConstants =
          userConstants.copyWith(friends: allFriends, areFriendsLoaded: true);
    } else {
      newFriends = userConstants.friends;
    }
    friendsHandles = [];
    for (var friend in userConstants.friends) {
      friendsHandles.add(friend.handle.toLowerCase());
    }
    friendsHandles = friendsHandles.toSet().toList();
    SharedPrefsService().setFriendsList(friendsHandles);
    emit(UserLoaded(userConstants.user));
  }

  Future<void> removeFriend(String handle) async {
    emit(UserLoading());
    userConstants.friends.removeWhere(
        (element) => (element.handle.toLowerCase() == handle.toLowerCase()));
    List<String> friendsHandles = [];
    for (var friend in userConstants.friends) {
      friendsHandles.add(friend.handle);
    }
    SharedPrefsService().setFriendsList(friendsHandles);
    emit(UserLoaded(userConstants.user));
  }
}
