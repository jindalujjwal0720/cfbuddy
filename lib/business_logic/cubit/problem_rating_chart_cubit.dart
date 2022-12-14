import 'package:bloc/bloc.dart';
import 'package:bloc1/data/constants/constants.dart';
import 'package:bloc1/data/models/problem_stats_model.dart';
import 'package:bloc1/data/repositories/problem_stats_repository.dart';
import 'package:equatable/equatable.dart';

part 'problem_rating_chart_state.dart';

class ProblemRatingChartCubit extends Cubit<ProblemRatingChartState> {
  ProblemRatingChartCubit() : super(ProblemRatingChartInitial());

  Future<void> makeProblemRatingsChart(String handle) async {
    emit(ProblemRatingChartLoading());
    try {
      ProblemStatsModel stats;
      List<ProblemStatsModel> newList = [];

      // check if user stats loaded in userConstants
      if (handle == userConstants.user.handle &&
          userConstants.isUserStatLoaded) {
        stats = userConstants.userStatistics;
        emit(ProblemRatingChartLoaded(stats));
      } else {
        // check if the handle belongs to the user friends which are already loaded
        bool found = false;
        for (var friendStat in userConstants.friendsStatistics) {
          if (handle == friendStat.handle) {
            stats = friendStat;
            found = true;

            emit(ProblemRatingChartLoaded(stats));
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
            newList.addAll(userConstants.friendsStatistics);
            newList.add(stats);
            userConstants = userConstants.copyWith(
                friendsStatistics: newList, areFriendsLoaded: true);
          }
          emit(ProblemRatingChartLoaded(stats));
        }
      }
    } catch (e) {
      emit(ProblemRatingChartError(e.toString()));
    }
  }
}
