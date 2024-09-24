import 'package:flutter/material.dart';
import 'package:frontend/models/comment_model.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/ui/pages/view_post/comment_tile.dart';

class CommentList extends StatefulWidget {
  const CommentList({
    super.key,
    required this.authorId,
    required this.commentList,
  });

  final String authorId;
  final List<Comment>? commentList;

  @override
  State<CommentList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: StyledSize.lg),
      sliver: widget.commentList != null
          ? widget.commentList!.isNotEmpty
              ? SliverList.builder(
                  itemCount: widget.commentList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CommentTile(
                      comment: widget.commentList![index],
                      authorId: widget.authorId,
                    );
                  },
                )
              : const SliverToBoxAdapter(
                  child: Center(
                    child: Text('No comment'),
                  ),
                )
          : const SliverToBoxAdapter(
              child: Center(
                child: Text('No comment'),
              ),
            ),
    );
  }
}
