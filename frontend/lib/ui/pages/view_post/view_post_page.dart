import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/post/post_bloc.dart';
import 'package:frontend/models/post_model.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/ui/components/btn_no_splash.dart';
import 'package:frontend/ui/components/content_wrapper.dart';
import 'package:frontend/ui/components/user_avatar.dart';
import 'package:frontend/ui/pages/view_post/comment_list.dart';
import 'package:frontend/ui/pages/view_post/new_comment.dart';
import 'package:frontend/utils/comment_input_controller.dart';
import 'package:frontend/utils/timestamp.dart';

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

class MainPostInteraction extends StatelessWidget {
  const MainPostInteraction({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      buildWhen: (previous, current) {
        if (current is PostUpdatedState && current.post.postId == post.postId) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        Post updatedPost = post;
        if (state is PostUpdatedState && state.post.postId == post.postId) {
          updatedPost = state.post;
        }
        return SliverAppBar(
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
                  '${updatedPost.comments.length} ${updatedPost.comments.length < 2 ? 'reply' : 'replies'}',
                  style: StyledText.title.sm,
                ),
                NoSplashButton(
                  onPressed: () {
                    context
                        .read<PostBloc>()
                        .add(LikePost(postId: updatedPost.postId));
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.favorite_outline_rounded),
                      Spacing.horizontal.xs,
                      Text('${updatedPost.likedBy.length}')
                    ],
                  ),
                ),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
          foregroundColor: StyledColor.black,
          backgroundColor: StyledColor.white,
          pinned: true,
          elevation: 1,
          shadowColor: StyledColor.grey,
        );
      },
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
          header: SizedBox(
            height: StyledSize.lg,
            child: Text(post.userId,
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
