class Comment {
  final String userId;
  final String commentId;
  final String content;
  final String timestamp;
  final List<Comment>? replies;
  final int level;
  final Set<String> likedBy;

  Comment({
    required this.userId,
    required this.commentId,
    required this.content,
    required this.timestamp,
    this.replies,
    this.level = 0,
    required this.likedBy,
  });

  List<Object?> get props => [
        userId,
        commentId,
        content,
        timestamp,
        replies,
        level,
        likedBy,
      ];
}
