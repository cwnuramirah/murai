import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/post/post_bloc.dart';
import 'package:frontend/navigation.dart';
import 'package:frontend/repos/post_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PostRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  PostBloc(postRepository: context.read<PostRepository>())
                    ..add(FetchPosts())),
        ],
        child: MaterialApp(
          title: 'Murai',
          theme: ThemeData(fontFamily: 'Inter'),
          debugShowCheckedModeBanner: false,
          home: const Navigation(),
        ),
      ),
    );
  }
}
