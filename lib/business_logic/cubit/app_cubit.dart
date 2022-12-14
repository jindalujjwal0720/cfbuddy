import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial()) {
    generateHomePage();
    // generateUserDetailsPage();
  }
  Future<void> generateHomePage() async {
    emit(AppHomePageLoading());
    emit(AppHomePageLoaded());
  }

  Future<void> generateUserDetailsPage() async {
    emit(AppUserDetailsPageLoading());
    emit(AppUserDetailsPageLoaded());
  }
}
