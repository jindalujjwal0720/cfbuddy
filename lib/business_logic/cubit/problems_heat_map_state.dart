part of 'problems_heat_map_cubit.dart';

abstract class ProblemsHeatMapState extends Equatable {
  const ProblemsHeatMapState();

  @override
  List<Object> get props => [];
}

class ProblemsHeatMapInitial extends ProblemsHeatMapState {}

class ProblemsHeatMapLoading extends ProblemsHeatMapState {}

class ProblemsHeatMapLoaded extends ProblemsHeatMapState {
  final Map<DateTime, int> dataset;
  const ProblemsHeatMapLoaded(this.dataset);
}

class ProblemsHeatMapError extends ProblemsHeatMapState {
  final String message;
  const ProblemsHeatMapError(this.message);
}
