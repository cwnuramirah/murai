import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/models/comment_model.dart';
import 'package:frontend/models/post_model.dart';
import 'package:frontend/repos/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(PostInitial()) {
    on<FetchPosts>(_onFetchPosts);
    on<CreatePost>(_onCreatePost);
    on<LikePost>(_onLikePost);
    on<AddComment>(_onAddComment);
  }

  Future<void> _onFetchPosts(FetchPosts event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final posts = await postRepository.getAllPosts();
      emit(PostsLoaded(posts: posts));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }

  // Handle creating a post
  Future<void> _onCreatePost(CreatePost event, Emitter<PostState> emit) async {
    if (state is PostsLoaded) {
      final currentState = state as PostsLoaded;

      try {
        final newPost = await postRepository.createPost(event.content);
        final updatedPosts = List<Post>.from(currentState.posts)
          ..insert(0, newPost);

        emit(PostsLoaded(posts: updatedPosts));
      } catch (e) {
        emit(PostError(e.toString()));
      }
    }
  }

  Future<void> _onLikePost(LikePost event, Emitter<PostState> emit) async {
    const String userId = 'current.user';

    if (state is PostsLoaded) {
      final currentState = state as PostsLoaded;

      try {
        final post = currentState.posts
            .firstWhere((post) => post.postId == event.postId);
        final isLiked = post.likedBy.contains(userId);

        // Toggle like/unlike
        final updatedLikedBy = isLiked
            ? (Set<String>.from(post.likedBy)..remove(userId))
            : (Set<String>.from(post.likedBy)..add(userId));

        final updatedPost = post.copyWith(likedBy: updatedLikedBy);

        emit(PostUpdatedState(updatedPost));

        await postRepository.updatePost(updatedPost);
        
        final updatedPosts = List<Post>.from(currentState.posts);
        final postIndex =
            updatedPosts.indexWhere((p) => p.postId == event.postId);
        updatedPosts[postIndex] = updatedPost;
        emit(PostsLoaded(posts: updatedPosts));
      } catch (e) {
        emit(PostError(e.toString()));
      }
    }
  }

  Future<void> _onAddComment(AddComment event, Emitter<PostState> emit) async {
    if (state is PostsLoaded) {
      final currentState = state as PostsLoaded;

      try {
        final post = currentState.posts
            .firstWhere((post) => post.postId == event.postId);
        final newComment =
            await postRepository.addComment(event.postId, event.comment);

        final updatedComments = List<Comment>.from(post.comments)
          ..add(newComment);
        final updatedPost = post.copyWith(comments: updatedComments);

        // Emit the updated post in a PostUpdatedState
        emit(PostUpdatedState(updatedPost));

        // Update the repository if needed
        await postRepository.updatePost(updatedPost);
      } catch (e) {
        emit(PostError(e.toString()));
      }
    }
  }
}
