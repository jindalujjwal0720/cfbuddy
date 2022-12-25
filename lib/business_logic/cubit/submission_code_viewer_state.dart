part of 'submission_code_viewer_cubit.dart';

abstract class SubmissionCodeViewerState extends Equatable {
  const SubmissionCodeViewerState();

  @override
  List<Object> get props => [];
}

class SubmissionCodeViewerInitial extends SubmissionCodeViewerState {}

class SubmissionCodeViewerDialogLoading extends SubmissionCodeViewerState {}

class SubmissionCodeViewerDialogLoaded extends SubmissionCodeViewerState {
  final SubmissionModel submission;
  final String formattedCodeString;
  const SubmissionCodeViewerDialogLoaded(this.submission, this.formattedCodeString);
}

class SubmissionCodeViewerDialogUnload extends SubmissionCodeViewerState {}
