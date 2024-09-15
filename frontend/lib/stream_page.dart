import 'package:flutter/material.dart';
import 'package:frontend/theme.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyledColor.greyLight,
      appBar: AppBar(
        title: Text(
          'Stream',
          style: StyledText.title.sm,
        ),
        shape: const Border(
          bottom: BorderSide(
            color: StyledColor.grey,
            width: 1,
          ),
        ),
        backgroundColor: StyledColor.greyLight,
        foregroundColor: StyledColor.black,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text('No post'),
            )
          ],
        ),
      ),
    );
  }
}
