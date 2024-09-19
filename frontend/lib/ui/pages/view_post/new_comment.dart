import 'package:flutter/material.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/ui/components/user_avatar.dart';

class NewComment extends StatefulWidget {
  const NewComment({
    super.key,
    required this.postId,
  });

  final String postId;

  @override
  State<NewComment> createState() => _NewCommentState();
}

class _NewCommentState extends State<NewComment> {
  final TextEditingController _commentController = TextEditingController();
  final FocusNode _commentFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _commentFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(
        () {}); // Empty on purpose. This triggers a rebuild when the focus changes
  }

  @override
  void dispose() {
    _commentController.dispose();
    _commentFocusNode.removeListener(_onFocusChange);
    _commentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const inputDecoration = InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
          vertical: StyledSize.sm, horizontal: StyledSize.md),
      filled: true,
      fillColor: StyledColor.greyLight,
      border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(StyledSize.lg))),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(StyledSize.lg))),
    );

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: StyledColor.grey),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: StyledSize.md,
        vertical: StyledSize.sm,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: StyledSize.xs),
                child: UserAvatar(),
              ),
              Spacing.horizontal.sm,
              Expanded(
                child: TextField(
                  controller: _commentController,
                  focusNode: _commentFocusNode,
                  onTap: () {
                    _commentFocusNode.requestFocus();
                  },
                  onTapOutside: (event) {
                    _commentFocusNode.unfocus();
                  },
                  autofocus: false,
                  maxLength: 200,
                  decoration: inputDecoration.copyWith(hintText: 'Add comment...'),
                  maxLines: null,
                ),
              ),
            ],
          ),
          Spacing.vertical.sm,
          _commentFocusNode.hasPrimaryFocus ||
                  _commentController.text.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // const TextField(),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: StyledSize.sm, horizontal: StyledSize.md),
                        decoration: const BoxDecoration(
                          color: StyledColor.blue,
                          borderRadius: StyledBorder.rounded,
                        ),
                        child: const Icon(
                          Icons.arrow_outward_rounded,
                          size: 16.0,
                          color: StyledColor.white,
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
