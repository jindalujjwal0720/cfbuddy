// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_card_cubit.dart';

abstract class UserCardState extends Equatable {
  const UserCardState();

  @override
  List<Object> get props => [];
}

class UserCardInitial extends UserCardState {}

class UserCardLoading extends UserCardState {}

class UserCardLoaded extends UserCardState {
  final UserModel user;
  const UserCardLoaded(this.user);
}

class UserCardError extends UserCardState {
  final String message;
  const UserCardError(this.message);
}
