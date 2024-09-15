import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/models/post_model.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<LoadPost>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(PostLoaded(allPost: _initList));
    });
    on<AddPost>((event, emit) {
      if (state is PostLoaded) {
        final state = this.state as PostLoaded;
        emit(
          PostLoaded(
            allPost: List.from(state.allPost)..add(event.post),
          ),
        );
      }
    });
  }
}

List<Post> _initList = [
  const Post(
    username: 'dian.nasar',
    userId: 'dnn1309x',
    timestamp: '2024-09-14T13:24:55 +08:00',
    postId: '156546',
    postContent:
        "Good evening Murai! I made pomegranate mocktail with few shots of homemade hibiscus syrup tonight :D",
    likeCount: 23,
    replyCount: 4,
  ),
  const Post(
    username: 'eva.elfie',
    userId: 'evv1257w',
    timestamp: '2024-09-14T15:54:12 +08:00',
    postContent:
        "Mood right now: craving for ebi gyoza dumpling with mentai sauce >.<",
    postId: '156548',
    likeCount: 13,
    replyCount: 2,
  ),
];
