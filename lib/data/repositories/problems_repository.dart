import 'dart:convert';
import 'dart:developer' as dev;
import 'package:bloc1/data/dataproviders/problems_provider.dart';
import 'package:bloc1/data/models/problem_model.dart';
import 'package:html/parser.dart';

abstract class ProblemsRepository {
  Future<List<ProblemModel>> getProblemsList(List<String> tags);
}

class ProblemsRepositoryImpl implements ProblemsRepository {
  @override
  Future<List<ProblemModel>> getProblemsList(List<String> tags) async {
    List<ProblemModel> result = [];
    if (tags.isEmpty) return result;
    String json = await ProblemsProviderImpl().fetchProblemsList(tags);
    final object = jsonDecode(json)["result"];
    for (int i = 0; i < object["problems"].length; i++) {
      var obj = object["problems"][i];
      obj["solvedCount"] = object["problemStatistics"][i]["solvedCount"];
      result.add(ProblemModel.fromMap(obj));
    }
    return result;
  }

  Future<String> getProblemStatementByID(int contestID, String index) async {
    String result = "";
    String htmlCode =
        await ProblemsProviderImpl().fetchProblemByID(contestID, index);
    var document = parse(htmlCode);
    result = document.getElementsByClassName("problem-statement")[0].innerHtml;
    var problemDoc = parse(result);
    result = problemDoc.getElementsByTagName("div")[10].innerHtml;
    result = convertHTMLtoString(result);
    // dev.log(result);
    return result;
  }
}

String convertHTMLtoString(String html) {
  return html
      .replaceAll("<li>", "\n\t\u2022")
      .replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '\n')
      .replaceAll("\n\n", "\n")
      .replaceAll("\n\n", "\n")
      .replaceAll("\\", "")
      .trim();
}
