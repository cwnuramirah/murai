import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/post/post_bloc.dart';
import 'package:frontend/models/comment_model.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/ui/pages/view_post/comment_tile.dart';
import 'package:frontend/utils/comment_input_controller.dart';

class CommentList extends StatelessWidget {
  const CommentList({
    super.key,
    required this.authorId,
    required this.commentList,
    required this.postId,
    required this.commentController,
  });

  final String postId;
  final String authorId;
  final List<Comment>? commentList;
  final CommentInputController commentController;
=======
import 'package:frontend/models/comment_model.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/ui/pages/view_post/comment_tile.dart';

List<Comment> comments = [
  Comment(
    userId: 'pingu',
    commentId: '5632',
    content: 'mocktail is a need~',
    timestamp: '2024-09-19T11:20:22.060068Z',
    likedBy: {'dian.nasar'},
  ),
  Comment(
    userId: 'eva.elfie',
    commentId: '25345',
    content: 'omg can i have the recipe?',
    timestamp: '2024-09-10T21:09:22.060068Z',
    likedBy: {
      'sharil.sirhan',
      'dian.nasar',
      'pingu',
    },
    replies: [
      Comment(
        userId: 'pingu',
        commentId: '16542',
        content: 'Me too',
        timestamp: '2024-09-10T21:09:22.060068Z',
        likedBy: {},
        level: 1,
      ),
      Comment(
        userId: 'dian.nasar',
        commentId: '78325',
        content:
            'Sure! I will share my complete recipe with the video this night :)',
        timestamp: '2024-09-10T21:09:22.060068Z',
        likedBy: {'pingu', 'eva.elfie'},
        level: 1,
      ),
    ],
  ),
  Comment(
    userId: 'syaril.sirhan',
    commentId: '25454',
    content: 'I guess I will buy some pomegranates tomorrow',
    timestamp: '2024-09-10T21:09:22.060068Z',
    likedBy: {
      'dian.nasar',
      'talha.taufiq',
      'sharil.sirhan',
      'syabil.sirhan',
    },
    replies: [
      Comment(
        userId: 'syabil.sirhan',
        commentId: '25455',
        content: 'can you buy some for me? I will pay you back hehe :P',
        timestamp: '2024-09-10T21:09:22.060068Z',
        likedBy: {
          'talha.taufiq',
          'sharil.sirhan',
          'syabil.sirhan',
        },
        level: 1,
      ),
    ],
  ),
];

class CommentList extends StatefulWidget {
  const CommentList({
    super.key,
    required this.authorId,
  });

  final String authorId;

  @override
  State<CommentList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  late List<Comment> _commentList;

  @override
  void initState() {
    super.initState();
    _commentList = comments;
  }
>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: StyledSize.lg),
<<<<<<< HEAD
      sliver: BlocBuilder<PostBloc, PostState>(
        buildWhen: (previous, current) {
          if (current is PostUpdatedState && current.post.postId == postId) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          List<Comment>? updatedComments = commentList;
          if (state is PostUpdatedState && state.post.postId == postId) {
            updatedComments = state.post.comments;
          }
          return buildCommentList(updatedComments);
=======
      sliver: SliverList.builder(
        itemCount: _commentList.length,
        itemBuilder: (BuildContext context, int index) {
          return CommentTile(
            comment: _commentList[index],
            authorId: widget.authorId,
          );
>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2
        },
      ),
    );
  }
<<<<<<< HEAD

  RenderObjectWidget buildCommentList(List<Comment>? commentList) {
    return commentList != null
        ? commentList.isNotEmpty
            ? SliverList.builder(
                itemCount: commentList.length,
                itemBuilder: (BuildContext context, int index) {
                  return CommentTile(
                    key: ValueKey(commentList[index].commentId),
                    comment: commentList[index],
                    authorId: authorId,
                    postId: postId,
                    commentController: commentController,
                  );
                },
              )
            : const SliverToBoxAdapter(
                child: Center(
                  child: Text('No comments yet'),
                ),
              )
        : const SliverToBoxAdapter(
            child: Center(
              child: Text('No comments available :('),
            ),
          );
  }
=======
>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2
}
