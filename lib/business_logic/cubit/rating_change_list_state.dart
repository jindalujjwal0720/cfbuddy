part of 'rating_change_list_cubit.dart';

abstract class RatingChangeListState extends Equatable {
  const RatingChangeListState();

  @override
  List<Object> get props => [];
}

class RatingChangeListInitial extends RatingChangeListState {}

class RatingChangeListLoading extends RatingChangeListState {}

class RatingChangeListLoaded extends RatingChangeListState {
  final List<RatingChangeModel> ratingChanges;
  const RatingChangeListLoaded(this.ratingChanges);
}

class RatingChangeListError extends RatingChangeListState {
  final String message;
  const RatingChangeListError(this.message);
}
