part of 'users_list_cubit.dart';

abstract class UsersListState extends Equatable {
  const UsersListState();

  @override
  List<Object> get props => [];
}

class UsersListInitial extends UsersListState {}

class UsersListLoading extends UsersListState {}

class UsersListLoaded extends UsersListState {
  final List<UserModel> users;
  const UsersListLoaded(this.users);

  @override
  List<Object> get props => [users];
}

class UsersListError extends UsersListState {
  final String message;
  const UsersListError(this.message);
}
