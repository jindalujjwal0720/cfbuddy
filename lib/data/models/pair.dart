// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CustomPair<P, Q> extends Equatable {
  P first;
  Q second;
  CustomPair({
    required this.first,
    required this.second,
  });

  CustomPair<P, Q> copyWith({
    P? first,
    Q? second,
  }) {
    return CustomPair<P, Q>(
      first: first ?? this.first,
      second: second ?? this.second,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first': first,
      'second': second,
    };
  }

  factory CustomPair.fromMap(Map<String, dynamic> map) {
    return CustomPair<P, Q>(
      first: map['first'],
      second: map['second'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomPair.fromJson(String source) =>
      CustomPair.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [first, second];
}
