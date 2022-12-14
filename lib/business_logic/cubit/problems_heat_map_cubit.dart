import 'package:bloc/bloc.dart';
import 'package:bloc1/data/constants/constants.dart';
import 'package:bloc1/data/models/problem_stats_model.dart';
import 'package:bloc1/data/repositories/problem_stats_repository.dart';
import 'package:equatable/equatable.dart';

part 'problems_heat_map_state.dart';

class ProblemsHeatMapCubit extends Cubit<ProblemsHeatMapState> {
  ProblemsHeatMapCubit() : super(ProblemsHeatMapInitial());

  Future<void> makeHeatMap(String handle) async {
    emit(ProblemsHeatMapLoading());
    try {
      ProblemStatsModel stats;
      Map<DateTime, int> dataset = {};
      // check if user stats loaded in userConstants
      if (handle == userConstants.user.handle &&
          userConstants.isUserStatLoaded) {
        stats = userConstants.userStatistics;
        // converting to a map for the widget to display
        for (var x in stats.countOfProblemsOnDate) {
          dataset[DateTime.parse(x.first)] = x.second;
        }
        emit(ProblemsHeatMapLoaded(dataset));
      } else {
        // check if the handle belongs to the user friends which are already loaded
        bool found = false;
        for (var friendStat in userConstants.friendsStatistics) {
          if (handle == friendStat.handle) {
            stats = friendStat;
            found = true;
            // converting to a map for the widget to display
            for (var x in stats.countOfProblemsOnDate) {
              dataset[DateTime.parse(x.first)] = x.second;
            }
            emit(ProblemsHeatMapLoaded(dataset));
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

          // converting to a map for the widget to display
          for (var x in stats.countOfProblemsOnDate) {
            dataset[DateTime.parse(x.first)] = x.second;
          }
          emit(ProblemsHeatMapLoaded(dataset));
        }
      }
    } catch (e) {
      emit(ProblemsHeatMapError(e.toString()));
    }
  }
}
