import 'package:flutter/material.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/utils/timestamp.dart';

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
          Timestamp.timeAgo(timestamp),
          style: const TextStyle(color: StyledColor.greyDark),
        ),
      ],
    );
  }
}