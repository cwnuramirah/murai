import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/post/post_bloc.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/ui/components/user_avatar.dart';
import 'package:frontend/utils/comment_input_controller.dart';
=======
import 'package:frontend/theme.dart';
import 'package:frontend/ui/components/user_avatar.dart';
>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2

class NewComment extends StatefulWidget {
  const NewComment({
    super.key,
    required this.postId,
<<<<<<< HEAD
    required this.controller,
  });

  final String postId;
  final CommentInputController controller;
=======
  });

  final String postId;
>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2

  @override
  State<NewComment> createState() => _NewCommentState();
}

class _NewCommentState extends State<NewComment> {
<<<<<<< HEAD
  @override
  void initState() {
    super.initState();
    widget.controller.onFocusChangeCallback = _onFocusChange;
  }

  void _onFocusChange() {
    setState(() {}); // Intentional empty setState to trigger rebuild on focus change
=======
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
>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2
  }

  @override
  void dispose() {
<<<<<<< HEAD
    widget.controller.dispose();
=======
    _commentController.dispose();
    _commentFocusNode.removeListener(_onFocusChange);
    _commentFocusNode.dispose();
>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
<<<<<<< HEAD
      enabled: widget.controller.enableTapRegion,
      onTapOutside: (event) => widget.controller.unfocusComment(),
=======
      enabled: enableTapRegion,
      onTapOutside: (event) => _unfocusComment(),
>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2
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
<<<<<<< HEAD
          crossAxisAlignment: widget.controller.focusNode.hasPrimaryFocus
=======
          crossAxisAlignment: _commentFocusNode.hasPrimaryFocus
>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2
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
<<<<<<< HEAD
                      controller: widget.controller.textController,
                      focusNode: widget.controller.focusNode,
                      autofocus: false,
                      onTap: () => widget.controller.focusComment(),
                      maxLength: 200,
                      decoration: StyledTextField.denseGreyInput.copyWith(
                        hintText: widget.controller.parentCommentId != null ? 'Add reply...' : 'Add comment...',
                        counter: widget.controller.focusNode.hasPrimaryFocus
                            ? null
                            : const SizedBox.shrink(),
                      ),
                      maxLines: widget.controller.focusNode.hasPrimaryFocus
                          ? null
                          : 1,
=======
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
>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2
                    ),
                  ),
                ],
              ),
            ),
<<<<<<< HEAD
            widget.controller.focusNode.hasPrimaryFocus
                ? Spacing.vertical.sm
                : const SizedBox.shrink(),
            widget.controller.focusNode.hasPrimaryFocus
=======
            _commentFocusNode.hasPrimaryFocus
                ? Spacing.vertical.sm
                : const SizedBox.shrink(),
            _commentFocusNode.hasPrimaryFocus
>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
<<<<<<< HEAD
                          if (widget.controller.parentCommentId != null) {
                            // if replying to a comment
                            context.read<PostBloc>().add(ReplyComment(
                                  postId: widget.postId,
                                  reply: widget.controller.textController.text,
                                  parentCommentId:
                                      widget.controller.parentCommentId!,
                                ));
                          } else {
                            // add regular comment
                            context.read<PostBloc>().add(AddComment(
                                postId: widget.postId,
                                comment:
                                    widget.controller.textController.text));
                          }
                          widget.controller.unfocusComment();
                          widget.controller.clearComment();
=======
                          // _unfocusComment();
>>>>>>> 4b9d15e999610c99eeea16535c43de26c52234f2
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
