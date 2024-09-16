import 'package:flutter/material.dart';
import 'package:frontend/theme.dart';

/// Add padding to leading/action button for AppBar
class AppbarButtonMargin extends StatelessWidget {
  const AppbarButtonMargin({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: StyledSize.sm,
        horizontal: StyledSize.md,
      ),
      child: child,
    );
  }
}
