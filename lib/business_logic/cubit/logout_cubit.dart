import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future<void> logOutUser() async {
    emit(LogoutInitial());
    emit(LogoutConfirmDialogLoading());
  }
}
