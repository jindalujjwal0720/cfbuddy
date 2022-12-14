part of 'problem_rating_chart_cubit.dart';

abstract class ProblemRatingChartState extends Equatable {
  const ProblemRatingChartState();

  @override
  List<Object> get props => [];
}

class ProblemRatingChartInitial extends ProblemRatingChartState {}

class ProblemRatingChartLoading extends ProblemRatingChartState {}

class ProblemRatingChartLoaded extends ProblemRatingChartState {
  final ProblemStatsModel stats;
  const ProblemRatingChartLoaded(this.stats);
}

class ProblemRatingChartError extends ProblemRatingChartState {
  final String message;
  const ProblemRatingChartError(this.message);
}
