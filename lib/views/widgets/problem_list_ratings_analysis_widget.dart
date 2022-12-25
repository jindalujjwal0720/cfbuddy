import 'package:bloc1/business_logic/cubit/problems_list_cubit.dart';
import 'package:bloc1/views/widgets/components/empty_states.dart';
import 'package:bloc1/views/widgets/components/error_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/helper_functions_ans_widgets.dart';

class ProblemsRatingsAnalysisWidget extends StatelessWidget {
  const ProblemsRatingsAnalysisWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProblemsListCubit, ProblemsListState>(
      builder: (context, state) {
        if (state is ProblemsListLoaded) {
          if (state.problems.isEmpty) {
            return const Padding(
              padding: EdgeInsets.all(36.0),
              child: Center(
                child: Text(
                  "Choose some filter",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }
          return makeVerticalBars(
            count: state.ratings.length,
            fractions: [
              for (var element in state.countOfRatings) element.toDouble(),
            ],
            labels: [
              for (var element in state.ratings)
                Text(
                  "${element == 0 ? 'nan' : element}",
                  style: const TextStyle(
                    fontSize: 12.0,
                  ),
                ),
            ],
            secondaryLabels: [
              for (var element in state.countOfRatings)
                Text(
                  "$element",
                  style: const TextStyle(
                    fontSize: 10.0,
                    color: Colors.grey,
                  ),
                ),
            ],
            colors: [
              for (int i = 0; i < state.ratings.length; i++)
                codeforcesColorScheme(state.ratings[i]),
            ],
            normalise: false,
          );
        } else if (state is ProblemsListLoading) {
          return const EmptyStates().emptyRatingChart();
        } else {
          return const ErrorStates().basicErrorWidget(() {});
        }
      },
    );
  }
}
