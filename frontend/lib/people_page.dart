import 'package:flutter/material.dart';
import 'package:frontend/theme.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({super.key});

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyledColor.greyLight,
      appBar: AppBar(
        title: Text(
          'People',
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
      body: const Column(
        children: [
          Center(child: Text('No people'))
        ],
      ),
    );
  }
}