import 'dart:math';

import 'package:bloc1/data/models/pair.dart';
import 'package:bloc1/data/models/problem_model.dart';
import 'package:bloc1/data/models/problem_stats_model.dart';
import 'package:bloc1/data/models/submission_model.dart';
import 'package:bloc1/data/repositories/submission_repository.dart';
import 'package:intl/intl.dart';

abstract class ProblemStatsRepository {
  Future<ProblemStatsModel> getProblemStatsOfUser(String handle);
}

class ProblemStatsRepositoryImpl implements ProblemStatsRepository {
  @override
  Future<ProblemStatsModel> getProblemStatsOfUser(
    String handle, {
    bool force = true,
  }) async {
    final ProblemStatsModel stats;
    List<SubmissionModel> allSubmissions = [];

    // getting the list of submissions
    if (force) {
      allSubmissions = await SubmissionRepositoryImpl()
          .getSubmissionsOfUser(handle, count: 100000, indexFrom: 1);
    }
    double accuracyOfUser = 0;
    int tempCount = 0;
    // calculating the unique submissions (removing repeated submissions for the same problem)
    // true - in map, represent Accepted verdict
    // false - in map, represent All Other verdicts
    List<SubmissionModel> uniqueSubmissions = [];
    Map<String, bool> uniqueCorrectSubmissionsMap = {},
        uniqueAllSubmissionsMap = {};
    List<ProblemModel> uniqueUnsolvedProblems = [];
    for (var element in allSubmissions) {
      if (!(uniqueCorrectSubmissionsMap.containsKey(element.problem.name))) {
        if (element.verdict == "OK") {
          uniqueCorrectSubmissionsMap[element.problem.name] = true;
          uniqueAllSubmissionsMap[element.problem.name] = true;
          uniqueSubmissions.add(element);
        }
      }
      if (element.verdict == "OK") {
        tempCount++;
      }
    }
    accuracyOfUser = tempCount.toDouble();
    for (var element in allSubmissions) {
      if (!(element.verdict == "OK") &&
          !(uniqueAllSubmissionsMap.containsKey(element.problem.name))) {
        uniqueAllSubmissionsMap[element.problem.name] = false;
        uniqueUnsolvedProblems.add(element.problem);
        uniqueSubmissions.add(element);
      }
      if (!(element.verdict == "OK")) {
        tempCount++;
      }
    }
    accuracyOfUser = accuracyOfUser / tempCount;
    List<String> uniqueCorrectSubmissionsList = [];
    uniqueCorrectSubmissionsMap.forEach((key, value) {
      if (value == true) {
        uniqueCorrectSubmissionsList.add(key);
      }
    });

    // Calculation of different components
    Map<String, int> correctTags = {}, wrongTags = {};
    int correct = 0, wrong = 0, tle = 0, mle = 0;
    int n = uniqueSubmissions.length;
    for (int i = 0; i < n; i++) {
      if (uniqueSubmissions[i].verdict == "OK") {
        for (var tag in uniqueSubmissions[i].problem.tags) {
          correctTags[tag] =
              (correctTags[tag] == null) ? 1 : correctTags[tag]! + 1;
        }
        correct++;
      } else if (uniqueSubmissions[i].verdict == "FAILED" ||
          uniqueSubmissions[i].verdict == "WRONG_ANSWER") {
        for (var tag in uniqueSubmissions[i].problem.tags) {
          wrongTags[tag] = (wrongTags[tag] == null) ? 1 : wrongTags[tag]! + 1;
        }
        wrong++;
      } else if (uniqueSubmissions[i].verdict == "TIME_LIMIT_EXCEEDED") {
        tle++;
      } else if (uniqueSubmissions[i].verdict == "MEMORY_LIMIT_EXCEEDED") {
        mle++;
      }
    }
    List<CustomPair<String, int>> weakTagsCopy = [], strongTagsCopy = [];
    correctTags.forEach((key, value) {
      strongTagsCopy.add(CustomPair(first: key, second: value));
    });
    wrongTags.forEach((key, value) {
      weakTagsCopy.add(CustomPair(first: key, second: value));
    });
    // Sorting the tags in descending order of occurance
    weakTagsCopy.sort((a, b) => b.second.compareTo(a.second));
    strongTagsCopy.sort((a, b) => b.second.compareTo(a.second));

    List<CustomPair<String, int>> weakTags = [],
        mediumTags = [],
        strongTags = [];
    // Copying the lists
    for (var element in weakTagsCopy) {
      weakTags.add(element);
    }
    for (var element in strongTagsCopy) {
      strongTags.add(element);
    }
    // Medium tags calculation
    for (int i = 0; i < weakTagsCopy.length; i++) {
      for (int j = 0; j < strongTagsCopy.length; j++) {
        if (weakTagsCopy[i].first == strongTagsCopy[i].first) {
          double ratio =
              pow((weakTagsCopy[i].second - strongTagsCopy[i].second), 2) /
                  pow((weakTagsCopy[i].second + strongTagsCopy[i].second), 2);

          if (ratio < 0.15) {
            mediumTags.add(
              CustomPair(
                  first: weakTagsCopy[i].first,
                  second: weakTagsCopy[i].second + strongTagsCopy[i].second),
            );
            weakTags.remove(weakTagsCopy[i]);
            strongTags.remove(strongTagsCopy[i]);
          }
        }
      }
    }
    // removing common tags from medium
    mediumTags = mediumTags.toSet().toList();
    // removing the tags common to both weak and strong based on the
    // max count of problems in a particular tag
    List<CustomPair<String, int>> commonTags = [];
    commonTags.addAll(strongTags);
    commonTags.addAll(weakTags);
    for (var element in commonTags) {
      List<CustomPair<String, int>> weak =
          weakTags.where((e) => e.first == element.first).toList();
      List<CustomPair<String, int>> strong =
          strongTags.where((e) => e.first == element.first).toList();
      if (weak.isNotEmpty && strong.isNotEmpty) {
        CustomPair<String, int> tag =
            weak[0].second.compareTo(strong[0].second) < 0
                ? weak[0]
                : strong[0];
        weakTags.remove(tag);
        strongTags.remove(tag);
      }
    }

    // calculation of the problem ratings list
    Map<int, int> acceptedProblemRatingsObject = {},
        allProblemRatingsObject = {};
    for (int i = 0; i < uniqueSubmissions.length; i++) {
      if (uniqueSubmissions[i].problem.rating != null &&
          uniqueSubmissions[i].verdict == "OK") {
        int? r = uniqueSubmissions[i].problem.rating;
        if (r != null) {
          if (acceptedProblemRatingsObject[r] != null) {
            acceptedProblemRatingsObject[r] =
                acceptedProblemRatingsObject[r]! + 1;
            allProblemRatingsObject[r] = allProblemRatingsObject[r]! + 1;
          } else {
            acceptedProblemRatingsObject[r] = 1;
            allProblemRatingsObject[r] = 1;
          }
        }
      } else if (uniqueSubmissions[i].problem.rating != null) {
        int? r = uniqueSubmissions[i].problem.rating;
        if (r != null) {
          if (acceptedProblemRatingsObject[r] != null) {
            allProblemRatingsObject[r] = allProblemRatingsObject[r]! + 1;
          } else {
            allProblemRatingsObject[r] = 1;
          }
        }
      }
    }
    final List<CustomPair<int, int>> acceptedProblemRatingsList = [],
        allProblemRatingsList = [];
    acceptedProblemRatingsObject.forEach((key, value) {
      acceptedProblemRatingsList.add(CustomPair(first: key, second: value));
    });
    acceptedProblemRatingsList.sort((a, b) => a.first.compareTo(b.first));

    allProblemRatingsObject.forEach((key, value) {
      allProblemRatingsList.add(CustomPair(first: key, second: value));
    });
    allProblemRatingsList.sort((a, b) => a.first.compareTo(b.first));

    // Calculations for DateTime Problems list
    Map<String, int> countCorrectObject = {}, countAllObject = {};
    for (int i = 0; i < uniqueSubmissions.length; i++) {
      String key = DateFormat("y-MM-dd").format(
          DateTime.fromMillisecondsSinceEpoch(
              1000 * uniqueSubmissions[i].creationTimeSeconds));
      if (uniqueSubmissions[i].verdict == "OK") {
        if (countCorrectObject.containsKey(key)) {
          if (countCorrectObject[key] != null) {
            countCorrectObject[key] = countCorrectObject[key]! + 1;
          } else {
            countCorrectObject[key] = 1;
          }
        } else {
          countCorrectObject[key] = 1;
        }
      }
      if (countAllObject.containsKey(key)) {
        if (countAllObject[key] != null) {
          countAllObject[key] = countAllObject[key]! + 1;
        } else {
          countAllObject[key] = 1;
        }
      } else {
        countAllObject[key] = 1;
      }
    }
    final List<CustomPair<String, int>> countCorrectPerDateList = [],
        countAllPerDateList = [];
    countCorrectObject.forEach((key, value) {
      countCorrectPerDateList.add(CustomPair(first: key, second: value));
    });
    countAllObject.forEach((key, value) {
      countAllPerDateList.add(CustomPair(first: key, second: value));
    });
    // sorting according to dates
    countCorrectPerDateList.sort(((a, b) {
      return DateTime.parse(a.first).compareTo(DateTime.parse(b.first));
    }));
    countAllPerDateList.sort(((a, b) {
      return DateTime.parse(a.first).compareTo(DateTime.parse(b.first));
    }));

    // calculation of datetime parameters
    int thisWeek = 0, thisMonth = 0, thisYear = 0;
    int year = DateTime.now().year, month = DateTime.now().month;
    DateTime firstDayOfWeek =
        DateTime.now().subtract(Duration(days: DateTime.now().weekday));
    DateTime previousDate = DateTime.parse(countCorrectPerDateList[0].first)
        .subtract(const Duration(days: 2));
    int count = 0, maxCorrectStreak = 0, maxAllStreak = 0;
    for (int i = 0; i < countCorrectPerDateList.length; i++) {
      DateTime temp = DateTime.parse(countCorrectPerDateList[i].first);
      if (temp.year == year) {
        thisYear += countCorrectPerDateList[i].second;
        if (temp.month == month) {
          thisMonth += countCorrectPerDateList[i].second;
          if (temp.compareTo(firstDayOfWeek) >= 0) {
            thisWeek += countCorrectPerDateList[i].second;
          }
        }
      }
      if (temp.difference(previousDate).inDays == 1) {
        previousDate = temp;
        count++;
      } else {
        previousDate = temp;
        maxCorrectStreak = max(maxCorrectStreak, count);
        count = 0;
      }
    }
    previousDate = DateTime.parse(countAllPerDateList[0].first)
        .subtract(const Duration(days: 1));
    for (int i = 0; i < countAllPerDateList.length; i++) {
      DateTime temp = DateTime.parse(countAllPerDateList[i].first);
      if (temp.difference(previousDate).inDays == 1) {
        previousDate = temp;
        count++;
      } else {
        previousDate = temp;
        maxAllStreak = max(maxAllStreak, count);
        count = 0;
      }
    }

    stats = ProblemStatsModel(
      handle: handle,
      weakProblemTags: weakTags,
      mediumProblemTags: mediumTags,
      strongProblemTags: strongTags,
      correctProblems: correct,
      incorrectProblems: wrong,
      tleProblems: tle,
      mleProblems: mle,
      accuracy: accuracyOfUser,
      acceptedProblemRatings: acceptedProblemRatingsList,
      allProblemRatings: allProblemRatingsList,
      countOfProblemsOnDate: countCorrectPerDateList,
      problemCountThisWeek: thisWeek,
      problemCountThisMonth: thisMonth,
      problemCountThisYear: thisYear,
      regularCorrectDaysStreak: maxCorrectStreak,
      regularDaysStreak: maxAllStreak,
    );

    return stats;
  }
}
