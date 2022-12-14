import 'package:bloc/bloc.dart';
import 'package:bloc1/business_logic/cubit/user_cubit.dart';
import 'package:bloc1/data/constants/constants.dart';
import 'package:bloc1/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

part 'users_list_state.dart';

class UsersListCubit extends Cubit<UsersListState> {
  UsersListCubit() : super(UsersListInitial());

  Future<void> makeUsersList() async {
    emit(UsersListLoading());
    await UserCubit().loadUserFriends();
    emit(UsersListLoaded(userConstants.friends));
  }

  Future<void> removeUserFromList(String handle) async {
    emit(UsersListLoading());
    await UserCubit().removeFriend(handle);
    emit(UsersListLoaded(userConstants.friends));
  }
}
