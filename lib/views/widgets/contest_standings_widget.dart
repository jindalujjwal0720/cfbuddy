import 'package:bloc1/business_logic/cubit/contest_standings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContestStandingsWidget extends StatelessWidget {
  final double height;
  const ContestStandingsWidget(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContestStandingsCubit, ContestStandingsState>(
      builder: (context, state) {
        if (state is ContestStandingsLoaded) {
          List<DataRow> _rows = [];
          for (var element in state.standings.rows) {
            _rows.add(DataRow(cells: [
              DataCell(Text(element.party.members[0].handle)),
              DataCell(Center(child: Text("${element.points.toInt()}"))),
              DataCell(Center(child: Text("${element.penalty}"))),
              for (var e in element.problemResults)
                DataCell(
                  Center(
                    child: pointsAndRejectedCountWidget(
                        e.points.toInt(), e.rejectedAttemptCount),
                  ),
                ),
            ]));
          }
          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: height),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      state.standings.contest.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.standings.problems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                            "${state.standings.problems[index].index}. ${state.standings.problems[index].name}"),
                      );
                    },
                  ),
                  FittedBox(
                    child: DataTable(
                      dividerThickness: 0,
                      horizontalMargin: 16.0,
                      columnSpacing: 16.0,
                      columns: [
                        const DataColumn(
                            label: Text('Handle',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ))),
                        const DataColumn(
                            label: Text('Points',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ))),
                        const DataColumn(
                            label: Text('Penalty',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ))),
                        for (var e in state.standings.problems)
                          DataColumn(
                              label: Text(e.index,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ))),
                      ],
                      rows: _rows,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(child: Text("Loading..."));
      },
    );
  }
}

Widget pointsAndRejectedCountWidget(int points, int rejectedCount) {
  if (rejectedCount > 0) {
    if (points > 0) {
      return Text(
        "+$rejectedCount",
        style: const TextStyle(color: Colors.green),
      );
    } else {
      return Text(
        "-$rejectedCount",
        style: const TextStyle(color: Colors.red),
      );
    }
  } else if (points > 0) {
    return const Text(
      "+",
      style: TextStyle(color: Colors.green),
    );
  } else {
    return const Text(
      "0",
      style: TextStyle(color: Colors.grey),
    );
  }
}
