import 'dart:convert';
import 'package:bloc1/data/models/contest_standings_model.dart';

import '../dataproviders/contests_provider.dart';
import '../models/contest_model.dart';

abstract class ContestsRepository {
  Future<List<ContestModel>> getContestsList();
  Future<ContestStandingsModel> getContestInfoAndStandings(
      int contestID, List<String> handles);
}

class ContestsRepositoryImpl implements ContestsRepository {
  @override
  Future<List<ContestModel>> getContestsList() async {
    List<ContestModel> result = [];
    String json = await ContestsProviderImpl().fetchContestsList();
    final object = jsonDecode(json)["result"];
    for (var obj in object) {
      result.add(ContestModel.fromMap(obj));
    }
    return result;
  }

  @override
  Future<ContestStandingsModel> getContestInfoAndStandings(
      int contestID, List<String> handles) async {
    String json = await ContestsProviderImpl()
        .fetchContestInfoAndStandings(contestID, handles);
    final object = jsonDecode(json)["result"];
    ContestStandingsModel result = ContestStandingsModel.fromMap(object);
    return result;
  }
}
