import 'package:flutter/material.dart';
import 'package:frontend/bloc/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/models/post_model.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/ui/components/appbar_button_padding.dart';
import 'package:frontend/ui/components/btn_no_splash.dart';
import 'package:frontend/ui/pages/new_post/cancel_new_post_confirmation_modal.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  final _contentController = TextEditingController();
  bool contentIsNotEmpty = false;
  bool mediaIsNotEmpty = false;

  @override
  void initState() {
    super.initState();
    _contentController.addListener(_setContentIsNotEmpty);
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyledColor.greyLight,
      appBar: AppBar(
        leadingWidth: StyledSize.grid * 10,
        // Cancel Button
        leading: AppbarButtonMargin(
          child: NoSplashButton(
            onPressed: () => contentIsNotEmpty || mediaIsNotEmpty
                ? _cancelNewPostConfirmation(context)
                : Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ),
        actions: [
          // Post Button
          AppbarButtonMargin(
            child: TextButton(
              onPressed: contentIsNotEmpty || mediaIsNotEmpty
                  ? () {
                      context.read<PostBloc>().add(AddPost(Post(
                            username: 'dian.nasar',
                            userId: 'dnn1309x',
                            timestamp: DateTime.now().toUtc().toIso8601String(),
                            postContent: _contentController.text,
                            replyCount: 0,
                            likedBy: {},
                            postId: DateTime.now().toUtc().toIso8601String(),
                          )));
                      Navigator.pop(context);
                    }
                  : null,
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: StyledColor.grey,
                  disabledForegroundColor: StyledColor.greyDark,
                  padding: const EdgeInsets.symmetric(vertical: StyledSize.sm)),
              child: const Text('Post'),
            ),
          )
        ],
        backgroundColor: StyledColor.greyLight,
        foregroundColor: StyledColor.black,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(StyledSize.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: StyledColor.blue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  Spacing.horizontal.sm,
                  Expanded(
                    child: TextField(
                      controller: _contentController,
                      autofocus: true,
                      maxLines: 10,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "What's happening?",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(border: StyledBorder.greyTop),
            padding: const EdgeInsets.symmetric(vertical: StyledSize.sm, horizontal: StyledSize.md,),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                NoSplashButton(
                  textColor: StyledColor.blue,
                  onPressed: () {},
                  child: const Text('Media'),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: StyledSize.sm),
                    child: Text('|',
                        style: TextStyle(color: StyledColor.grey))),
                NoSplashButton(
                  textColor: StyledColor.blue,
                  onPressed: () {},
                  child: const Text('Poll'),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: StyledSize.sm),
                    child: Text('|',
                        style: TextStyle(color: StyledColor.grey))),
                NoSplashButton(
                  textColor: StyledColor.blue,
                  onPressed: () {},
                  child: const Text('Files'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _setContentIsNotEmpty() {
    //TODO: This setState only for testing. check textfield/media/poll/file is empty
    setState(() {
      mediaIsNotEmpty = contentIsNotEmpty;
    });
    if (_contentController.text.isNotEmpty) {
      setState(() {
        contentIsNotEmpty = true;
      });
      return true;
    } else {
      setState(() {
        contentIsNotEmpty = false;
      });
      return false;
    }
  }

  Future<dynamic> _cancelNewPostConfirmation(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return const CancelNewPostConfirmationModal();
      },
    );
  }
}
