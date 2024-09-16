import 'package:flutter/material.dart';
import 'package:frontend/models/post_model.dart';
import 'package:frontend/theme.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    super.key,
    required this.post,
  });

  final Post post;

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
                PostCardHeader(
                  username: widget.post.username,
                  timestamp: widget.post.timestamp,
                ),

                // Body
                widget.post.postContent == null
                    ? const SizedBox.shrink()
                    : Text(
                        widget.post.postContent!,
                      ),

                Spacing.vertical.sm,

                //PostCardFooter
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Like
                    PostActionButton(
                      action: 'like',
                      onTap: () {},
                      count: widget.post.likeCount,
                      icon: Icons.favorite_border_rounded,
                    ),

                    Spacing.horizontal.md,

                    // Reply
                    PostActionButton(
                      action: 'reply',
                      onTap: () {},
                      count: widget.post.replyCount,
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

class PostCardHeader extends StatelessWidget {
  const PostCardHeader({
    super.key,
    required this.username,
    required this.timestamp,
  });

  final String username;
  final String timestamp;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          username,
          style: StyledText.title.sm,
        ),
        Spacing.horizontal.sm,
        Text(
          timestamp,
          style: const TextStyle(color: StyledColor.greyDark),
        ),
      ],
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
