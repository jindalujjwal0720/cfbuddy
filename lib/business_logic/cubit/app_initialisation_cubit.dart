import 'package:bloc/bloc.dart';
import 'package:bloc1/business_logic/cubit/user_cubit.dart';
import 'package:bloc1/utils/services/local_notifications_service.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_initialisation_state.dart';

class AppInitialisationCubit extends Cubit<AppInitialisationState> {
  AppInitialisationCubit() : super(AppInitialisationInitial());

  Future<void> initialiseApp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final authStatus = prefs.containsKey("auth");
    if (!authStatus) {
      emit(AppInitialisationAuthFailed());
      return;
    } else {
      final String handle = prefs.getString("userHandle") ?? "";
      final List<String> friendsHandles =
          prefs.getStringList("friendsHandles") ?? [];
      await UserCubit().loadUser(handle: handle);
      await UserCubit().loadUserFriends(extraHandles: friendsHandles);
      emit(AppInitialisationLoaded());
    }
  }

  Future<void> setAuthStatus(String handle) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("auth", true);
    await prefs.setString("userHandle", handle);
    await prefs.setStringList("friendsHandles", []);
  }

  Future<void> deleteUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await LocalNotificationsService().removeAllLocalNotifications();
  }
}
