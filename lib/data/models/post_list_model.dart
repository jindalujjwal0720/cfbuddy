// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:bloc1/data/models/post_model.dart';
import 'package:equatable/equatable.dart';

class PostList extends Equatable {
  List<PostModel> posts;
  String error;
  PostList({
    required this.posts,
    required this.error,
  });

  @override
  List<Object?> get props => [
        posts,
        error,
      ];

  PostList copyWith({
    List<PostModel>? posts,
    String? error,
  }) {
    return PostList(
      posts: posts ?? this.posts,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'posts': posts.map((x) => x.toMap()).toList(),
      'error': error,
    };
  }

  factory PostList.fromMap(Map<String, dynamic> map) {
    return PostList(
      posts: List<PostModel>.from(
        (map['posts'] as List<int>).map<PostModel>(
          (x) => PostModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      error: map['error'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostList.fromJson(String source) =>
      PostList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PostList(posts: $posts, error: $error)';
}
