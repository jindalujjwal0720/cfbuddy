part of 'problem_tag_chips_filter_cubit.dart';

abstract class ProblemTagChipsFilterState extends Equatable {
  const ProblemTagChipsFilterState(this.tags, this.selectedTags);
  final List<String> tags;
  final List<String> selectedTags;
  @override
  List<Object> get props => [];
}

class ProblemTagChipsFilterInitial extends ProblemTagChipsFilterState {
  const ProblemTagChipsFilterInitial(super.tags, super.selectedTags);
}

class ProblemTagChipsFilterSelectionChanged extends ProblemTagChipsFilterState {
  const ProblemTagChipsFilterSelectionChanged(super.tags, super.selectedTags);
}
