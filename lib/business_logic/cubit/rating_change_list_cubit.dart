import 'package:bloc/bloc.dart';
import 'package:bloc1/data/models/rating_change_model.dart';
import 'package:bloc1/data/repositories/rating_change_repository.dart';
import 'package:equatable/equatable.dart';

part 'rating_change_list_state.dart';

class RatingChangeListCubit extends Cubit<RatingChangeListState> {
  RatingChangeListCubit() : super(RatingChangeListInitial());

  Future<void> makeRatingChangeList(String handle) async {
    emit(RatingChangeListLoading());
    List<RatingChangeModel> ratingChanges;
    try {
      ratingChanges =
          await RatingChangeRepositoryImpl().getRatingChanges(handle);
      emit(RatingChangeListLoaded(ratingChanges));
    } catch (e) {
      emit(RatingChangeListError(e.toString()));
    }
  }
}
