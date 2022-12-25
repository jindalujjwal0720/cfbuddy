import 'dart:developer' as dev;
import 'package:bloc1/business_logic/cubit/problem_tag_chips_filter_cubit.dart';
import 'package:bloc1/business_logic/cubit/problems_list_cubit.dart';
import 'package:bloc1/views/widgets/components/empty_states.dart';
import 'package:bloc1/views/widgets/components/error_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProblemsListWidget extends StatefulWidget {
  const ProblemsListWidget({super.key});

  @override
  State<ProblemsListWidget> createState() => _ProblemsListWidgetState();
}

class _ProblemsListWidgetState extends State<ProblemsListWidget> {
  int? sortColumnIndex;
  bool isAscending = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProblemTagChipsFilterCubit, ProblemTagChipsFilterState>(
      listener: (context, state) {
        BlocProvider.of<ProblemsListCubit>(context)
            .makeProblemsList(state.selectedTags);
      },
      child: BlocBuilder<ProblemsListCubit, ProblemsListState>(
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
            List<DataRow> _rows = [];
            for (var element in state.problems) {
              _rows.add(
                DataRow(
                  cells: [
                    DataCell(
                      GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                            width: 250,
                            child: Text("${element.index}. ${element.name}")),
                      ),
                    ),
                    DataCell(Center(
                        child: Text(
                            "${element.rating == 0 ? "" : element.rating}"))),
                    DataCell(Center(child: Text("${element.solvedCount}"))),
                  ],
                ),
              );
            }
            return FittedBox(
              child: DataTable(
                sortAscending: isAscending,
                sortColumnIndex: sortColumnIndex,
                dividerThickness: 0,
                horizontalMargin: 16.0,
                columnSpacing: 16.0,
                columns: [
                  DataColumn(
                    label: const Text('Problem',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    onSort: (columnIndex, ascending) {
                      BlocProvider.of<ProblemsListCubit>(context)
                          .sortProblemsList(state,
                              byIndex: true, ascending: ascending);
                      sortColumnIndex = 0;
                      isAscending = ascending;
                    },
                  ),
                  DataColumn(
                    label: const Text('Rating',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    onSort: (columnIndex, ascending) {
                      BlocProvider.of<ProblemsListCubit>(context)
                          .sortProblemsList(state,
                              byRating: true, ascending: ascending);
                      sortColumnIndex = 1;
                      isAscending = ascending;
                    },
                  ),
                  DataColumn(
                    label: const Text('Solved',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    onSort: (columnIndex, ascending) {
                      BlocProvider.of<ProblemsListCubit>(context)
                          .sortProblemsList(state,
                              bySolved: true, ascending: ascending);
                      sortColumnIndex = 2;
                      isAscending = ascending;
                    },
                  ),
                ],
                rows: _rows,
              ),
            );
          } else if (state is ProblemsListError) {
            dev.log("Error: (Problems List Widget): ${state.message}");
            return const ErrorStates().basicErrorWidget(() {});
          } else {
            return const EmptyStates().emptyProblemsList();
          }
        },
      ),
    );
  }
}
