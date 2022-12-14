import 'package:bloc/bloc.dart';
import 'package:bloc1/data/constants/constants.dart';
import 'package:bloc1/data/models/problem_stats_model.dart';
import 'package:bloc1/data/repositories/problem_stats_repository.dart';
import 'package:equatable/equatable.dart';

part 'user_stats_state.dart';

class UserStatsCubit extends Cubit<UserStatsState> {
  UserStatsCubit() : super(UserStatsInitial());

  Future<void> makeUserStats(String handle) async {
    emit(UserStatsLoading());
    try {
      ProblemStatsModel stats;
      // check if user stats loaded in userConstants
      if (handle == userConstants.user.handle &&
          userConstants.isUserStatLoaded) {
        stats = userConstants.userStatistics;
        emit(UserStatsLoaded(stats));
      } else {
        // check if the handle belongs to the user friends which are already loaded
        bool found = false;
        for (var friendStat in userConstants.friendsStatistics) {
          if (handle == friendStat.handle) {
            stats = friendStat;
            found = true;
            emit(UserStatsLoaded(stats));
          }
        }
        if (!found) {
          stats =
              await ProblemStatsRepositoryImpl().getProblemStatsOfUser(handle);
          // putting the Stats for future use in CONSTANTS file
          if (stats.handle == userConstants.user.handle) {
            userConstants = userConstants.copyWith(
                userStatistics: stats, isUserStatLoaded: true);
          } else {
            List<ProblemStatsModel> newList = [];
            newList.addAll(userConstants.friendsStatistics);
            newList.addAll([stats]);
            userConstants = userConstants.copyWith(
                friendsStatistics: newList, areFriendsLoaded: true);
          }
          emit(UserStatsLoaded(stats));
        }
      }
    } catch (e) {
      emit(UserStatsError(e.toString()));
    }
  }
}
