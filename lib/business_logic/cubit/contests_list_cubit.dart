import 'package:bloc/bloc.dart';
import 'package:bloc1/data/models/contest_model.dart';
import 'package:bloc1/data/repositories/contests_repository.dart';
import 'package:equatable/equatable.dart';

part 'contests_list_state.dart';

class ContestsListCubit extends Cubit<ContestsListState> {
  ContestsListCubit() : super(ContestsListInitial());

  Future<void> makeUpcomingContestsList() async {
    emit(ContestsListLoading());
    List<ContestModel> allContests =
        await ContestsRepositoryImpl().getContestsList();
    DateTime today = DateTime.now();
    allContests.removeWhere((element) =>
        element.startTimeSeconds * 1000 < today.millisecondsSinceEpoch);
    allContests
        .sort((a, b) => a.startTimeSeconds.compareTo(b.startTimeSeconds));
    emit(ContestsListLoaded(allContests, const []));
  }
}
