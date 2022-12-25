import 'package:bloc/bloc.dart';
import 'package:bloc1/data/constants/constants.dart';
import 'package:bloc1/data/models/contest_standings_model.dart';
import 'package:bloc1/data/repositories/contests_repository.dart';
import 'package:equatable/equatable.dart';

part 'contest_standings_state.dart';

class ContestStandingsCubit extends Cubit<ContestStandingsState> {
  ContestStandingsCubit() : super(ContestStandingsInitial());

  Future<void> makeContestStandingsDialog(int contestID) async {
    emit(ContestStandingsLoading());
    List<String> handles = [];
    handles.add(userConstants.user.handle);
    for (var friend in userConstants.friends) {
      handles.add(friend.handle);
    }
    ContestStandingsModel standings = await ContestsRepositoryImpl()
        .getContestInfoAndStandings(contestID, handles);
    emit(ContestStandingsLoaded(standings));
  }
}
