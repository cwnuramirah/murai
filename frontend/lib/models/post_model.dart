class Post {
  final String username;
  final String userId;
  final String timestamp;
  final String postId;
  final String? postContent;
  final int replyCount;
  final Set<String> likedBy;

  const Post({
    required this.username,
    required this.userId,
    required this.timestamp,
    required this.postId,
    this.postContent,
    required this.replyCount,
    required this.likedBy,
  });

  List<Object?> get props => [
        username,
        userId,
        timestamp,
        postId,
        postContent,
        replyCount,
        likedBy,
      ];

  Post copyWith({
    String? username,
    String? userId,
    String? timestamp,
    String? postId,
    String? postContent,
    int? replyCount,
    Set<String>? likedBy,
  }) {
    return Post(
      username: username ?? this.username,
      userId: userId ?? this.userId,
      timestamp: timestamp ?? this.timestamp,
      postId: postId ?? this.postId,
      postContent: postContent ?? this.postContent,
      replyCount: replyCount ?? this.replyCount,
      likedBy: likedBy ?? {},
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'userId': userId,
      'timestamp': timestamp,
      'postId': postId,
      'postContent': postContent,
      'replyCount': replyCount,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      username: map['username'] as String,
      userId: map['userId'] as String,
      timestamp: map['timestamp'] as String,
      postId: map['postId'] as String,
      postContent:
          map['postContent'] != null ? map['postContent'] as String : null,
      replyCount: map['replyCount'] as int,
      likedBy: map['likedBy'] as Set<String>,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Post.fromJson(String source) => Post.fromMap(json.decode(source) as Map<String, dynamic>);
}
