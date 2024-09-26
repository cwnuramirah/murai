import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/post/post_bloc.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/ui/components/user_avatar.dart';
import 'package:frontend/utils/comment_input_controller.dart';

class NewComment extends StatefulWidget {
  const NewComment({
    super.key,
    required this.postId,
    required this.controller,
  });

  final String postId;
  final CommentInputController controller;

  @override
  State<NewComment> createState() => _NewCommentState();
}

class _NewCommentState extends State<NewComment> {
  @override
  void initState() {
    super.initState();
    widget.controller.onFocusChangeCallback = _onFocusChange;
  }

  void _onFocusChange() {
    setState(() {}); // Intentional empty setState to trigger rebuild on focus change
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      enabled: widget.controller.enableTapRegion,
      onTapOutside: (event) => widget.controller.unfocusComment(),
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
          crossAxisAlignment: widget.controller.focusNode.hasPrimaryFocus
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
                    ),
                  ),
                ],
              ),
            ),
            widget.controller.focusNode.hasPrimaryFocus
                ? Spacing.vertical.sm
                : const SizedBox.shrink(),
            widget.controller.focusNode.hasPrimaryFocus
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
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
