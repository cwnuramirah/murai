import 'package:flutter/material.dart';
import 'package:frontend/theme.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: StyledColor.blue,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
