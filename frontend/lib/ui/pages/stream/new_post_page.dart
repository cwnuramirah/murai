import 'package:flutter/material.dart';
import 'package:frontend/theme.dart';
import 'package:frontend/ui/components/appbar_button_padding.dart';
import 'package:frontend/ui/components/btn_no_splash.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyledColor.greyLight,
      appBar: AppBar(
        leadingWidth: StyledSize.grid * 10,
        leading: AppbarButtonMargin(
          child: NoSplashButton(
              onPressed: () => cancelNewPostConfirmation(context),
              child: const Text('Cancel'),
            ),
        ),
        actions: [
          AppbarButtonMargin(
            child: TextButton(
              onPressed: () {
                // context.read<PostBloc>().add(AddPost(contentController.text));
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: StyledSize.sm)),
              child: const Text('Post'),
            ),
          )
        ],
        backgroundColor: StyledColor.greyLight,
        foregroundColor: StyledColor.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(StyledSize.md),
        child: Column(
          children: [
            Expanded(
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
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding:
                          const EdgeInsets.symmetric(vertical: StyledSize.sm)),
                  child: const Text('Media'),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding:
                          const EdgeInsets.symmetric(vertical: StyledSize.sm)),
                  child: const Text('Poll'),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding:
                          const EdgeInsets.symmetric(vertical: StyledSize.sm)),
                  child: const Text('Files'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> cancelNewPostConfirmation(BuildContext context) {
    return showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
            ),
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(StyledSize.lg),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context)
                        ..pop()
                        ..pop(),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        backgroundColor: StyledColor.greyLight,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        padding: const EdgeInsets.symmetric(
                          vertical: StyledSize.md,
                          horizontal: StyledSize.lg,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.delete_rounded),
                          Spacing.horizontal.md,
                          const Text('Delete'),
                        ],
                      ),
                    ),
                    Spacing.vertical.md,
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        backgroundColor: StyledColor.greyLight,
                        foregroundColor: StyledColor.black,
                        side: const BorderSide(color: StyledColor.black),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        padding: const EdgeInsets.symmetric(
                          vertical: StyledSize.md,
                          horizontal: StyledSize.lg,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.cancel_rounded),
                          Spacing.horizontal.md,
                          const Text('Cancel'),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
