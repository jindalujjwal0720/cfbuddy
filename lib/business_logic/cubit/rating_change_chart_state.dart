part of 'rating_change_chart_cubit.dart';

abstract class RatingChangeChartState extends Equatable {
  const RatingChangeChartState();

  @override
  List<Object> get props => [];
}

class RatingChangeChartInitial extends RatingChangeChartState {}

class RatingChangeChartLoading extends RatingChangeChartState {}

class RatingChangeChartLoaded extends RatingChangeChartState {
  final List<List<ChartPointModel>> handlesChartPoints;
  const RatingChangeChartLoaded(this.handlesChartPoints);
}

class RatingChangeChartError extends RatingChangeChartState {
  final String message;
  const RatingChangeChartError(this.message);
}
