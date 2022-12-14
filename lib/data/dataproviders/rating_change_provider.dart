import 'package:http/http.dart' as http;

abstract class RatingChangeProvider {
  Future<String> fetchRatingChanges(String handle);
}

class RatingChangeProviderImpl implements RatingChangeProvider {
  @override
  Future<String> fetchRatingChanges(String handle) async {
    String url = "https://codeforces.com/api/user.rating";
    final res = await http.get(Uri.parse("$url?handle=$handle"));
    if (res.statusCode == 200) {
      return res.body;
    } else {
      return throw Exception("Failed to load data");
    }
  }
}
