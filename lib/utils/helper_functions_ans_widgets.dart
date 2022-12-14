import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String createDateTimeFromTimeStamp(int timestamp,
    {bool completeDateTime = false}) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  Duration difference = DateTime.now().difference(date);

  String dateTimeString = "";
  if (difference.inMinutes < 60) {
    dateTimeString = "Few Minutes Ago";
  } else if (difference.inHours < 24) {
    dateTimeString = "Few Hours Ago";
  } else if (difference.inDays < 2) {
    dateTimeString = "Few Days Ago";
  } else if (difference.inDays < 8) {
    // day of week
    dateTimeString = DateFormat('EEEE').format(date);
  } else if (difference.inDays < 365) {
    String month = DateFormat("MMMM").format(date).length > 4
        ? DateFormat("MMMM").format(date).substring(0, 3)
        : DateFormat("MMMM").format(date);
    dateTimeString = "$month ${DateFormat("d").format(date)}";
  } else {
    dateTimeString = "${(difference.inDays / 365) as int} Years Ago";
  }
  if (completeDateTime == true) {
    dateTimeString =
        "${DateFormat('yMMMMd').format(date)}. ${DateFormat('jm').format(date)}";
  }
  return dateTimeString;
}

Color codeforcesColorScheme(int rating) {
  if (rating < 1200) {
    return Colors.grey;
  } else if (rating < 1400) {
    return Colors.green;
  } else if (rating < 1600) {
    return Colors.teal;
  } else if (rating < 1900) {
    return const Color.fromARGB(255, 79, 100, 219);
  } else if (rating < 2100) {
    return const Color.fromARGB(255, 189, 49, 213);
  } else if (rating < 2300) {
    return Colors.yellow[700]!;
  } else if (rating < 2400) {
    return Colors.amber[700]!;
  } else if (rating < 2600) {
    return Colors.redAccent;
  } else if (rating < 3000) {
    return Colors.red;
  } else {
    return const Color.fromARGB(255, 144, 17, 7);
  }
}

String memoryToString(int memoryInBytes) {
  if (memoryInBytes < 100) {
    return "${memoryInBytes}B";
  } else if (memoryInBytes < 1024 * 100) {
    return "${(memoryInBytes / 1024).toStringAsFixed(2)}Kb";
  } else {
    return "${(memoryInBytes / (1024 * 1024)).toStringAsFixed(2)}Mb";
  }
}

Widget submissionVerdictWidget(String verdict) {
  switch (verdict) {
    case "OK":
      return const Text(
        "AC",
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      );
    case "WRONG_ANSWER":
      return const Icon(
        Icons.close_rounded,
        color: Colors.red,
      );
    case "FAILED":
      return const Icon(
        Icons.close_rounded,
        color: Colors.red,
        size: 20,
      );
    case "TIME_LIMIT_EXCEEDED":
      return const Icon(
        Icons.alarm_rounded,
        color: Colors.orange,
        size: 20,
      );
    case "MEMORY_LIMIT_EXCEEDED":
      return const Icon(
        Icons.memory_rounded,
        color: Colors.orange,
        size: 20,
      );
    case "COMPILATION_ERROR":
      return const Text(
        "CE",
        style: TextStyle(
          color: Colors.brown,
          fontWeight: FontWeight.bold,
        ),
      );

    default:
      return const Text(
        "ERR",
        style: TextStyle(
          color: Colors.brown,
          fontWeight: FontWeight.bold,
        ),
      );
  }
}

Widget makeHorizontalBars({
  int count = 1,
  List<double> fractions = const [1],
  List<Color> colors = const [Colors.blue],
  bool normalise = true,
}) {
  // Normalising fractions
  double maxFrac = fractions[0];
  for (var f in fractions) {
    maxFrac = max(maxFrac, f);
  }
  for (int i = 0; i < fractions.length; i++) {
    if (normalise) {
      fractions[i] = (fractions[i] / maxFrac);
    } else {
      fractions[i] = (fractions[i] / max(0.85, maxFrac));
    }
  }

  return Padding(
    padding:
        const EdgeInsets.only(left: 8.0, top: 6.0, right: 8.0, bottom: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < count; i++)
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: FractionallySizedBox(
              widthFactor: fractions[i % fractions.length],
              child: Container(
                height: 12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: colors[i % colors.length],
                ),
              ),
            ),
          ),
      ],
    ),
  );
}

Widget makeVerticalBars({
  int count = 1,
  List<double> fractions = const [1],
  List<double> secondaryFractions = const [],
  List<Color> colors = const [Colors.blue],
  bool normalise = true,
  double aspectRatio = 3 / 2,
  double thickness = 10,
  List<Widget> labels = const [],
  List<Widget> secondaryLabels = const [],
}) {
  // Normalising fractions
  double maxFrac = fractions[0];
  for (var f in fractions) {
    maxFrac = max(maxFrac, f);
  }
  if (secondaryFractions.isNotEmpty) {
    for (var f in secondaryFractions) {
      maxFrac = max(maxFrac, f);
    }
  }
  for (int i = 0; i < fractions.length; i++) {
    if (normalise) {
      fractions[i] = (fractions[i] / maxFrac);
    } else {
      fractions[i] = (fractions[i] / max(0.85, maxFrac));
    }
    fractions[i] = max(fractions[i], 0.15);
  }
  for (int i = 0; i < secondaryFractions.length; i++) {
    if (normalise) {
      secondaryFractions[i] = (secondaryFractions[i] / maxFrac);
    } else {
      secondaryFractions[i] = (secondaryFractions[i] / max(0.85, maxFrac));
    }
    secondaryFractions[i] = max(secondaryFractions[i], 0.15);
  }

  return Column(
    children: [
      AspectRatio(
        aspectRatio: aspectRatio,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 8.0, top: 6.0, right: 8.0, bottom: 8.0),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < count; i++)
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                if (secondaryFractions.isNotEmpty)
                                  FractionallySizedBox(
                                    alignment: Alignment.bottomCenter,
                                    heightFactor: secondaryFractions[
                                        i % secondaryFractions.length],
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4.0, bottom: 4.0),
                                      child: Container(
                                        width: thickness + 4,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          boxShadow: [
                                            const BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 227, 230, 240),
                                              offset: Offset(0.0, 0.0),
                                            ),
                                            BoxShadow(
                                              offset: const Offset(0.0, 0.0),
                                              color: Colors.grey[50]!,
                                              spreadRadius: -2,
                                              blurRadius: 3,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                FractionallySizedBox(
                                  alignment: Alignment.bottomCenter,
                                  heightFactor: fractions[i % fractions.length],
                                  child: Column(
                                    children: [
                                      if (secondaryLabels.isNotEmpty)
                                        secondaryLabels[
                                            i % secondaryLabels.length],
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4.0, bottom: 6.0),
                                          child: Container(
                                            width: thickness,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color:
                                                    colors[i % colors.length],
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    offset: Offset(1, 3),
                                                    blurRadius: 4,
                                                  ),
                                                  BoxShadow(
                                                    offset: Offset(-2, -3),
                                                    color: Colors.white,
                                                    blurRadius: 4,
                                                  )
                                                ]),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (labels.isNotEmpty) labels[i % labels.length],
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
