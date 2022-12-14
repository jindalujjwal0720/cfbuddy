part of 'app_initialisation_cubit.dart';

abstract class AppInitialisationState extends Equatable {
  const AppInitialisationState();

  @override
  List<Object> get props => [];
}

class AppInitialisationInitial extends AppInitialisationState {}

class AppInitialisationLoading extends AppInitialisationState {}

class AppInitialisationLoaded extends AppInitialisationState {}

class AppInitialisationAuthFailed extends AppInitialisationState {}
