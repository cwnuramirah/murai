import 'package:flutter/material.dart';

class CommentInputController {
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool enableTapRegion = false;

  VoidCallback? onFocusChangeCallback;
  String? parentCommentId; 

  CommentInputController() {
    focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (onFocusChangeCallback != null) {
      onFocusChangeCallback!(); // Notify the widget to rebuild
    }
  }

  void focusComment({String? parentId}) {
    parentCommentId = parentId; // Store parent comment ID if replying
    enableTapRegion = true;
    focusNode.requestFocus();
  }

  void unfocusComment() {
    if (focusNode.hasFocus) {
      focusNode.unfocus();
    }
    enableTapRegion = false;
    parentCommentId = null; // Reset after unfocusing
  }

  void clearComment() {
    textController.clear();
  }

  void dispose() {
    textController.dispose();
    focusNode.removeListener(_onFocusChange);
    focusNode.dispose();
  }
}
