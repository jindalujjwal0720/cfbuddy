// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:bloc1/data/models/party_model.dart';
import 'package:bloc1/data/models/problem_result_model.dart';

class RanklistRowModel extends Equatable {
  final PartyModel party;
  final int rank;
  final double points;
  final int penalty;
  final List<ProblemResultModel> problemResults;
  const RanklistRowModel({
    required this.party,
    required this.rank,
    required this.points,
    required this.penalty,
    required this.problemResults,
  });

  RanklistRowModel copyWith({
    PartyModel? party,
    int? rank,
    double? points,
    int? penalty,
    List<ProblemResultModel>? problemResults,
  }) {
    return RanklistRowModel(
      party: party ?? this.party,
      rank: rank ?? this.rank,
      points: points ?? this.points,
      penalty: penalty ?? this.penalty,
      problemResults: problemResults ?? this.problemResults,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'party': party.toMap(),
      'rank': rank,
      'points': points,
      'penalty': penalty,
      'problemResults': problemResults.map((x) => x.toMap()).toList(),
    };
  }

  factory RanklistRowModel.fromMap(Map<String, dynamic> map) {
    return RanklistRowModel(
      party: PartyModel.fromMap(map['party'] as Map<String, dynamic>),
      rank: map['rank'] as int,
      points: map['points'] as double,
      penalty: map['penalty'] as int,
      problemResults: List<ProblemResultModel>.from(
        (map['problemResults']).map<ProblemResultModel>(
          (x) => ProblemResultModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory RanklistRowModel.fromJson(String source) =>
      RanklistRowModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      party,
      rank,
      points,
      penalty,
      problemResults,
    ];
  }
}
