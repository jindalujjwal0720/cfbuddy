// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ContestModel extends Equatable {
  final int id;
  final String name;
  final int durationSeconds;
  final int startTimeSeconds;
  const ContestModel({
    required this.id,
    required this.name,
    required this.durationSeconds,
    required this.startTimeSeconds,
  });

  @override
  List<Object> get props => [
        id,
        name,
        durationSeconds,
        startTimeSeconds,
      ];

  ContestModel copyWith({
    int? id,
    String? name,
    int? durationSeconds,
    int? startTimeSeconds,
  }) {
    return ContestModel(
      id: id ?? this.id,
      name: name ?? this.name,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      startTimeSeconds: startTimeSeconds ?? this.startTimeSeconds,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'durationSeconds': durationSeconds,
      'startTimeSeconds': startTimeSeconds,
    };
  }

  factory ContestModel.fromMap(Map<String, dynamic> map) {
    return ContestModel(
      id: map['id'] as int,
      name: map['name'] as String,
      durationSeconds: map['durationSeconds'] as int,
      startTimeSeconds: map['startTimeSeconds'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContestModel.fromJson(String source) =>
      ContestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
