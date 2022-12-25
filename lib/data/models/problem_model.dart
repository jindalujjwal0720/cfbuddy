// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProblemModel extends Equatable {
  final int? contestId;
  final String name;
  final String index;
  final int? rating;
  final List<String> tags;
  final int? solvedCount;

  const ProblemModel({
    this.contestId,
    required this.name,
    required this.index,
    this.rating,
    required this.tags,
    this.solvedCount,
  });

  @override
  List<Object> get props {
    return [
      contestId ?? 0,
      name,
      index,
      rating ?? 0,
      tags,
      solvedCount ?? 0,
    ];
  }

  ProblemModel copyWith({
    int? contestId,
    String? name,
    String? index,
    int? rating,
    List<String>? tags,
    int? solvedCount,
  }) {
    return ProblemModel(
      contestId: contestId ?? this.contestId,
      name: name ?? this.name,
      index: index ?? this.index,
      rating: rating ?? this.rating,
      tags: tags ?? this.tags,
      solvedCount: solvedCount ?? this.solvedCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contestId': contestId,
      'name': name,
      'index': index,
      'rating': rating,
      'tags': tags,
      'solvedCount': solvedCount,
    };
  }

  factory ProblemModel.fromMap(Map<String, dynamic> map) {
    return ProblemModel(
      contestId: map['contestId'] != null ? map['contestId'] as int : 0,
      name: map['name'] as String,
      index: map['index'] as String,
      rating: map['rating'] != null ? map['rating'] as int : 0,
      tags: List<String>.from(map['tags']),
      solvedCount: map['solvedCount'] != null ? map['solvedCount'] as int : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProblemModel.fromJson(String source) =>
      ProblemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
