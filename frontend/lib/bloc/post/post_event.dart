part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => [];
}

class FetchPosts extends PostEvent {
  @override
  List<Object?> get props => [];
}

class FetchPost extends PostEvent {
  final String postId;

  const FetchPost({required this.postId});

  @override
  List<Object?> get props => [];
}

class CreatePost extends PostEvent {
  final String? content;

  const CreatePost({this.content});

    @override
  List<Object?> get props => [content];
}

class LikePost extends PostEvent {
  final String postId;

  const LikePost({required this.postId});

  @override
  List<Object?> get props => [postId];
}

class AddComment extends PostEvent {
  final String postId;
  final String comment;

  const AddComment({required this.postId, required this.comment});

  @override
  List<Object?> get props => [postId, comment];
}
