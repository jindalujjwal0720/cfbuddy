import 'dart:convert';
import 'package:equatable/equatable.dart';

class ProblemModel extends Equatable {
  final int? contestId;
  final String name;
  final String index;
  final int? rating;
  final List<String> tags;

  const ProblemModel({
    this.contestId,
    required this.name,
    required this.index,
    this.rating,
    required this.tags,
  });

  @override
  List<Object> get props {
    return [
      contestId!,
      name,
      index,
      rating!,
      tags,
    ];
  }

  ProblemModel copyWith({
    int? contestId,
    String? name,
    String? index,
    int? rating,
    List<String>? tags,
  }) {
    return ProblemModel(
      contestId: contestId ?? this.contestId,
      name: name ?? this.name,
      index: index ?? this.index,
      rating: rating ?? this.rating,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contestId': contestId,
      'name': name,
      'index': index,
      'rating': rating,
      'tags': tags,
    };
  }

  factory ProblemModel.fromMap(Map<String, dynamic> map) {
    return ProblemModel(
      contestId: map['contestId'] != null ? map['contestId'] as int : null,
      name: map['name'] as String,
      index: map['index'] as String,
      rating: map['rating'] != null ? map['rating'] as int : null,
      tags: map['tags'].cast<String>(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProblemModel.fromJson(String source) =>
      ProblemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
