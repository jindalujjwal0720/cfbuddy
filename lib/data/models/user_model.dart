// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String handle;
  final int rating;
  final int maxRating;
  final String rank;
  final String maxRank;
  final int registrationTimeSeconds;
  final int lastOnlineTimeSeconds;
  final String titlePhotoURL;

  const UserModel({
    required this.handle,
    required this.rating,
    required this.maxRating,
    required this.rank,
    required this.maxRank,
    required this.registrationTimeSeconds,
    required this.lastOnlineTimeSeconds,
    required this.titlePhotoURL,
  });

  @override
  List<Object> get props {
    return [
      handle,
      rating,
      maxRating,
      rank,
      maxRank,
      registrationTimeSeconds,
      lastOnlineTimeSeconds,
      titlePhotoURL,
    ];
  }

  UserModel copyWith({
    String? handle,
    int? rating,
    int? maxRating,
    String? rank,
    String? maxRank,
    int? registrationTimeSeconds,
    int? lastOnlineTimeSeconds,
    String? titlePhotoURL,
  }) {
    return UserModel(
      handle: handle ?? this.handle,
      rating: rating ?? this.rating,
      maxRating: maxRating ?? this.maxRating,
      rank: rank ?? this.rank,
      maxRank: maxRank ?? this.maxRank,
      registrationTimeSeconds:
          registrationTimeSeconds ?? this.registrationTimeSeconds,
      lastOnlineTimeSeconds:
          lastOnlineTimeSeconds ?? this.lastOnlineTimeSeconds,
      titlePhotoURL: titlePhotoURL ?? this.titlePhotoURL,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'handle': handle,
      'rating': rating,
      'maxRating': maxRating,
      'rank': rank,
      'maxRank': maxRank,
      'registrationTimeSeconds': registrationTimeSeconds,
      'lastOnlineTimeSeconds': lastOnlineTimeSeconds,
      'titlePhotoURL': titlePhotoURL,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      handle: map['handle'] as String,
      rating: map['rating'] as int,
      maxRating: map['maxRating'] as int,
      rank: map['rank'] as String,
      maxRank: map['maxRank'] as String,
      registrationTimeSeconds: map['registrationTimeSeconds'] as int,
      lastOnlineTimeSeconds: map['lastOnlineTimeSeconds'] as int,
      titlePhotoURL: map['titlePhoto'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

UserModel emptyUserModel() {
  return const UserModel(
    handle: "",
    rating: 0,
    maxRating: 0,
    rank: "",
    maxRank: "",
    registrationTimeSeconds: 0,
    lastOnlineTimeSeconds: 0,
    titlePhotoURL: "",
  );
}
