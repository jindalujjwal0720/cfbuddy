part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}

class AppHomePageLoading extends AppState {}

class AppHomePageLoaded extends AppState {}

class AppUserDetailsPageLoading extends AppState {}

class AppUserDetailsPageLoaded extends AppState {}
