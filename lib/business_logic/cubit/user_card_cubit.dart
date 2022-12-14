import 'package:bloc/bloc.dart';
import 'package:bloc1/business_logic/cubit/user_cubit.dart';
import 'package:bloc1/data/constants/constants.dart';
import 'package:bloc1/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

part 'user_card_state.dart';

class UserCardCubit extends Cubit<UserCardState> {
  UserCardCubit() : super(UserCardInitial());

  Future<void> makeUserCard({String handle = ""}) async {
    emit(UserCardLoading());
    final UserModel user;
    if (handle.isNotEmpty && handle != userConstants.user.handle) {
      await UserCubit().loadUserFriends(extraHandles: [handle]);
      user = userConstants.friends
          .where((element) => element.handle == handle)
          .toList()[0];
    } else {
      await UserCubit().loadUser();
      user = userConstants.user;
    }
    emit(UserCardLoaded(user));
  }
}
