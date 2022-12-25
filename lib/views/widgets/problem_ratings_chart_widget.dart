import 'package:bloc1/business_logic/cubit/problem_rating_chart_cubit.dart';
import 'package:bloc1/views/widgets/components/empty_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as dev;
import '../../utils/helper_functions_ans_widgets.dart';
import 'components/error_states.dart';

class ProblemRatingsChartWidget extends StatelessWidget {
  final String handle;
  const ProblemRatingsChartWidget(this.handle, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProblemRatingChartCubit, ProblemRatingChartState>(
        builder: (context, state) {
      if (state is ProblemRatingChartLoaded) {
        List<double> acceptedRatings = [], acceptedCounts = [];
        for (var rating in state.stats.acceptedProblemRatings) {
          acceptedRatings.add(rating.first.toDouble());
          acceptedCounts.add(rating.second.toDouble());
        }
        List<double> allRatings = [], allCounts = [];
        for (var rating in state.stats.allProblemRatings) {
          allRatings.add(rating.first.toDouble());
          allCounts.add(rating.second.toDouble());
        }
        return makeVerticalBars(
          count: acceptedRatings.length,
          fractions: acceptedCounts,
          secondaryFractions: allCounts,
          colors: [
            for (int i = 0; i < acceptedRatings.length; i++)
              codeforcesColorScheme(acceptedRatings[i].toInt()),
          ],
          normalise: false,
          labels: [
            for (int i = 0; i < acceptedRatings.length; i++)
              Text(
                "${acceptedRatings[i].toInt()}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              )
          ],
          secondaryLabels: [
            for (int i = 0; i < acceptedRatings.length; i++)
              Text(
                "${acceptedCounts[i].toInt()}",
                style: TextStyle(
                  fontSize: 12,
                  color: codeforcesColorScheme(acceptedRatings[i].toInt()),
                ),
              ),
          ],
          thickness: 10,
        );
      } else if (state is ProblemRatingChartError) {
        dev.log("Error: (Problem rating chart widget) - ${state.message}");
        return const ErrorStates().basicErrorWidget(() {});
      } else {
        return const EmptyStates().emptyRatingChart();
      }
    });
  }
}
