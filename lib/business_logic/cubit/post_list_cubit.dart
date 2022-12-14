import 'package:bloc/bloc.dart';
import 'package:bloc1/data/models/post_model.dart';
import 'package:bloc1/data/repositories/post_repository.dart';
import 'package:equatable/equatable.dart';

import '../../data/dataproviders/post_provider.dart';

part 'post_list_state.dart';

class PostListCubit extends Cubit<PostListState> {
  PostListCubit() : super(const PostListInitial());

  Future<void> getAllPosts() async {
    try {
      emit(const PostListLoading());
      final List<PostModel> posts = await PostRepositoryImpl().getAllPosts();
      emit(PostListLoaded(posts));
    } on NetworkException {
      emit(const PostListError("Couldn't fetch Post. Is the device online?"));
    }
  }
}
