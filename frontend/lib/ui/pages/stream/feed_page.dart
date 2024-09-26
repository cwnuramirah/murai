import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/models/post_model.dart';
import 'package:frontend/ui/pages/new_post/new_post_page.dart';
import 'package:frontend/bloc/post/post_bloc.dart';
import 'package:frontend/ui/pages/stream/post_card.dart';
import 'package:frontend/theme.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyledColor.greyLight,
      appBar: AppBar(
        title: Text(
          'Stream',
          style: StyledText.title.sm,
        ),
        shape: const Border(
          bottom: BorderSide(
            color: StyledColor.grey,
            width: 1,
          ),
        ),
        backgroundColor: StyledColor.greyLight,
        foregroundColor: StyledColor.black,
        elevation: 0,
      ),
      body: const PostList(),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
        child: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewPostPage(),
            ),
          ),
          backgroundColor: StyledColor.blue,
          child: const Icon(Icons.add_rounded),
        ),
      ),
    );
  }
}

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        if (state is PostLoading) {
          return const Center(child: Text('Loading post...'));
        } else if (state is PostsLoaded) {
          if (state.posts.isNotEmpty) {
            return buildPostCardList(state.posts);
          } else {
            return const Center(child: Text('No posts available right now'));
          }
        } else if (state is PostUpdatedState) {
          // Handle single post update
          final updatedPost = state.post;

          // Check if the post exists in the current list
          final postBlocState = context.read<PostBloc>().state;
          if (postBlocState is PostsLoaded) {
            final currentPosts = postBlocState.posts;

            // Find the index of the updated post
            final postIndex = currentPosts
                .indexWhere((post) => post.postId == updatedPost.postId);

            // If the post exists, update it in the UI
            if (postIndex != -1) {
              final updatedPosts = List<Post>.from(currentPosts);
              updatedPosts[postIndex] = updatedPost;

              return buildPostCardList(updatedPosts);
            }
          }
        } else if (state is PostError) {
          return Center(
              child: Text('Something went wrong :( ${state.message}'));
        }
        return const Center(child: Text('No posts available right now'));
      }),
    );
  }

  ListView buildPostCardList(List<Post> posts) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostCard(
          key: ValueKey(posts[index].postId),
          post: posts[index],
        );
      },
    );
  }
}
