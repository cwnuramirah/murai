import 'package:flutter/material.dart';
import 'package:frontend/models/post_model.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/ui/components/content_wrapper.dart';
import 'package:frontend/ui/components/user_avatar.dart';
import 'package:frontend/ui/pages/stream/interaction_bar.dart';
import 'package:frontend/ui/pages/stream/post_card_header.dart';
import 'package:frontend/ui/pages/view_post/view_post_page.dart';

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
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ViewPostPage(post: widget.post),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: StyledSize.md,
          vertical: StyledSize.sm,
        ),
        padding: const EdgeInsets.all(StyledSize.md),
        decoration: const BoxDecoration(
          color: StyledColor.white,
          borderRadius: StyledBorder.rounded,
        ),
        child: ContentWrapper(
          leading: const UserAvatar(),
          header: PostCardHeader(
            username: widget.post.userId,
            timestamp: widget.post.timestamp,
          ),
          body: [
            widget.post.postContent == null
                ? const SizedBox.shrink()
                : Text(
                    widget.post.postContent!,
                  ),
            // TODO: display media/poll
            // widget.post.postContent == null
            //     ? const SizedBox.shrink()
            //     : Text(
            //         widget.post.postContent!,
            //       ),
          ],
          footer: InteractionBar(post: widget.post),
        ),
      ),
    );
  }
}
