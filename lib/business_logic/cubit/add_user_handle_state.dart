part of 'add_user_handle_cubit.dart';

abstract class AddUserHandleState extends Equatable {
  const AddUserHandleState();

  @override
  List<Object> get props => [];
}

class AddUserHandleInitial extends AddUserHandleState {}

class AddUserHandleDialogLoad extends AddUserHandleState {}

class AddUserHandleLoaded extends AddUserHandleState {}

class AddUserHandleLoading extends AddUserHandleState {}

class AddUserHandleError extends AddUserHandleState {
  final String message;
  const AddUserHandleError(this.message);
}
