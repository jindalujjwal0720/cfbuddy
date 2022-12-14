import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:bloc1/data/models/problem_model.dart';

class SubmissionModel extends Equatable {
  final int id;
  final int contestId;
  final int creationTimeSeconds;
  final int relativeTimeSeconds;
  final String programmingLanguage;
  final String verdict;
  final String testset;
  final int passedTestCount;
  final int timeConsumedMillis;
  final int memoryConsumedBytes;
  final ProblemModel problem;

  const SubmissionModel(
    this.id,
    this.contestId,
    this.creationTimeSeconds,
    this.relativeTimeSeconds,
    this.programmingLanguage,
    this.verdict,
    this.testset,
    this.passedTestCount,
    this.timeConsumedMillis,
    this.memoryConsumedBytes,
    this.problem,
  );

  @override
  List<Object> get props {
    return [
      id,
      contestId,
      creationTimeSeconds,
      relativeTimeSeconds,
      programmingLanguage,
      verdict,
      testset,
      passedTestCount,
      timeConsumedMillis,
      memoryConsumedBytes,
      problem,
    ];
  }

  SubmissionModel copyWith({
    int? id,
    int? contestId,
    int? creationTimeSeconds,
    int? relativeTimeSeconds,
    String? programmingLanguage,
    String? verdict,
    String? testset,
    int? passedTestCount,
    int? timeConsumedMillis,
    int? memoryConsumedBytes,
    ProblemModel? problem,
  }) {
    return SubmissionModel(
      id ?? this.id,
      contestId ?? this.contestId,
      creationTimeSeconds ?? this.creationTimeSeconds,
      relativeTimeSeconds ?? this.relativeTimeSeconds,
      programmingLanguage ?? this.programmingLanguage,
      verdict ?? this.verdict,
      testset ?? this.testset,
      passedTestCount ?? this.passedTestCount,
      timeConsumedMillis ?? this.timeConsumedMillis,
      memoryConsumedBytes ?? this.memoryConsumedBytes,
      problem ?? this.problem,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'contestId': contestId,
      'creationTimeSeconds': creationTimeSeconds,
      'relativeTimeSeconds': relativeTimeSeconds,
      'programmingLanguage': programmingLanguage,
      'verdict': verdict,
      'testset': testset,
      'passedTestCount': passedTestCount,
      'timeConsumedMillis': timeConsumedMillis,
      'memoryConsumedBytes': memoryConsumedBytes,
      'problem': problem.toMap(),
    };
  }

  factory SubmissionModel.fromMap(Map<String, dynamic> map) {
    return SubmissionModel(
      map['id'] as int,
      map['contestId'] as int,
      map['creationTimeSeconds'] as int,
      map['relativeTimeSeconds'] as int,
      map['programmingLanguage'] as String,
      map['verdict'] as String,
      map['testset'] as String,
      map['passedTestCount'] as int,
      map['timeConsumedMillis'] as int,
      map['memoryConsumedBytes'] as int,
      ProblemModel.fromMap(map['problem'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory SubmissionModel.fromJson(String source) =>
      SubmissionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
