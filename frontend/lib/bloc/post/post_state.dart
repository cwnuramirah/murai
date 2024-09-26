part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostsLoaded extends PostState {
  final List<Post> posts;

  const PostsLoaded({required this.posts});

  @override
  List<Object> get props => [posts];
}

class PostUpdatedState extends PostState {
  final Post post;

  const PostUpdatedState(this.post);
}

class PostError extends PostState {
  final String message;

  const PostError(this.message);

  @override
  List<Object?> get props => [message];
}