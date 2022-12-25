import 'package:bloc/bloc.dart';
import 'package:bloc1/data/models/submission_model.dart';
import 'package:bloc1/data/repositories/submission_repository.dart';
import 'package:equatable/equatable.dart';

part 'submission_code_viewer_state.dart';

class SubmissionCodeViewerCubit extends Cubit<SubmissionCodeViewerState> {
  SubmissionCodeViewerCubit() : super(SubmissionCodeViewerInitial());

  Future<void> makeSubmissionCodeDialog(SubmissionModel submission) async {
    emit(SubmissionCodeViewerDialogLoading());
    String formattedCodeString = await SubmissionRepositoryImpl()
        .getSubmissionCodeByID(submission.contestId, submission.id);
    emit(SubmissionCodeViewerDialogLoaded(submission, formattedCodeString));
  }
}
