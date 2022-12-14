import 'dart:convert';
import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final String uid;
  final String title;
  final String description;
  final String institute;
  final int timestamp;
  final int supportCount;
  final int resistanceCount;
  final bool wasEdited;
  final bool flagged;
  final bool reported;
  final List<String> tags;

  const PostModel({
    required this.uid,
    required this.title,
    required this.description,
    required this.institute,
    required this.timestamp,
    required this.tags,
    required this.supportCount,
    required this.resistanceCount,
    required this.wasEdited,
    required this.flagged,
    required this.reported,
  });

  @override
  List<Object> get props {
    return [
      uid,
      title,
      description,
      institute,
      timestamp,
      tags,
      supportCount,
      resistanceCount,
      wasEdited,
      flagged,
      reported,
    ];
  }

  PostModel copyWith({
    String? uid,
    String? title,
    String? description,
    String? institute,
    int? timestamp,
    List<String>? tags,
    int? supportCount,
    int? resistanceCount,
    bool? wasEdited,
    bool? flagged,
    bool? reported,
  }) {
    return PostModel(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      description: description ?? this.description,
      institute: institute ?? this.institute,
      timestamp: timestamp ?? this.timestamp,
      tags: tags ?? this.tags,
      supportCount: supportCount ?? this.supportCount,
      resistanceCount: resistanceCount ?? this.resistanceCount,
      wasEdited: wasEdited ?? this.wasEdited,
      flagged: flagged ?? this.flagged,
      reported: reported ?? this.reported,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'title': title,
      'description': description,
      'institute': institute,
      'timestamp': timestamp,
      'tags': tags,
      'supportCount': supportCount,
      'resistanceCount': resistanceCount,
      'wasEdited': wasEdited,
      'flagged': flagged,
      'reported': reported,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      uid: map['uid'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      institute: map['institute'] as String,
      timestamp: map['timestamp'] as int,
      tags: map['tags'].cast<String>(),
      supportCount: map['supportCount'] as int,
      resistanceCount: map['resistanceCount'] as int,
      wasEdited: map['wasEdited'] as bool,
      flagged: map['flagged'] as bool,
      reported: map['reported'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
