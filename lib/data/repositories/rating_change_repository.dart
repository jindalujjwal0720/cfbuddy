import 'dart:convert';
import 'package:bloc1/data/dataproviders/rating_change_provider.dart';
import 'package:bloc1/data/models/chart_point_model.dart';
import 'package:bloc1/data/models/rating_change_model.dart';

abstract class RatingChangeRepository {
  Future<List<RatingChangeModel>> getRatingChanges(String handle);
  Future<List<ChartPointModel>> getRatingChangesChartPoints(String handle);
}

class RatingChangeRepositoryImpl implements RatingChangeRepository {
  @override
  Future<List<RatingChangeModel>> getRatingChanges(String handle) async {
    List<RatingChangeModel> result = [];
    String json = await RatingChangeProviderImpl().fetchRatingChanges(handle);
    final object = jsonDecode(json)["result"];
    for (var obj in object) {
      result.add(RatingChangeModel.fromMap(obj));
    }
    // Sorting according to the latest time
    result.sort((a, b) =>
        b.ratingUpdateTimeSeconds.compareTo(a.ratingUpdateTimeSeconds));
    return result;
  }

  @override
  Future<List<ChartPointModel>> getRatingChangesChartPoints(
      String handle) async {
    List<ChartPointModel> f = [];
    List<RatingChangeModel> ratings = await getRatingChanges(handle);
    for (var rating in ratings) {
      f.add(ChartPointModel(
          date: DateTime.fromMillisecondsSinceEpoch(
              rating.ratingUpdateTimeSeconds * 1000),
          value: rating.newRating));
    }
    return f;
  }
}
