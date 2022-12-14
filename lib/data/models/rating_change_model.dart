// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:equatable/equatable.dart';

class RatingChangeModel extends Equatable {
  int contestId;
  String contestName;
  String handle;
  int rank;
  int ratingUpdateTimeSeconds;
  int oldRating;
  int newRating;

  RatingChangeModel({
    required this.contestId,
    required this.contestName,
    required this.handle,
    required this.rank,
    required this.ratingUpdateTimeSeconds,
    required this.oldRating,
    required this.newRating,
  });

  @override
  List<Object> get props {
    return [
      contestId,
      contestName,
      handle,
      rank,
      ratingUpdateTimeSeconds,
      oldRating,
      newRating,
    ];
  }

  RatingChangeModel copyWith({
    int? contestId,
    String? contestName,
    String? handle,
    int? rank,
    int? ratingUpdateTimeSeconds,
    int? oldRating,
    int? newRating,
  }) {
    return RatingChangeModel(
      contestId: contestId ?? this.contestId,
      contestName: contestName ?? this.contestName,
      handle: handle ?? this.handle,
      rank: rank ?? this.rank,
      ratingUpdateTimeSeconds:
          ratingUpdateTimeSeconds ?? this.ratingUpdateTimeSeconds,
      oldRating: oldRating ?? this.oldRating,
      newRating: newRating ?? this.newRating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contestId': contestId,
      'contestName': contestName,
      'handle': handle,
      'rank': rank,
      'ratingUpdateTimeSeconds': ratingUpdateTimeSeconds,
      'oldRating': oldRating,
      'newRating': newRating,
    };
  }

  factory RatingChangeModel.fromMap(Map<String, dynamic> map) {
    return RatingChangeModel(
      contestId: map['contestId'] as int,
      contestName: map['contestName'] as String,
      handle: map['handle'] as String,
      rank: map['rank'] as int,
      ratingUpdateTimeSeconds: map['ratingUpdateTimeSeconds'] as int,
      oldRating: map['oldRating'] as int,
      newRating: map['newRating'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory RatingChangeModel.fromJson(String source) =>
      RatingChangeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
