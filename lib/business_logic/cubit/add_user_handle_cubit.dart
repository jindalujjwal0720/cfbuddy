import 'package:bloc/bloc.dart';
import 'package:bloc1/business_logic/cubit/user_cubit.dart';
import 'package:equatable/equatable.dart';

part 'add_user_handle_state.dart';

class AddUserHandleCubit extends Cubit<AddUserHandleState> {
  AddUserHandleCubit() : super(AddUserHandleInitial());

  Future<void> getInput() async {
    emit(AddUserHandleInitial());
    emit(AddUserHandleDialogLoad());
  }

  Future<void> addFriend(String handle) async {
    emit(AddUserHandleLoading());
    try {
      await UserCubit().loadUserFriends(extraHandles: [handle]);
      emit(AddUserHandleLoaded());
    } catch (e) {
      emit(AddUserHandleError(e.toString()));
    }
  }

  Future<void> addUser(String handle) async {
    emit(AddUserHandleLoading());
    try {
      await UserCubit().loadUser(handle: handle);
      emit(AddUserHandleLoaded());
    } catch (e) {
      emit(AddUserHandleError(e.toString()));
    }
  }
}
