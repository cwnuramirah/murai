import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/ui/pages/stream/new_post_page.dart';
import 'package:frontend/bloc/post_bloc.dart';
import 'package:frontend/ui/pages/stream/post_card.dart';
import 'package:frontend/theme.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
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
  const PostList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostInitial) {
            return const Center(child: Text('Loading post...'));
          }
          if (state is PostLoaded) {
            return Column(
              verticalDirection: VerticalDirection.up,
              children: [
                for (int i = 0; i < state.allPost.length; i++)
                  PostCard(
                    username: state.allPost[i].username,
                    timestamp: state.allPost[i].timestamp,
                    postContent: state.allPost[i].postContent,
                    likeCount: state.allPost[i].likeCount,
                    replyCount: state.allPost[i].replyCount,
                  )
              ],
            );
          } else {
            return const Center(child: Text('Something went wrong :('));
          }
        },
      ),
    );
  }
}
