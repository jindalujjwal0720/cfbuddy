import 'package:bloc/bloc.dart';
import 'package:bloc1/data/constants/constants.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  Future<void> navigateToHomePage() async {
    emit(NavigationInitial());
    emit(NavigateToHomePage());
  }

  Future<void> navigateToUserDetailsPage({String? handle}) async {
    emit(NavigationInitial());
    handle ??= userConstants.user.handle;
    emit(NavigateToUserDetailsPage(handle));
  }

  Future<void> navigateToInitialisationPage() async {
    emit(NavigationInitial());
    emit(NavigateToInitialisationPage());
  }

  Future<void> navigateToWelcomePage() async {
    emit(NavigationInitial());
    emit(NavigateToWelcomePage());
  }
}
