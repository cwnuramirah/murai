import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/post/post_bloc.dart';
import 'package:frontend/models/post_model.dart';
import 'package:frontend/theme.dart';

class InteractionBar extends StatelessWidget {
  const InteractionBar({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: PostActionButton(
            action: const ['comment', 'comments'],
            onTap: () {},
            count: post.comments.length,
            icon: Icons.comment_outlined,
          ),
        ),

        Expanded(
          child: PostActionButton(
            action: const ['like', 'likes'],
            onTap: () {
              context.read<PostBloc>().add(LikePost(postId: post.postId));
            },
            count: post.likedBy.length,
            icon: Icons.favorite_border_rounded,
          ),
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

  final List<String> action;
  final Function()? onTap;
  final IconData icon;
  final int count;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: StyledSize.md,
          ),
          Spacing.horizontal.xs,
          Text('$count ${action[count < 2 ? 0 : 1]}'),
        ],
      ),
    );
  }
}
