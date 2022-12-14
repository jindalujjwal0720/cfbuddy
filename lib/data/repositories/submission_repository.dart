import 'dart:convert';
import 'package:bloc1/data/dataproviders/submission_provider.dart';
import 'package:bloc1/data/models/submission_model.dart';
import 'package:intl/intl.dart';

abstract class SubmissionRepository {
  Future<List<SubmissionModel>> getSubmissionsOfUser(String handle,
      {int count, int indexFrom, DateTime? dateTime});
}

class SubmissionRepositoryImpl implements SubmissionRepository {
  @override
  Future<List<SubmissionModel>> getSubmissionsOfUser(String handle,
      {int count = 100000, int indexFrom = 1, DateTime? dateTime}) async {
    List<SubmissionModel> result = [];
    if (dateTime == null) {
      String json = await SubmissionProviderImpl()
          .fetchSubmissionsOfUser(handle, count: count, indexFrom: indexFrom);
      final object = jsonDecode(json)["result"];
      for (var obj in object) {
        result.add(SubmissionModel.fromMap(obj));
      }
    } else {
      String json = await SubmissionProviderImpl()
          .fetchSubmissionsOfUser(handle, count: count, indexFrom: indexFrom);
      final object = jsonDecode(json)["result"];
      final dateString = DateFormat("y-MM-dd").format(dateTime);
      for (var obj in object) {
        if (DateFormat("y-MM-dd").format(DateTime.fromMillisecondsSinceEpoch(
                (1000 * obj['creationTimeSeconds']).toInt())) ==
            dateString) result.add(SubmissionModel.fromMap(obj));
      }
    }
    return result;
  }
}
