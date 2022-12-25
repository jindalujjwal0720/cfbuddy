// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProblemResultModel extends Equatable {
  final double points;
  final int rejectedAttemptCount;
  const ProblemResultModel({
    required this.points,
    required this.rejectedAttemptCount,
  });

  ProblemResultModel copyWith({
    double? points,
    int? rejectedAttemptCount,
  }) {
    return ProblemResultModel(
      points: points ?? this.points,
      rejectedAttemptCount: rejectedAttemptCount ?? this.rejectedAttemptCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'points': points,
      'rejectedAttemptCount': rejectedAttemptCount,
    };
  }

  factory ProblemResultModel.fromMap(Map<String, dynamic> map) {
    return ProblemResultModel(
      points: map['points'] as double,
      rejectedAttemptCount: map['rejectedAttemptCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProblemResultModel.fromJson(String source) =>
      ProblemResultModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [points, rejectedAttemptCount];
}
