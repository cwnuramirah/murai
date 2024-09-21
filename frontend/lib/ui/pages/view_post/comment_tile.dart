import 'package:flutter/material.dart';
import 'package:frontend/models/comment_model.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/ui/components/content_wrapper.dart';
import 'package:frontend/ui/components/user_avatar.dart';
import 'package:frontend/ui/pages/view_post/view_reply.dart';
import 'package:frontend/utils/timestamp.dart';

class CommentTile extends StatefulWidget {
  const CommentTile({
    super.key,
    required this.comment,
    this.authorId,
  });
  final Comment comment;
  final String? authorId;

  @override
  State<CommentTile> createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  bool _checkAuthor() {
    var isAuthor = false;
    if (widget.authorId != null && widget.comment.level == 1) {
      isAuthor = widget.comment.userId == widget.authorId;
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
              widget.comment.userId,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            _checkAuthor() ? const Text('OP') : const SizedBox.shrink()
          ],
        ),
        body: [
          Text(widget.comment.content),
          Row(
            children: [
              Text(
                Timestamp.timeAgo(widget.comment.timestamp),
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
                    const Text(
                      'Reply',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: StyledColor.greyDark,
                      ),
                    ),
                    // Like reply button
                    Row(
                      children: [
                        const Icon(
                          Icons.favorite_outline_outlined,
                          size: 16.0,
                        ),
                        Spacing.horizontal.xs,
                        SizedBox(
                          width: StyledSize.grid * 5,
                          child: Text('${widget.comment.likedBy.length}'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
        footer: widget.comment.replies != null &&
                widget.comment.replies!.isNotEmpty &&
                widget.comment.level == 0
            ? ViewReply(
                replies: widget.comment.replies!,
                authorId: widget.authorId,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
