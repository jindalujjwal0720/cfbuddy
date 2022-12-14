import 'package:bloc/bloc.dart';
import 'package:bloc1/data/models/chart_point_model.dart';
import 'package:bloc1/data/repositories/rating_change_repository.dart';
import 'package:equatable/equatable.dart';

part 'rating_change_chart_state.dart';

class RatingChangeChartCubit extends Cubit<RatingChangeChartState> {
  RatingChangeChartCubit() : super(RatingChangeChartInitial());

  Future<void> makeRatingsChart(List<String> handles) async {
    emit(RatingChangeChartLoading());
    List<List<ChartPointModel>> handlesChartPoints = [];
    try {
      for (var handle in handles) {
        List<ChartPointModel> temp = await RatingChangeRepositoryImpl()
            .getRatingChangesChartPoints(handle);
        handlesChartPoints.add(temp);
      }
    } catch (e) {
      emit(RatingChangeChartError(e.toString()));
    }
    emit(RatingChangeChartLoaded(handlesChartPoints));
  }
}
