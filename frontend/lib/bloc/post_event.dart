part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class LoadPost extends PostEvent {}

class AddPost extends PostEvent {
  final Post post;

  const AddPost(this.post);

  @override
  List<Object> get props => [post];
}

class UpdateLike extends PostEvent {
  final String postId;
  final String userId;

  const UpdateLike({
    required this.postId,
    required this.userId,
  });
}
