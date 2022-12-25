import 'package:bloc1/business_logic/cubit/problem_tag_chips_filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProblemTagChipsFilterWidget extends StatelessWidget {
  const ProblemTagChipsFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Text(
              "Add Filter",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          BlocBuilder<ProblemTagChipsFilterCubit, ProblemTagChipsFilterState>(
            builder: (context, state) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 1000,
                  child: Wrap(
                    children: [
                      for (var tag in state.tags)
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<ProblemTagChipsFilterCubit>(context)
                                .changeSelection(tag: tag);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              child: Text(
                                tag,
                                style: TextStyle(
                                    fontWeight:
                                        (state.selectedTags.contains(tag))
                                            ? FontWeight.w500
                                            : FontWeight.normal,
                                    color: (state.selectedTags.contains(tag))
                                        ? Colors.blue[800]
                                        : Colors.grey),
                              ),
                              decoration: BoxDecoration(
                                color: (state.selectedTags.contains(tag))
                                    ? Colors.blue[50]
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                    color: (state.selectedTags.contains(tag))
                                        ? Colors.blue[800]!
                                        : Colors.grey),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
