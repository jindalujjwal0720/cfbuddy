import 'package:bloc/bloc.dart';
import 'package:bloc1/data/models/user_model.dart';
import 'package:bloc1/data/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'user_card_details_page_state.dart';

class UserCardDetailsPageCubit extends Cubit<UserCardDetailsPageState> {
  UserCardDetailsPageCubit() : super(UserCardDetailsPageInitial());

  Future<void> makeUserCardOnDetailsPage(String handle) async {
    emit(UserCardDetailsPageLoading());
    final UserModel user;
    user = (await UserRepositoryImpl().getUsersDetails([handle]))[0];
    emit(UserCardDetailsPageLoaded(user));
  }
}
