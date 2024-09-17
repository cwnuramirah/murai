import 'package:flutter/material.dart';
import 'package:frontend/theme.dart';

class ContentWrapper extends StatelessWidget {
  const ContentWrapper({
    super.key,
    required this.leading,
    required this.header,
    required this.body,
    this.footer,
    this.trailing,
  });

  final Widget leading;
  final Widget header;
  final List<Widget> body;
  final Widget? footer;
  final Widget? trailing;

  /// I just prefer not to nest another Column so I manually flatten the list
  List<Widget> _getBody() {
    final List<Widget> itemWithSpacing = [];

    for (var widget in body) {
      itemWithSpacing.addAll([widget, Spacing.vertical.sm]);
    }

    return itemWithSpacing;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        leading,
        Spacing.horizontal.sm,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header,
              if (body.isNotEmpty) ..._getBody(),
              footer ?? const SizedBox.shrink(),
            ],
          ),
        ),
        trailing ?? const SizedBox.shrink(),
      ],
    );
  }
}
