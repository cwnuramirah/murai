// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:frontend/models/comment_model.dart';

class Post extends Equatable {
  final String userId;
  final String postId;
  final String? postContent;
  final String timestamp;
  final Set<String> likedBy;
  final List<Comment> comments;

  const Post({
    required this.userId,
    required this.postId,
    this.postContent,
    required this.timestamp,
    required this.likedBy,
    required this.comments,
  });

  @override
  List<Object?> get props => [postId, userId, postContent, likedBy, comments];

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] as String,
      postId: json['postId'] as String,
      postContent:
          json['postContent'] != null ? json['postContent'] as String : null,
      timestamp: json['timestamp'] as String,
      likedBy: json['likedBy'] != null
          ? Set<String>.from(
              (json['likedBy'] as List<dynamic>).map((x) => x as String))
          : {},
      comments: json['comment'] != null
          ? List<Comment>.from(
              (json['comment'] as List<dynamic>).map<Comment>(
                (x) => Comment.fromJson(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'postId': postId,
      'postContent': postContent,
      'timestamp': timestamp,
      'likedBy': likedBy.toList(),
      'comment': comments.map((comment) => comment.toJson()).toList(),
    };
  }

  Post copyWith({
    String? userId,
    String? postId,
    String? postContent,
    String? timestamp,
    Set<String>? likedBy,
    List<Comment>? comments,
  }) {
    return Post(
      userId: userId ?? this.userId,
      postId: postId ?? this.postId,
      postContent: postContent ?? this.postContent,
      timestamp: timestamp ?? this.timestamp,
      likedBy: likedBy ?? this.likedBy,
      comments: comments ?? this.comments,
    );
  }
}
