// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:bloc1/data/models/contest_model.dart';
import 'package:bloc1/data/models/problem_model.dart';
import 'package:bloc1/data/models/ranklist_row_model.dart';

class ContestStandingsModel extends Equatable {
  final ContestModel contest;
  final List<ProblemModel> problems;
  final List<RanklistRowModel> rows;
  const ContestStandingsModel({
    required this.contest,
    required this.problems,
    required this.rows,
  });

  ContestStandingsModel copyWith({
    ContestModel? contest,
    List<ProblemModel>? problems,
    List<RanklistRowModel>? rows,
  }) {
    return ContestStandingsModel(
      contest: contest ?? this.contest,
      problems: problems ?? this.problems,
      rows: rows ?? this.rows,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contest': contest.toMap(),
      'problems': problems.map((x) => x.toMap()).toList(),
      'rows': rows.map((x) => x.toMap()).toList(),
    };
  }

  factory ContestStandingsModel.fromMap(Map<String, dynamic> map) {
    return ContestStandingsModel(
      contest: ContestModel.fromMap(map['contest'] as Map<String, dynamic>),
      problems: List<ProblemModel>.from(
        (map['problems']).map<ProblemModel>(
          (x) => ProblemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      rows: List<RanklistRowModel>.from(
        (map['rows']).map<RanklistRowModel>(
          (x) => RanklistRowModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ContestStandingsModel.fromJson(String source) =>
      ContestStandingsModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [contest, problems, rows];
}
