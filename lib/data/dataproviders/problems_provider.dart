import 'package:http/http.dart' as http;

abstract class ProblemsProvider {
  Future<String> fetchProblemsList(List<String> tags);
  Future<String> fetchProblemByID(int contestID, String index);
}

class ProblemsProviderImpl implements ProblemsProvider {
  @override
  Future<String> fetchProblemsList(List<String> tags) async {
    String url = "https://codeforces.com/api/problemset.problems";
    String q = tags[0];
    for (int i = 1; i < tags.length; i++) {
      q += (';' + tags[i]);
    }
    final res = await http.get(Uri.parse("$url?&tags=$q"));
    if (res.statusCode == 200) {
      return res.body;
    } else {
      return throw Exception("Failed to load data : Problems Provider");
    }
  }

  @override
  Future<String> fetchProblemByID(int contestID, String index) async {
    String url =
        "https://codeforces.com/problemset/problem/$contestID/$index";
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return res.body;
    } else {
      return throw Exception("Failed to load data : Problems Provider");
    }
  }
}
