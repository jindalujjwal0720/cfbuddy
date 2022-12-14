import 'package:bloc1/business_logic/cubit/rating_change_chart_cubit.dart';
import 'package:bloc1/data/models/chart_point_model.dart';
import 'package:bloc1/views/widgets/components/empty_states.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';

class RatingChangeChart extends StatelessWidget {
  const RatingChangeChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingChangeChartCubit, RatingChangeChartState>(
        builder: (context, state) {
      if (state is RatingChangeChartLoaded) {
        final List<charts.Series<ChartPointModel, DateTime>> seriesList =
            _createData(state.handlesChartPoints);
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: AspectRatio(
            aspectRatio: 3 / 2,
            child: charts.TimeSeriesChart(
              seriesList,
              animate: false,
              defaultRenderer: charts.LineRendererConfig(),
              dateTimeFactory: const charts.LocalDateTimeFactory(),
              behaviors: [
                charts.LinePointHighlighter(
                  showHorizontalFollowLine:
                      charts.LinePointHighlighterFollowLineType.none,
                  showVerticalFollowLine:
                      charts.LinePointHighlighterFollowLineType.none,
                ),
              ],
            ),
          ),
        );
      } else if (state is RatingChangeChartError) {
        return Text("Error from ratings change chart: ${state.message}");
      } else {
        return const EmptyStates().emptyRatingChart();
      }
    });
  }

  List<charts.Series<ChartPointModel, DateTime>> _createData(
      List<List<ChartPointModel>> data) {
    List seriesColors = [
      charts.MaterialPalette.blue.shadeDefault,
      charts.MaterialPalette.green.shadeDefault,
      charts.MaterialPalette.red.shadeDefault,
      charts.MaterialPalette.yellow.shadeDefault,
    ];
    return [
      for (int i = 0; i < data.length; i++)
        charts.Series<ChartPointModel, DateTime>(
          id: "1",
          colorFn: (_, __) => seriesColors[i % seriesColors.length],
          domainFn: (ChartPointModel rating, _) => rating.date,
          measureFn: (ChartPointModel rating, _) => rating.value,
          data: data[i],
        ),
    ];
  }
}
