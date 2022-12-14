part of 'submissions_list_cubit.dart';

abstract class SubmissionsListState extends Equatable {
  const SubmissionsListState();

  @override
  List<Object> get props => [];
}

class SubmissionsListInitial extends SubmissionsListState {}

class SubmissionsListLoading extends SubmissionsListState {}

class SubmissionsListLoaded extends SubmissionsListState {
  final List<SubmissionModel> submissions;
  const SubmissionsListLoaded(this.submissions);
}

class SubmissionsListError extends SubmissionsListState {
  final String message;
  const SubmissionsListError(this.message);
}
