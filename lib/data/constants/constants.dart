// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:bloc1/data/models/problem_stats_model.dart';

import '../models/user_model.dart';

class UserConstants extends Equatable {
  final UserModel user;
  final bool isUserLoaded;
  final ProblemStatsModel userStatistics;
  final bool isUserStatLoaded;
  final List<ProblemStatsModel> friendsStatistics;
  final List<UserModel> friends;
  final bool areFriendsLoaded;
  const UserConstants({
    required this.user,
    required this.isUserLoaded,
    required this.userStatistics,
    required this.isUserStatLoaded,
    required this.friendsStatistics,
    required this.friends,
    required this.areFriendsLoaded,
  });

  @override
  List<Object?> get props => [];

  UserConstants copyWith({
    UserModel? user,
    bool? isUserLoaded,
    ProblemStatsModel? userStatistics,
    bool? isUserStatLoaded,
    List<ProblemStatsModel>? friendsStatistics,
    List<UserModel>? friends,
    bool? areFriendsLoaded,
  }) {
    return UserConstants(
      user: user ?? this.user,
      isUserLoaded: isUserLoaded ?? this.isUserLoaded,
      userStatistics: userStatistics ?? this.userStatistics,
      isUserStatLoaded: isUserStatLoaded ?? this.isUserStatLoaded,
      friendsStatistics: friendsStatistics ?? this.friendsStatistics,
      friends: friends ?? this.friends,
      areFriendsLoaded: areFriendsLoaded ?? this.areFriendsLoaded,
    );
  }
}

// Global instance of USER CONSTANTS
UserConstants userConstants = UserConstants(
  user: emptyUserModel(),
  isUserLoaded: false,
  userStatistics: emptyProblemStatsObject(),
  isUserStatLoaded: false,
  friendsStatistics: const [],
  friends: const [],
  areFriendsLoaded: false,
);
