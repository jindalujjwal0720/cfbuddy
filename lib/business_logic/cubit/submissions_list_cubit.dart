import 'package:bloc/bloc.dart';
import 'package:bloc1/data/models/submission_model.dart';
import 'package:bloc1/data/repositories/submission_repository.dart';
import 'package:equatable/equatable.dart';

part 'submissions_list_state.dart';

class SubmissionsListCubit extends Cubit<SubmissionsListState> {
  SubmissionsListCubit() : super(SubmissionsListInitial());

  Future<void> makeSubmissionsList(String handle, {DateTime? date}) async {
    emit(SubmissionsListLoading());
    List<SubmissionModel> subs;
    try {
      if (date == null) {
        subs = await SubmissionRepositoryImpl().getSubmissionsOfUser(handle);
      } else {
        subs = await SubmissionRepositoryImpl()
            .getSubmissionsOfUser(handle, dateTime: date);
      }
      emit(SubmissionsListLoaded(subs));
    } catch (e) {
      emit(SubmissionsListError(e.toString()));
    }
  }
}
