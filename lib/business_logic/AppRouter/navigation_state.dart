part of 'navigation_cubit.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationInitial extends NavigationState {}

class NavigateToInitialisationPage extends NavigationState {}

class NavigateToWelcomePage extends NavigationState {}

class NavigateToHomePage extends NavigationState {}

class NavigateToUserDetailsPage extends NavigationState {
  final String handle;
  const NavigateToUserDetailsPage(this.handle);
}
