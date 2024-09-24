import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  final String userId;
  final String commentId;
  final String content;
  final String timestamp;
  final List<Comment>? replies;
  final int level;
  final Set<String> likedBy;

  const Comment({
    required this.userId,
    required this.commentId,
    required this.content,
    required this.timestamp,
    this.replies,
    this.level = 0,
    required this.likedBy,
  });

  @override
  List<Object?> get props => [
        userId,
        commentId,
        content,
        timestamp,
        replies,
        level,
        likedBy,
      ];

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      userId: json['userId'] as String,
      commentId: json['commentId'] as String,
      content: json['content'] as String,
      timestamp: json['timestamp'] as String,
      replies: json['replies'] != null
          ? List<Comment>.from(
              (json['replies'] as List<dynamic>).map<Comment?>(
                (x) => Comment.fromJson(x as Map<String, dynamic>),
              ),
            )
          : [],
      level: json['level'] != null ? json['level'] as int : 0,
      likedBy: json['likedBy'] != null
          ? Set<String>.from(
              (json['likedBy'] as List<dynamic>).map((x) => x as String),
            )
          : {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'commentId': commentId,
      'content': content,
      'timestamp': timestamp,
      'replies': replies ?? replies?.map((reply) => reply.toJson()).toList(),
      'level': level,
      'likedBy': likedBy.toList(),
    };
  }
}
