part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {}

final class PostLoaded extends PostState {
  final List<Post> allPost;

  const PostLoaded({required this.allPost});

  @override
  List<Object> get props => [allPost];
}

final class PostError extends PostState {}
