import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: StyledSize.lg),
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
        },
      ),
    );
  }

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
}
