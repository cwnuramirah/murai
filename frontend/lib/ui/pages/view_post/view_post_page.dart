import 'package:flutter/material.dart';
import 'package:frontend/models/post_model.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/ui/components/content_wrapper.dart';
import 'package:frontend/ui/components/user_avatar.dart';
import 'package:frontend/ui/pages/view_post/comment_list.dart';
import 'package:frontend/ui/pages/stream/post_card_header.dart';
import 'package:frontend/ui/pages/view_post/new_comment.dart';

class ViewPostPage extends StatefulWidget {
  const ViewPostPage({super.key, required this.post});

  final Post post;

  @override
  State<ViewPostPage> createState() => _ViewPostPageState();
}

class _ViewPostPageState extends State<ViewPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyledColor.white,
      appBar: AppBar(
        backgroundColor: StyledColor.white,
        foregroundColor: StyledColor.black,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          MainPost(post: widget.post),
          SliverAppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: StyledColor.grey),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: StyledSize.md,
                horizontal: StyledSize.lg,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.post.replyCount} ${widget.post.replyCount < 2 ? 'reply' : 'replies'}',
                    style: StyledText.title.sm,
                  ),
                  const Icon(Icons.favorite_outline_rounded),
                ],
              ),
            ),
            automaticallyImplyLeading: false,
            foregroundColor: StyledColor.black,
            backgroundColor: StyledColor.white,
            pinned: true,
            elevation: 1,
            shadowColor: StyledColor.grey,
          ),
          // TODO: optimize author parameter
          CommentList(authorId: widget.post.username),
        ],
      ),
      bottomSheet: NewComment(postId: widget.post.postId),
    );
  }
}

class MainPost extends StatelessWidget {
  const MainPost({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: StyledSize.sm,
          horizontal: StyledSize.md,
        ),
        child: ContentWrapper(
          leading: const UserAvatar(),
          header: PostCardHeader(
            username: post.username,
            timestamp: post.timestamp,
          ),
          body: [
            Spacing.vertical.xs,
            post.postContent == null
                ? const SizedBox.shrink()
                : Text(
                    post.postContent!,
                    style: const TextStyle(fontSize: 18.0),
                  ),
            // TODO: display media/poll
            // post.postContent == null
            //     ? const SizedBox.shrink()
            //     : Text(
            //         post.postContent!,
            //       ),
          ],
        ),
      ),
    );
  }
}
