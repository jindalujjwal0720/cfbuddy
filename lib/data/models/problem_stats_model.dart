// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:bloc1/data/models/pair.dart';

/// strong tags - topic is strong
/// weak tags - user is weak in that topic
/// accepted problem ratings - (ratings, number of problems of that rating)
class ProblemStatsModel extends Equatable {
  final String handle;
  final List<CustomPair<String, int>> weakProblemTags;
  final List<CustomPair<String, int>> mediumProblemTags;
  final List<CustomPair<String, int>> strongProblemTags;
  final int correctProblems;
  final int incorrectProblems;
  final int tleProblems;
  final int mleProblems;
  final double accuracy;
  final List<CustomPair<int, int>> acceptedProblemRatings;
  final List<CustomPair<int, int>> allProblemRatings;
  final List<CustomPair<String, int>> countOfProblemsOnDate;
  final int problemCountThisWeek;
  final int problemCountThisMonth;
  final int problemCountThisYear;
  final int regularCorrectDaysStreak;
  final int regularDaysStreak;
  const ProblemStatsModel({
    required this.handle,
    required this.weakProblemTags,
    required this.mediumProblemTags,
    required this.strongProblemTags,
    required this.correctProblems,
    required this.incorrectProblems,
    required this.tleProblems,
    required this.mleProblems,
    required this.accuracy,
    required this.acceptedProblemRatings,
    required this.allProblemRatings,
    required this.countOfProblemsOnDate,
    required this.problemCountThisWeek,
    required this.problemCountThisMonth,
    required this.problemCountThisYear,
    required this.regularCorrectDaysStreak,
    required this.regularDaysStreak,
  });

  @override
  List<Object> get props {
    return [
      handle,
      weakProblemTags,
      mediumProblemTags,
      strongProblemTags,
      correctProblems,
      incorrectProblems,
      tleProblems,
      mleProblems,
      accuracy,
      acceptedProblemRatings,
      allProblemRatings,
      countOfProblemsOnDate,
      problemCountThisWeek,
      problemCountThisMonth,
      problemCountThisYear,
      regularCorrectDaysStreak,
      regularDaysStreak,
    ];
  }

  ProblemStatsModel copyWith({
    String? handle,
    List<CustomPair<String, int>>? weakProblemTags,
    List<CustomPair<String, int>>? mediumProblemTags,
    List<CustomPair<String, int>>? strongProblemTags,
    int? correctProblems,
    int? incorrectProblems,
    int? tleProblems,
    int? mleProblems,
    double? accuracy,
    List<CustomPair<int, int>>? acceptedProblemRatings,
    List<CustomPair<int, int>>? allProblemRatings,
    List<CustomPair<String, int>>? countOfProblemsOnDate,
    int? problemCountThisWeek,
    int? problemCountThisMonth,
    int? problemCountThisYear,
    int? regularCorrectDaysStreak,
    int? regularDaysStreak,
  }) {
    return ProblemStatsModel(
      handle: handle ?? this.handle,
      weakProblemTags: weakProblemTags ?? this.weakProblemTags,
      mediumProblemTags: mediumProblemTags ?? this.mediumProblemTags,
      strongProblemTags: strongProblemTags ?? this.strongProblemTags,
      correctProblems: correctProblems ?? this.correctProblems,
      incorrectProblems: incorrectProblems ?? this.incorrectProblems,
      tleProblems: tleProblems ?? this.tleProblems,
      mleProblems: mleProblems ?? this.mleProblems,
      accuracy: accuracy ?? this.accuracy,
      acceptedProblemRatings:
          acceptedProblemRatings ?? this.acceptedProblemRatings,
      allProblemRatings: allProblemRatings ?? this.allProblemRatings,
      countOfProblemsOnDate:
          countOfProblemsOnDate ?? this.countOfProblemsOnDate,
      problemCountThisWeek: problemCountThisWeek ?? this.problemCountThisWeek,
      problemCountThisMonth:
          problemCountThisMonth ?? this.problemCountThisMonth,
      problemCountThisYear: problemCountThisYear ?? this.problemCountThisYear,
      regularCorrectDaysStreak:
          regularCorrectDaysStreak ?? this.regularCorrectDaysStreak,
      regularDaysStreak: regularDaysStreak ?? this.regularDaysStreak,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'handle': handle,
      'weakProblemTags': weakProblemTags.map((x) => x.toMap()).toList(),
      'mediumProblemTags': mediumProblemTags.map((x) => x.toMap()).toList(),
      'strongProblemTags': strongProblemTags.map((x) => x.toMap()).toList(),
      'correctProblems': correctProblems,
      'incorrectProblems': incorrectProblems,
      'tleProblems': tleProblems,
      'mleProblems': mleProblems,
      'accuracy': accuracy,
      'acceptedProblemRatings':
          acceptedProblemRatings.map((x) => x.toMap()).toList(),
      'allProblemRatings': allProblemRatings.map((x) => x.toMap()).toList(),
      'countOfProblemsOnDate':
          countOfProblemsOnDate.map((x) => x.toMap()).toList(),
      'problemCountThisWeek': problemCountThisWeek,
      'problemCountThisMonth': problemCountThisMonth,
      'problemCountThisYear': problemCountThisYear,
      'regularCorrectDaysStreak': regularCorrectDaysStreak,
      'regularDaysStreak': regularDaysStreak,
    };
  }

  factory ProblemStatsModel.fromMap(Map<String, dynamic> map) {
    return ProblemStatsModel(
      handle: map['handle'] as String,
      weakProblemTags: List<CustomPair<String, int>>.from(
        (map['weakProblemTags'] as List<int>).map<CustomPair<String, int>>(
          (x) => CustomPair<String, int>.fromMap(x as Map<String, dynamic>),
        ),
      ),
      mediumProblemTags: List<CustomPair<String, int>>.from(
        (map['mediumProblemTags'] as List<int>).map<CustomPair<String, int>>(
          (x) => CustomPair<String, int>.fromMap(x as Map<String, dynamic>),
        ),
      ),
      strongProblemTags: List<CustomPair<String, int>>.from(
        (map['strongProblemTags'] as List<int>).map<CustomPair<String, int>>(
          (x) => CustomPair<String, int>.fromMap(x as Map<String, dynamic>),
        ),
      ),
      correctProblems: map['correctProblems'] as int,
      incorrectProblems: map['incorrectProblems'] as int,
      tleProblems: map['tleProblems'] as int,
      mleProblems: map['mleProblems'] as int,
      accuracy: map['accuracy'] as double,
      acceptedProblemRatings: List<CustomPair<int, int>>.from(
        (map['acceptedProblemRatings'] as List<int>).map<CustomPair<int, int>>(
          (x) => CustomPair<int, int>.fromMap(x as Map<String, dynamic>),
        ),
      ),
      allProblemRatings: List<CustomPair<int, int>>.from(
        (map['allProblemRatings'] as List<int>).map<CustomPair<int, int>>(
          (x) => CustomPair<int, int>.fromMap(x as Map<String, dynamic>),
        ),
      ),
      countOfProblemsOnDate: List<CustomPair<String, int>>.from(
        (map['countOfProblemsOnDate'] as List<int>)
            .map<CustomPair<String, int>>(
          (x) => CustomPair<String, int>.fromMap(x as Map<String, dynamic>),
        ),
      ),
      problemCountThisWeek: map['problemCountThisWeek'] as int,
      problemCountThisMonth: map['problemCountThisMonth'] as int,
      problemCountThisYear: map['problemCountThisYear'] as int,
      regularCorrectDaysStreak: map['regularCorrectDaysStreak'] as int,
      regularDaysStreak: map['regularDaysStreak'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProblemStatsModel.fromJson(String source) =>
      ProblemStatsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

ProblemStatsModel emptyProblemStatsObject() {
  return const ProblemStatsModel(
    handle: "",
    weakProblemTags: [],
    mediumProblemTags: [],
    strongProblemTags: [],
    correctProblems: 0,
    incorrectProblems: 0,
    tleProblems: 0,
    mleProblems: 0,
    accuracy: 0,
    acceptedProblemRatings: [],
    allProblemRatings: [],
    countOfProblemsOnDate: [],
    problemCountThisWeek: 0,
    problemCountThisMonth: 0,
    problemCountThisYear: 0,
    regularCorrectDaysStreak: 0,
    regularDaysStreak: 0,
  );
}
