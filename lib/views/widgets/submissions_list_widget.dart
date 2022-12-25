// ignore_for_file: must_be_immutable
import 'dart:developer' as dev;
import 'package:bloc1/business_logic/cubit/submission_code_viewer_cubit.dart';
import 'package:bloc1/business_logic/cubit/submissions_list_cubit.dart';
import 'package:bloc1/utils/helper_functions_ans_widgets.dart';
import 'package:bloc1/views/widgets/components/dialog_widgets.dart';
import 'package:bloc1/views/widgets/components/empty_states.dart';
import 'package:bloc1/views/widgets/components/error_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmissionsListWidget extends StatelessWidget {
  final double height;
  const SubmissionsListWidget(this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubmissionCodeViewerCubit, SubmissionCodeViewerState>(
      listener: (context, state) {
        if (state is SubmissionCodeViewerDialogLoading) {
          showDialog(
            context: context,
            builder: (context) => const SubmissionCodeViewerDialog(),
          );
        }
      },
      child: BlocBuilder<SubmissionsListCubit, SubmissionsListState>(
        builder: (context, state) {
          if (state is SubmissionsListLoaded) {
            List<DataRow> _rows = [];
            for (var element in state.submissions) {
              _rows.add(
                DataRow(cells: [
                  DataCell(
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<SubmissionCodeViewerCubit>(context)
                            .makeSubmissionCodeDialog(element);
                      },
                      child: SizedBox(
                          width: 200,
                          child: Text(
                              "${element.problem.index}. ${element.problem.name}")),
                    ),
                  ),
                  DataCell(
                      Center(child: submissionVerdictWidget(element.verdict))),
                  DataCell(
                      Center(child: Text("${element.timeConsumedMillis}"))),
                  DataCell(Center(
                      child: Text(memoryToString(element.memoryConsumedBytes))))
                ]),
              );
            }

            if (state.submissions.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(36.0),
                  child: Text(
                    "No submissions yet!",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }

            return ConstrainedBox(
              constraints: BoxConstraints(maxHeight: height),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(shrinkWrap: true, children: [
                      FittedBox(
                        child: DataTable(
                          dividerThickness: 0,
                          horizontalMargin: 16.0,
                          columnSpacing: 16.0,
                          columns: const [
                            DataColumn(
                                label: Text('Submission',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Verdict',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Time',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Memory',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold))),
                          ],
                          rows: _rows,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            );
          } else if (state is SubmissionsListError) {
            dev.log("Error: (Submissions List widget) - ${state.message}");
            return const ErrorStates().basicErrorWidget(() {});
          } else {
            return const EmptyStates().emptySubmissionsList();
          }
        },
      ),
    );
  }
}
