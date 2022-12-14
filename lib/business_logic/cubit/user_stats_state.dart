part of 'user_stats_cubit.dart';

abstract class UserStatsState extends Equatable {
  const UserStatsState();

  @override
  List<Object> get props => [];
}

class UserStatsInitial extends UserStatsState {}

class UserStatsLoading extends UserStatsState {}

class UserStatsLoaded extends UserStatsState {
  final ProblemStatsModel stats;
  const UserStatsLoaded(this.stats);
}

class UserStatsError extends UserStatsState {
  final String message;
  const UserStatsError(this.message);
}
