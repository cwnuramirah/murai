import 'package:flutter/material.dart';
import 'package:frontend/models/comment_model.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/ui/pages/view_post/comment_tile.dart';
<<<<<<< HEAD
import 'package:frontend/utils/comment_input_controller.dart';

class ViewReply extends StatefulWidget {
  /// View replies of a comment
  const ViewReply({
    super.key,
    required this.replies,
    this.authorId,
    required this.postId,
    this.parentCommentId,
    required this.commentController,
=======

class ViewReply extends StatefulWidget {
  const ViewReply({
    super.key,
    required this.replies, this.authorId,
>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2
  });

  final List<Comment> replies;
  final String? authorId;
<<<<<<< HEAD
  final String postId;
  final String? parentCommentId;
  final CommentInputController commentController;
=======

>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2

  @override
  State<ViewReply> createState() => _ViewReplyState();
}

class _ViewReplyState extends State<ViewReply> {
  bool _expandReplies = false;

  void _setExpandReplies() {
    setState(() {
      _expandReplies = !_expandReplies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _expandReplies
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.replies.length,
                itemBuilder: (context, index) {
<<<<<<< HEAD
                  return CommentTile(
                    comment: widget.replies[index],
                    authorId: widget.authorId,
                    postId: widget.postId,
                    parentCommentId: widget.parentCommentId,
                    commentController: widget.commentController,
                  );
=======
                  return CommentTile(comment: widget.replies[index], authorId: widget.authorId,);
>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2
                },
              )
            : const SizedBox.shrink(),
        Row(
          children: [
            const Text(
              '――',
              style: TextStyle(
                color: StyledColor.grey,
              ),
            ),
            _expandReplies
                ? GestureDetector(
                    onTap: () => _setExpandReplies(),
                    child: Padding(
<<<<<<< HEAD
                      padding:
                          const EdgeInsets.symmetric(horizontal: StyledSize.sm),
=======
                      padding: const EdgeInsets.symmetric(horizontal: StyledSize.sm),
>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2
                      child: Row(
                        children: [
                          const Text(
                            'Hide',
                            style: TextStyle(
                              color: StyledColor.greyDark,
                            ),
                          ),
                          Spacing.horizontal.xs,
                          const Icon(
                            Icons.keyboard_arrow_up_rounded,
                            size: 16.0,
                            color: StyledColor.greyDark,
                          ),
                        ],
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () => _setExpandReplies(),
                    child: Padding(
<<<<<<< HEAD
                      padding:
                          const EdgeInsets.symmetric(horizontal: StyledSize.sm),
=======
                      padding:  const EdgeInsets.symmetric(horizontal: StyledSize.sm),
>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2
                      child: Row(
                        children: [
                          Text(
                            'View ${widget.replies.length < 2 ? 'reply' : '${widget.replies.length} replies'}',
                            style: const TextStyle(
                              color: StyledColor.greyDark,
                            ),
                          ),
                          Spacing.horizontal.xs,
                          const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 16.0,
                            color: StyledColor.greyDark,
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ],
    );
  }
}
