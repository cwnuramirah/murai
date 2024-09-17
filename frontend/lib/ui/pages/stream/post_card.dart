import 'package:flutter/material.dart';
import 'package:frontend/models/post_model.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/ui/pages/stream/interaction_bar.dart';
import 'package:frontend/ui/pages/stream/post_card_header.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.post,
  });

  final Post post;

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
                  username: post.username,
                  timestamp: post.timestamp,
                ),

                // Body
                post.postContent == null
                    ? const SizedBox.shrink()
                    : Text(
                        post.postContent!,
                      ),

                Spacing.vertical.sm,

                //PostCardFooter
                InteractionBar(post: post),
              ],
            ),
          )
        ],
      ),
    );
  }
}