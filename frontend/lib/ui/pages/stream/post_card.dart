import 'package:flutter/material.dart';
import 'package:frontend/theme.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    super.key,
    required this.username,
    required this.timestamp,
    this.postContent,
    required this.likeCount,
    required this.replyCount,
  });

  final String username;
  final String timestamp;
  final String? postContent;
  final int likeCount;
  final int replyCount;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: StyledSize.md,
        vertical: StyledSize.sm,
      ),
      padding: const EdgeInsets.all(StyledSize.md),
      decoration: const BoxDecoration(
        color: StyledColor.white,
        borderRadius: StyledBorder.rounded,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: StyledColor.blue,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Spacing.horizontal.sm,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                //Header
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.username,
                      style: StyledText.title.sm,
                    ),
                    Spacing.horizontal.sm,
                    Text(
                      widget.timestamp,
                      style: const TextStyle(color: StyledColor.greyDark),
                    ),
                  ],
                ),

                // Body
                widget.postContent == null
                    ? const SizedBox.shrink()
                    : Text(
                        widget.postContent!,
                      ),

                Spacing.vertical.sm,

                //Footer
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Like
                    PostActionButton(
                      action: 'like',
                      onTap: () {},
                      count: widget.likeCount,
                      icon: Icons.favorite_border_rounded,
                    ),

                    Spacing.horizontal.md,

                    // Reply
                    PostActionButton(
                      action: 'reply',
                      onTap: () {},
                      count: widget.replyCount,
                      icon: Icons.comment_outlined,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PostActionButton extends StatelessWidget {
  const PostActionButton({
    super.key,
    required this.action,
    this.onTap,
    required this.icon,
    required this.count,
  });

  //TODO: action should be receive something like this: ['reply','replies']
  //so can render like this: count > 1 ? action[1] : action[0]
  final String action;
  final Function()? onTap;
  final IconData icon;
  final int count;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: StyledSize.md,
          ),
          Spacing.horizontal.xs,
          Text('$count')
        ],
      ),
    );
  }
}
