import 'package:flutter/material.dart';
import 'package:frontend/models/comment_model.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/ui/pages/view_post/comment_tile.dart';

List<Comment> comments = [
  Comment(
    userId: 'pingu',
    commentId: '5632',
    content: 'mocktail is a need~',
    timestamp: '1d',
    likedBy: {'dian.nasar'},
  ),
  Comment(
    userId: 'eva.elfie',
    commentId: '25345',
    content: 'omg can i have the recipe?',
    timestamp: '22h',
    likedBy: {
      'sharil.sirhan',
      'dian.nasar',
      'pingu',
    },
    replies: [
      Comment(
        userId: 'pingu',
        commentId: '16542',
        content: 'Me too',
        timestamp: '22h',
        likedBy: {},
        level: 1,
      ),
      Comment(
        userId: 'dian.nasar',
        commentId: '78325',
        content:
            'Sure! I will share my complete recipe with the video this night :)',
        timestamp: '21h',
        likedBy: {'pingu', 'eva.elfie'},
        level: 1,
      ),
    ],
  ),
  Comment(
    userId: 'syaril.sirhan',
    commentId: '25454',
    content: 'I guess I will buy some pomegranates tomorrow',
    timestamp: DateTime.now().toIso8601String(),
    likedBy: {
      'dian.nasar',
      'talha.taufiq',
      'sharil.sirhan',
      'syabil.sirhan',
    },
    replies: [
      Comment(
        userId: 'syabil.sirhan',
        commentId: '25455',
        content: 'can you buy some for me? I will pay you back hehe :P',
        timestamp: DateTime.now().toIso8601String(),
        likedBy: {
          'talha.taufiq',
          'sharil.sirhan',
          'syabil.sirhan',
        },
        level: 1,
      ),
    ],
  ),
];

class CommentList extends StatefulWidget {
  const CommentList({
    super.key,
    required this.authorId,
  });

  final String authorId;

  @override
  State<CommentList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  late List<Comment> _commentList;

  @override
  void initState() {
    super.initState();
    _commentList = comments;
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: StyledSize.lg),
      sliver: SliverList.builder(
        itemCount: _commentList.length,
        itemBuilder: (BuildContext context, int index) {
          return CommentTile(
            comment: _commentList[index],
            authorId: widget.authorId,
          );
        },
      ),
    );
  }
}
