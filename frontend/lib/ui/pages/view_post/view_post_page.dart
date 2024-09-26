import 'package:flutter/material.dart';
import 'package:frontend/models/post_model.dart';
import 'package:frontend/theme.dart';
<<<<<<< HEAD
import 'package:frontend/ui/pages/view_post/comment_list.dart';
import 'package:frontend/ui/pages/view_post/main_post.dart';
import 'package:frontend/ui/pages/view_post/new_comment.dart';
import 'package:frontend/utils/comment_input_controller.dart';
=======
import 'package:frontend/ui/components/content_wrapper.dart';
import 'package:frontend/ui/components/user_avatar.dart';
import 'package:frontend/ui/pages/view_post/comment_list.dart';
import 'package:frontend/ui/pages/view_post/new_comment.dart';
import 'package:frontend/utils/timestamp.dart';
>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2

class ViewPostPage extends StatefulWidget {
  const ViewPostPage({super.key, required this.post});

  final Post post;

  @override
  State<ViewPostPage> createState() => _ViewPostPageState();
}

class _ViewPostPageState extends State<ViewPostPage> {
<<<<<<< HEAD
  final CommentInputController _commentController = CommentInputController();
=======
>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2
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
<<<<<<< HEAD
          MainPostInteraction(post: widget.post),
          // TODO: optimize author parameter
          CommentList(
            postId: widget.post.postId,
            authorId: widget.post.userId,
            commentList: widget.post.comments,
            commentController: _commentController,
          ),
          // TODO: refactor height below bottomsheet
          SliverToBoxAdapter(
            child: SizedBox(
                height: StyledTextField.bottomTextFieldHeightConstraint.minHeight),
          ),
        ],
      ),
      bottomSheet: NewComment(
        postId: widget.post.postId,
        controller: _commentController,
      ),
=======
          SliverAppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(border: StyledBorder.greyTop),
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
          // TODO: refactor height below bottomsheet
          SliverToBoxAdapter(
            child: SizedBox(
                height:
                    StyledTextField.bottomTextFieldHeightConstraint.minHeight),
          ),
        ],
      ),
      bottomSheet: NewComment(postId: widget.post.postId),
>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2
    );
  }
}

<<<<<<< HEAD
=======
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
          header: SizedBox(
            height: StyledSize.lg,
            child: Text(post.username,
                style: const TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 16.0)),
          ),
          body: [
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
            Text(
              Timestamp.fullTime12H(post.timestamp),
              style: const TextStyle(color: StyledColor.greyDark),
            ),
          ],
        ),
      ),
    );
  }
}
>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2
