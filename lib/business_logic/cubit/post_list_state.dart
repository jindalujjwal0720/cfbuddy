part of 'post_list_cubit.dart';

abstract class PostListState extends Equatable {
  const PostListState();

  @override
  List<Object> get props => [];
}

class PostListInitial extends PostListState {
  const PostListInitial();
}

class PostListLoading extends PostListState {
  const PostListLoading();
}

class PostListLoaded extends PostListState {
  final List<PostModel> posts;
  const PostListLoaded(this.posts);
}

class PostListError extends PostListState {
  final String errorMessage;
  const PostListError(this.errorMessage);
}
