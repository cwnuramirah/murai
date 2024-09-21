import 'package:flutter/material.dart';
import 'package:frontend/theme.dart';

/// Based on [TextButton] with transparent `overlayColor`
class NoSplashButton extends StatelessWidget {
  const NoSplashButton(
      {super.key, this.onPressed, required this.child, this.textColor});

  final Color? textColor;
  final Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed == null ? {} : onPressed!(),
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        foregroundColor: textColor ?? StyledColor.blue,
        visualDensity: VisualDensity.compact
      ).copyWith(
        overlayColor:
            MaterialStateColor.resolveWith((states) => Colors.transparent),
      ),
      child: child,
    );
  }
}
