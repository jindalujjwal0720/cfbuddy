part of 'user_card_details_page_cubit.dart';

abstract class UserCardDetailsPageState extends Equatable {
  const UserCardDetailsPageState();

  @override
  List<Object> get props => [];
}

class UserCardDetailsPageInitial extends UserCardDetailsPageState {}

class UserCardDetailsPageLoading extends UserCardDetailsPageState {}

class UserCardDetailsPageLoaded extends UserCardDetailsPageState {
  final UserModel user;
  const UserCardDetailsPageLoaded(this.user);
}

class UserCardDetailsPageError extends UserCardDetailsPageState {
  final String message;
  const UserCardDetailsPageError(this.message);
}
