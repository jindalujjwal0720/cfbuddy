part of 'problem_tags_chips_cubit.dart';

abstract class ProblemTagsChipsState extends Equatable {
  const ProblemTagsChipsState();

  @override
  List<Object> get props => [];
}

class ProblemTagsChipsInitial extends ProblemTagsChipsState {}

class ProblemTagsChipsLoading extends ProblemTagsChipsState {}

class ProblemTagsChipsLoaded extends ProblemTagsChipsState {
  final ProblemStatsModel stats;
  const ProblemTagsChipsLoaded(this.stats);
}

class ProblemTagsChipsError extends ProblemTagsChipsState {
  final String message;
  const ProblemTagsChipsError(this.message);
}
