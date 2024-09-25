import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/post/post_bloc.dart';
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
  bool enableTapRegion = false;

  @override
  void initState() {
    super.initState();
    _commentFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(
        () {}); // Empty on purpose. This triggers a rebuild when the focus changes
  }

  void _focusComment() {
    if (!enableTapRegion) {
      // Start detecting any outside tap
      setState(() {
        enableTapRegion = true;
      });
    }
  }

  void _unfocusComment() {
    if (_commentFocusNode.hasFocus) {
      _commentFocusNode.unfocus();
    }

    // Stop tracking tap if comment unfocused
    setState(() {
      enableTapRegion = false;
    });
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
    return TapRegion(
      enabled: enableTapRegion,
      onTapOutside: (event) => _unfocusComment(),
      child: Container(
        decoration: const BoxDecoration(
          border: StyledBorder.greyTop,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: StyledSize.md,
          vertical: StyledSize.sm,
        ),
        constraints: StyledTextField.bottomTextFieldHeightConstraint,
        child: Column(
          crossAxisAlignment: _commentFocusNode.hasPrimaryFocus
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: StyledSize.xs),
                    child: UserAvatar(),
                  ),
                  Spacing.horizontal.sm,
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      focusNode: _commentFocusNode,
                      autofocus: false,
                      onTap: () => _focusComment(),
                      maxLength: 200,
                      decoration: StyledTextField.denseGreyInput.copyWith(
                        hintText: 'Add comment...',
                        counter: _commentFocusNode.hasPrimaryFocus
                            ? null
                            : const SizedBox.shrink(),
                      ),
                      maxLines: _commentFocusNode.hasPrimaryFocus ? null : 1,
                    ),
                  ),
                ],
              ),
            ),
            _commentFocusNode.hasPrimaryFocus
                ? Spacing.vertical.sm
                : const SizedBox.shrink(),
            _commentFocusNode.hasPrimaryFocus
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<PostBloc>().add(AddComment(postId: widget.postId, comment: _commentController.text));
                          _unfocusComment();
                          _commentController.clear();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: StyledSize.sm,
                              horizontal: StyledSize.md),
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
      ),
    );
  }
}
