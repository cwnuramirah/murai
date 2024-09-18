import 'package:flutter/material.dart';
import 'package:frontend/models/comment_model.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/ui/pages/view_post/comment_tile.dart';

class ViewReply extends StatefulWidget {
  const ViewReply({
    super.key,
    required this.replies, this.authorId,
  });

  final List<Comment> replies;
  final String? authorId;


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
                  return CommentTile(comment: widget.replies[index], authorId: widget.authorId,);
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
            Spacing.horizontal.sm,
            _expandReplies
                ? GestureDetector(
                    onTap: () => _setExpandReplies(),
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
                  )
                : GestureDetector(
                    onTap: () => _setExpandReplies(),
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
          ],
        ),
      ],
    );
  }
}
