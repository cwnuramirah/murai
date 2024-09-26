import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/post/post_bloc.dart';
import 'package:frontend/models/comment_model.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/ui/components/content_wrapper.dart';
import 'package:frontend/ui/components/user_avatar.dart';
import 'package:frontend/ui/pages/view_post/view_reply.dart';
import 'package:frontend/utils/comment_input_controller.dart';
import 'package:frontend/utils/timestamp.dart';

class CommentTile extends StatelessWidget {
  /// UI for Comment & Reply
  const CommentTile({
    super.key,
    required this.comment,
    this.authorId,
    required this.postId,
    this.parentCommentId, required this.commentController,
  });
  final String postId;
  final Comment comment;
  /// A reply must pass this argument. Useful to handle events related to the reply to the comment.
  final String? parentCommentId;
  /// To display author tag if the commenter is the author of the main post
  final String? authorId;
  final CommentInputController commentController;

  bool _checkAuthor() {
    var isAuthor = false;
    if (authorId != null && comment.level == 1) {
      isAuthor = comment.userId == authorId;
    }

    return isAuthor;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: StyledSize.sm),
      child: ContentWrapper(
        leading: const UserAvatar(),
        header: Row(
          children: [
            Text(
              comment.userId,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacing.horizontal.md,
            _checkAuthor()
                ? const Text('OP', style: TextStyle(color: StyledColor.blue))
                : const SizedBox.shrink(),
          ],
        ),
        body: [
          Text(comment.content),
          Row(
            children: [
              Text(
                Timestamp.timeAgo(comment.timestamp),
                style: const TextStyle(
                  color: StyledColor.greyDark,
                ),
              ),
              Spacing.horizontal.md,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Reply button
                    GestureDetector(
                      onTap: () {
                        // if replying to comment
                        if (parentCommentId == null) {
                          commentController.focusComment(parentId: comment.commentId);
                        } else {
                          // if replying to reply
                          commentController.focusComment(parentId: parentCommentId!);
                        }
                      },
                      child: const Text(
                        'Reply',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: StyledColor.greyDark,
                        ),
                      ),
                    ),
                    LikeCommentButton(
                        comment: comment,
                        postId: postId,
                        parentCommentId: parentCommentId),
                  ],
                ),
              ),
            ],
          ),
        ],
        footer: comment.replies != null &&
                comment.replies!.isNotEmpty &&
                comment.level == 0
            ? ViewReply(
                replies: comment.replies!,
                authorId: authorId,
                postId: postId,
                parentCommentId: comment.commentId,
                commentController: commentController,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

class LikeCommentButton extends StatelessWidget {
  const LikeCommentButton({
    super.key,
    required this.comment,
    required this.postId,
    required this.parentCommentId,
  });

  final Comment comment;
  final String postId;
  /// To use when liking a reply to comment.
  final String? parentCommentId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        int commentLikeCount = comment.likedBy.length;
        if (state is PostUpdatedState && state.post.postId == postId) {
          commentLikeCount = state.post.likedBy.length;
        }
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                if (parentCommentId == null && comment.level == 0) {
                  context.read<PostBloc>().add(LikeComment(
                      postId: postId, commentId: comment.commentId));
                } else {
                  context.read<PostBloc>().add(LikeComment(
                      postId: postId,
                      commentId: parentCommentId!,
                      replyId: comment.commentId));
                }
              },
              child: const Icon(
                Icons.favorite_outline_outlined,
                size: 16.0,
              ),
            ),
            Spacing.horizontal.xs,
            SizedBox(
              width: StyledSize.grid * 5,
              child: Text('$commentLikeCount'),
            ),
          ],
        );
      },
    );
  }
}
