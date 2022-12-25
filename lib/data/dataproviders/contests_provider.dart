import 'package:http/http.dart' as http;

abstract class ContestProvider {
  Future<String> fetchContestsList();
  Future<String> fetchContestInfoAndStandings(
      int contestID, List<String> handles);
}

class ContestsProviderImpl implements ContestProvider {
  @override
  Future<String> fetchContestsList() async {
    String url = "https://codeforces.com/api/contest.list";
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return res.body;
    } else {
      return throw Exception("Failed to load data : Contests Provider");
    }
  }

  @override
  Future<String> fetchContestInfoAndStandings(
      int contestID, List<String> handles) async {
    String url = "https://codeforces.com/api/contest.standings";
    String q = handles[0];
    for (int i = 1; i < handles.length; i++) {
      q += (';' + handles[i]);
    }
    final res =
        await http.get(Uri.parse("$url?contestId=$contestID&handles=$q"));
    if (res.statusCode == 200) {
      return res.body;
    } else {
      return throw Exception("Failed to load data : Contests Provider");
    }
  }
}
