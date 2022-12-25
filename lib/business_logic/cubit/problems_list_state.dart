part of 'problems_list_cubit.dart';

abstract class ProblemsListState extends Equatable {
  const ProblemsListState();

  @override
  List<Object> get props => [];
}

class ProblemsListInitial extends ProblemsListState {}

class ProblemsListLoading extends ProblemsListState {}

class ProblemsListLoaded extends ProblemsListState {
  final List<ProblemModel> problems;
  final List<int> ratings, countOfRatings;
  const ProblemsListLoaded(this.problems, this.ratings, this.countOfRatings);
}

class ProblemsListError extends ProblemsListState {
  final String message;
  const ProblemsListError(this.message);
}
