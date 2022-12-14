part of 'post_cubit.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {
  const PostInitial();
}

class PostLoading extends PostState {
  const PostLoading();
}

class PostLoaded extends PostState {
  final PostModel post;
  const PostLoaded(this.post);
}

class PostError extends PostState {
  final String errorMessage;
  const PostError(this.errorMessage);
}
