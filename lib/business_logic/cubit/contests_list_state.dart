part of 'contests_list_cubit.dart';

abstract class ContestsListState extends Equatable {
  const ContestsListState();

  @override
  List<Object> get props => [];
}

class ContestsListInitial extends ContestsListState {}

class ContestsListLoading extends ContestsListState {}

class ContestsListLoaded extends ContestsListState {
  final List<ContestModel> upcomingContests;
  final List<ContestModel> previousContests;
  const ContestsListLoaded(this.upcomingContests, this.previousContests);
}

class ContestsListError extends ContestsListState {
  final String message;
  const ContestsListError(this.message);
}
