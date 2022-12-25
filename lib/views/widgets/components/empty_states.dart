import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:shimmer/shimmer.dart';

class EmptyStates extends StatelessWidget {
  final bool shimmer;
  final Color bgColor = const Color.fromARGB(255, 225, 230, 235);
  // final Color bgColor = Colors.white;
  final Color shimmerHighlightColor = const Color.fromARGB(255, 232, 235, 237);
  // final Color shimmerHighlightColor = Colors.blueGrey;
  const EmptyStates({this.shimmer = true, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Widget emptyRatingChangeList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        highlightColor: shimmerHighlightColor,
        baseColor: bgColor,
        enabled: shimmer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 8, 6, 6),
              child: Container(height: 24, width: 100, color: bgColor),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: bgColor,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget emptyRatingChart() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: Shimmer.fromColors(
          highlightColor: shimmerHighlightColor,
          baseColor: bgColor,
          enabled: shimmer,
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget emptyUsersList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        highlightColor: shimmerHighlightColor,
        baseColor: bgColor,
        enabled: shimmer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircleAvatar(
                            backgroundColor: bgColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 20,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: bgColor,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                height: 16,
                                width: 140,
                                decoration: BoxDecoration(
                                  color: bgColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 20,
                          width: 30,
                          decoration: BoxDecoration(
                            color: bgColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget emptyUserCard() {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Shimmer.fromColors(
          highlightColor: shimmerHighlightColor,
          baseColor: bgColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 8, 8, 8),
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: bgColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 4.0),
                          child: Container(
                            height: 14,
                            width: 36,
                            decoration: BoxDecoration(
                              color: bgColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 4.0),
                          child: Container(
                            height: 16,
                            width: 50,
                            decoration: BoxDecoration(
                              color: bgColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 4.0),
                          child: Container(
                            height: 14,
                            width: 36,
                            decoration: BoxDecoration(
                              color: bgColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 4.0),
                          child: Container(
                            height: 16,
                            width: 50,
                            decoration: BoxDecoration(
                              color: bgColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 4.0),
                          child: Container(
                            height: 14,
                            width: 36,
                            decoration: BoxDecoration(
                              color: bgColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 4.0),
                          child: Container(
                            height: 16,
                            width: 50,
                            decoration: BoxDecoration(
                              color: bgColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 100,
                          decoration: BoxDecoration(
                            color: bgColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 16,
                          width: 140,
                          decoration: BoxDecoration(
                            color: bgColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                child: Container(
                  height: 14,
                  width: 180,
                  decoration: BoxDecoration(
                    color: bgColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget emptySubmissionsList() {
    List<DataRow> _rows = [];
    for (int i = 0; i < 5; i++) {
      _rows.add(
        DataRow(cells: [
          DataCell(Container(
            width: 120,
            height: 24,
            decoration: BoxDecoration(
                color: bgColor, borderRadius: BorderRadius.circular(3.0)),
          )),
          DataCell(Container(
            width: 40,
            height: 24,
            decoration: BoxDecoration(
                color: bgColor, borderRadius: BorderRadius.circular(3.0)),
          )),
          DataCell(Container(
            width: 40,
            height: 24,
            decoration: BoxDecoration(
                color: bgColor, borderRadius: BorderRadius.circular(3.0)),
          )),
          DataCell(Container(
            width: 40,
            height: 24,
            decoration: BoxDecoration(
                color: bgColor, borderRadius: BorderRadius.circular(3.0)),
          )),
        ]),
      );
    }

    return Shimmer.fromColors(
      highlightColor: shimmerHighlightColor,
      baseColor: bgColor,
      enabled: shimmer,
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DataTable(
            dividerThickness: 0,
            columnSpacing: 16.0,
            horizontalMargin: 16.0,
            columns: [
              DataColumn(
                  label: Center(
                      child: Container(
                width: 160,
                height: 24,
                decoration: BoxDecoration(
                    color: bgColor, borderRadius: BorderRadius.circular(3.0)),
              ))),
              DataColumn(
                  label: Center(
                      child: Container(
                width: 50,
                height: 24,
                decoration: BoxDecoration(
                    color: bgColor, borderRadius: BorderRadius.circular(3.0)),
              ))),
              DataColumn(
                  label: Center(
                      child: Container(
                width: 50,
                height: 24,
                decoration: BoxDecoration(
                    color: bgColor, borderRadius: BorderRadius.circular(3.0)),
              ))),
              DataColumn(
                  label: Center(
                      child: Container(
                width: 50,
                height: 24,
                decoration: BoxDecoration(
                    color: bgColor, borderRadius: BorderRadius.circular(3.0)),
              ))),
            ],
            rows: _rows,
          ),
        ),
      ),
    );
  }

  Widget emptyProblemsList() {
    List<DataRow> _rows = [];
    for (int i = 0; i < 5; i++) {
      _rows.add(
        DataRow(cells: [
          DataCell(SizedBox(
            width: 250,
            child: Container(
              width: 120,
              height: 24,
              decoration: BoxDecoration(
                  color: bgColor, borderRadius: BorderRadius.circular(3.0)),
            ),
          )),
          DataCell(Container(
            width: 40,
            height: 24,
            decoration: BoxDecoration(
                color: bgColor, borderRadius: BorderRadius.circular(3.0)),
          )),
          DataCell(Container(
            width: 40,
            height: 24,
            decoration: BoxDecoration(
                color: bgColor, borderRadius: BorderRadius.circular(3.0)),
          )),
        ]),
      );
    }

    return Shimmer.fromColors(
      highlightColor: shimmerHighlightColor,
      baseColor: bgColor,
      enabled: shimmer,
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DataTable(
            dividerThickness: 0,
            columnSpacing: 16.0,
            horizontalMargin: 16.0,
            columns: [
              DataColumn(
                  label: Center(
                      child: Container(
                width: 160,
                height: 24,
                decoration: BoxDecoration(
                    color: bgColor, borderRadius: BorderRadius.circular(3.0)),
              ))),
              DataColumn(
                  label: Center(
                      child: Container(
                width: 50,
                height: 24,
                decoration: BoxDecoration(
                    color: bgColor, borderRadius: BorderRadius.circular(3.0)),
              ))),
              DataColumn(
                  label: Center(
                      child: Container(
                width: 50,
                height: 24,
                decoration: BoxDecoration(
                    color: bgColor, borderRadius: BorderRadius.circular(3.0)),
              ))),
            ],
            rows: _rows,
          ),
        ),
      ),
    );
  }

  Widget emptyHomePage() {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Shimmer.fromColors(
        highlightColor: shimmerHighlightColor,
        baseColor: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 100,
              color: bgColor,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bgColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget emptyUserDetailsPage() {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Shimmer.fromColors(
        highlightColor: shimmerHighlightColor,
        baseColor: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 100,
              color: bgColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget emptyChipsWidget() {
    List<int> widths = [70, 60, 60, 58, 70, 100, 40, 120, 50, 70, 80];
    return Shimmer.fromColors(
      highlightColor: shimmerHighlightColor,
      baseColor: bgColor,
      child: Wrap(
        children: [
          for (int i = 0; i < widths.length; i++)
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                height: 26,
                width: widths[i].toDouble(),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget emptyUserStatsWidget() {
    return Shimmer.fromColors(
      highlightColor: shimmerHighlightColor,
      baseColor: bgColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: bgColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: bgColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: bgColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: bgColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: bgColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: bgColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget emptyContestsListWidget() {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Shimmer.fromColors(
                  highlightColor: shimmerHighlightColor,
                  baseColor: bgColor,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 20,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: bgColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Container(
                                  height: 16,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget emptyHeatmapWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        highlightColor: shimmerHighlightColor,
        baseColor: bgColor,
        child: HeatMap(
          colorMode: ColorMode.color,
          scrollable: true,
          colorsets: {
            1: bgColor,
          },
          showColorTip: false,
        ),
      ),
    );
  }
}

int generateRandomInt(int min, int max) {
  Random random = Random();
  int rand = random.nextInt(max);
  while (rand < min) {
    rand = random.nextInt(max);
  }
  return rand;
}
