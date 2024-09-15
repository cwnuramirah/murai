
class Post {
  final String username;
  final String userId;
  final String timestamp;
  final String postId;
  final String? postContent;
  final int likeCount;
  final int replyCount;

  const Post({
    required this.username,
    required this.userId,
    required this.timestamp,
    required this.postId,
    this.postContent,
    required this.likeCount,
    required this.replyCount,
  });

  List<Object?> get props => [
        username,
        userId,
        timestamp,
        postId,
        postContent,
        likeCount,
        replyCount,
      ];

  static List<Post> allPost = [
    const Post(
      username: 'dian.nasar',
      userId: 'dnn1309x',
      timestamp: '2024-09-14T13:24:55 +08:00',
      postId: '156546',
      postContent: "Good evening Murai! I made pomegranate mocktail with few shots of homemade hibiscus syrup tonight :D",
      likeCount: 23,
      replyCount: 4,
    ),
    const Post(
      username: 'eva.elfie',
      userId: 'evv1257w',
      timestamp: '2024-09-14T15:54:12 +08:00',
      postContent: "Mood right now: craving for ebi gyoza dumpling with mentai sauce >.<",
      postId: '156548',
      likeCount: 13,
      replyCount: 2,
    ),
  ];
}
