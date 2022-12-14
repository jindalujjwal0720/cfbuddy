import 'package:http/http.dart' as http;

abstract class UserProvider {
  Future<String> fetchUsersDetails(List<String> handles);
}

class UserProviderImpl implements UserProvider {
  @override
  Future<String> fetchUsersDetails(List<String> handles) async {
    if (handles.isEmpty) return "";
    String url = "https://codeforces.com/api/user.info";
    String q = handles[0];
    for (int i = 1; i < handles.length; i++) {
      q += (';' + handles[i]);
    }
    final res = await http.get(Uri.parse("$url?handles=$q"));
    if (res.statusCode == 200) {
      return res.body;
    } else {
      return throw Exception("Failed to load data");
    }
  }
}
