import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  Future<void> setFriendsList(List<String> handles) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("friendsHandles", handles);
  }
}
