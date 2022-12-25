import 'package:http/http.dart' as http;

abstract class SubmissionProvider {
  Future<String> fetchSubmissionsOfUser(String handle);
}

class SubmissionProviderImpl implements SubmissionProvider {
  @override
  Future<String> fetchSubmissionsOfUser(String handle,
      {int count = 100, int indexFrom = 1}) async {
    String url = "https://codeforces.com/api/user.status";
    final res = await http
        .get(Uri.parse("$url?handle=$handle&count=$count&from=$indexFrom"));
    if (res.statusCode == 200) {
      return res.body;
    } else {
      return throw Exception("Failed to load data");
    }
  }

  Future<String> fetchSubmissionByID(int contestID, int submissionID) async {
    String url =
        "https://codeforces.com/contest/$contestID/submission/$submissionID";
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return res.body;
    } else {
      return throw Exception("Failed to load data");
    }
  }
}
