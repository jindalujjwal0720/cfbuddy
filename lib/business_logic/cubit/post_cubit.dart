import 'package:bloc/bloc.dart';
import 'package:bloc1/data/dataproviders/post_provider.dart';
import 'package:bloc1/data/repositories/post_repository.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/post_model.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(const PostInitial());

  Future<void> getPostWithUID(String uid) async {
    try {
      emit(const PostLoading());
      final weather = await PostRepositoryImpl().getPostWithUID(uid);
      emit(PostLoaded(weather));
    } on NetworkException {
      emit(const PostError("Couldn't fetch Post. Is the device online?"));
    }
  }

  Future<void> deletePostWithUID(String uid) async {
    try {
      await PostRepositoryImpl().deletePostWithUID(uid);
    } on NetworkException {
      emit(const PostError("Couldn't fetch Post. Is the device online?"));
    }
  }
}
