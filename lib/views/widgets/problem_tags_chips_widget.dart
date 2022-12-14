import 'package:bloc1/business_logic/cubit/problem_tags_chips_cubit.dart';
import 'package:bloc1/data/models/problem_stats_model.dart';
import 'package:bloc1/views/widgets/components/empty_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProblemTagsChipsWidget extends StatelessWidget {
  final String handle;
  const ProblemTagsChipsWidget(this.handle, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProblemTagsChipsCubit, ProblemTagsChipsState>(
      builder: (context, state) {
        if (state is ProblemTagsChipsLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  for (var tag in state.stats.strongProblemTags)
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Text(tag.first),
                        decoration: BoxDecoration(
                          color: Colors.green[calculateShade(
                              tag.second, state.stats.correctProblems)],
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(color: Colors.green[400]!),
                        ),
                      ),
                    )
                ],
              ),
              Wrap(
                children: [
                  for (var tag in state.stats.mediumProblemTags)
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Text(tag.first),
                        decoration: BoxDecoration(
                          color: Colors.amber[
                              calculateShadeFromTags(tag.second, state.stats)],
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(color: Colors.amber[400]!),
                        ),
                      ),
                    )
                ],
              ),
              Wrap(
                children: [
                  for (var tag in state.stats.weakProblemTags)
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Text(tag.first),
                        decoration: BoxDecoration(
                          color: Colors.red[calculateShade(
                              tag.second, state.stats.incorrectProblems)],
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(color: Colors.red[400]!),
                        ),
                      ),
                    )
                ],
              ),
            ],
          );
        } else if (state is ProblemTagsChipsError) {
          return Text("Error: ${state.message}");
        } else {
          return const EmptyStates().emptyChipsWidget();
        }
      },
    );
  }
}

int calculateShade(int value, int total) {
  double perc = value * 100 / total;
  if (perc < 5) {
    return 100;
  } else if (perc < 10) {
    return 200;
  } else {
    return 300;
  }
}

int calculateShadeFromTags(int value, ProblemStatsModel stats) {
  int total = 0;
  for (var element in stats.mediumProblemTags) {
    total += element.second;
  }
  return calculateShade(value, total);
}
