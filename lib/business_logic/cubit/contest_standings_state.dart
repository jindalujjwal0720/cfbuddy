part of 'contest_standings_cubit.dart';

abstract class ContestStandingsState extends Equatable {
  const ContestStandingsState();

  @override
  List<Object> get props => [];
}

class ContestStandingsInitial extends ContestStandingsState {}

class ContestStandingsLoading extends ContestStandingsState {}

class ContestStandingsLoaded extends ContestStandingsState {
  final ContestStandingsModel standings;
  const ContestStandingsLoaded(this.standings);
}

class ContestStandingsError extends ContestStandingsState {
  final String message;
  const ContestStandingsError(this.message);
}
