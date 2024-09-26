import 'package:flutter/material.dart';
import 'package:frontend/models/post_model.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/ui/pages/view_post/comment_list.dart';
import 'package:frontend/ui/pages/view_post/main_post.dart';
import 'package:frontend/ui/pages/view_post/new_comment.dart';
import 'package:frontend/utils/comment_input_controller.dart';

class ViewPostPage extends StatefulWidget {
  const ViewPostPage({super.key, required this.post});

  final Post post;

  @override
  State<ViewPostPage> createState() => _ViewPostPageState();
}

class _ViewPostPageState extends State<ViewPostPage> {
  final CommentInputController _commentController = CommentInputController();
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
    );
  }
}

