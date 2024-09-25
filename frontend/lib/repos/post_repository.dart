import 'dart:convert';

import 'package:frontend/models/comment_model.dart';
import 'package:frontend/models/post_model.dart';

class PostRepository {
  // Storing the parsed posts in-memory
  List<Post> _posts = [];

  // Mock data
  final _mockResponse = ''' 
  [
    {
      "userId": "eva.elfie",
      "timestamp": "2024-09-19T11:09:22.060068Z",
      "postId": "156548",
      "postContent": "Craving for ebi gyoza dumpling with mentai sauce >.<",
      "likedBy": [
        "dian.nasar",
        "talha.taufiq",
        "sharil.sirhan"
      ],
      "comment": [
        {
          "userId": "pingu",
          "commentId": "5632",
          "content": "dumpling is a need~",
          "timestamp": "2024-09-10T20:09:22.060068Z",
          "likedBy": [
            "dian.nasar"
          ]
        }
      ]
    },
    {
      "userId": "dian.nasar",
      "timestamp": "2024-09-10T20:09:22.060068Z",
      "postId": "156546",
      "postContent": "I made pomegranate mocktail with few shots of homemade hibiscus syrup tonight :D",
      "likedBy": [
        "dian.nasar",
        "eva.elfie",
        "talha.taufiq",
        "sharil.sirhan",
        "pingu",
        "pucca"
      ],
      "comment": [
        {
          "userId": "pingu",
          "commentId": "5632",
          "content": "mocktail is a need~",
          "timestamp": "2024-09-10T20:09:22.060068Z",
          "likedBy": [
            "dian.nasar"
          ]
        },
        {
          "userId": "eva.elfie",
          "commentId": "25345",
          "content": "omg can i have the recipe?",
          "timestamp": "2024-09-10T20:09:22.060068Z",
          "likedBy": [
            "sharil.sirhan",
            "dian.nasar",
            "pingu"
          ],
          "replies": [
            {
              "userId": "pingu",
              "commentId": "16542",
              "content": "Me too",
              "timestamp": "2024-09-10T20:09:22.060068Z",
              "likedBy": [],
              "level": 1
            },
            {
              "userId": "dian.nasar",
              "commentId": "78325",
              "content": "Sure! I will share my complete recipe with the video this night :)",
              "timestamp": "2024-09-10T20:09:22.060068Z",
              "likedBy": [
                "pingu",
                "eva.elfie"
              ],
              "level": 1
            }
          ]
        },
        {
          "userId": "syaril.sirhan",
          "commentId": "25454",
          "content": "I guess I will buy some pomegranates tomorrow",
          "timestamp": "2024-09-10T20:09:22.060068Z",
          "likedBy": [
            "dian.nasar",
            "talha.taufiq",
            "sharil.sirhan",
            "syabil.sirhan"
          ],
          "replies": [
            {
              "userId": "syabil.sirhan",
              "commentId": "25455",
              "content": "can you buy some for me? I will pay you back hehe :P",
              "timestamp": "2024-09-10T20:09:22.060068Z",
              "likedBy": [
                "talha.taufiq",
                "sharil.sirhan",
                "syabil.sirhan"
              ],
              "level": 1
            }
          ]
        }
      ]
    }
  ]''';

  Future<List<Post>> getAllPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    final List<dynamic> jsonData = jsonDecode(_mockResponse);
    _posts = jsonData
        .map((post) => Post.fromJson(post as Map<String, dynamic>))
        .toList();

    return _posts;

    // final response = await http.get(Uri.parse(apiUrl));

    // if (response.statusCode == 200) {
    //   final List<dynamic> jsonData = jsonDecode(response.body);
    //   return jsonData.map((post) => Post.fromJson(post as Map<String, dynamic>)).toList();
    // } else {
    //   throw Exception('Failed to load posts');
    // }
  }

  Future<Post> getPostById(String postId) async {
    final post = _posts.firstWhere((post) => post.postId == postId);

    return post;
  }

  Future<Post> createPost(String? content) async {
    final newPost = Post(
      userId: 'current.user',
      postId: DateTime.now().millisecondsSinceEpoch.toString(),
      postContent: content,
      timestamp: DateTime.now().toUtc().toIso8601String(),
      likedBy: const {},
      comments: const [],
    );

    _posts = List<Post>.from(_posts)..insert(0, newPost);

    // final response = await http.post(
    //   Uri.parse(apiUrl),
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode(newPost.toJson()),
    // );

    // if (response.statusCode != 201) {
    //   throw Exception('Failed to create post');
    // }
    return newPost;
  }

  Future<void> updatePost(Post updatedPost) async {
    final updatedPostIndex =
        _posts.indexWhere((post) => post.postId == updatedPost.postId);
    _posts[updatedPostIndex] = updatedPost;
  }

  // Like a post by postId and userId
  Future<Post> likePost(String postId) async {
    const String userId = 'current.user';
    final post = _posts.firstWhere((post) => post.postId == postId);
    final isLiked = post.likedBy.contains(userId);

    // Toggle like/unlike
    final updatedLikedBy = isLiked
        ? (Set<String>.from(post.likedBy)..remove(userId))
        : (Set<String>.from(post.likedBy)..add(userId));

    final updatedPost = post.copyWith(likedBy: updatedLikedBy);

    // Add the userId to the likedBy list if not already liked
    // if (!post.likedBy.contains(userId)) {
    //   // You can send a PATCH request to update the 'likedBy' field for a specific post
    //   final response = await http.patch(
    //     Uri.parse('$apiUrl/$postId/like'), // Endpoint to like a post
    //     headers: {'Content-Type': 'application/json'},
    //     body: jsonEncode({'userId': userId}),
    //   );

    //   if (response.statusCode != 200) {
    //     throw Exception('Failed to like post');
    //   }
    // } else {
    //   post.likedBy.remove(userId);
    // }
    return updatedPost;
  }

  // Add a comment to a post
  Future<Post> addComment(String postId, String commentContent) async {
    final newComment = Comment(
      userId: 'current.user', // You would replace this with actual user ID
      commentId: DateTime.now().millisecondsSinceEpoch.toString(),
      content: commentContent,
      timestamp: DateTime.now().toUtc().toIso8601String(),
      replies: const [],
      likedBy: const {},
    );

    final post = _posts.firstWhere((post) => post.postId == postId);
    final updatedPost = post.copyWith(
      comments: List<Comment>.from(post.comments)..add(newComment),
    );

    // // Send a POST request to add a comment to the post
    // final response = await http.post(
    //   Uri.parse('$apiUrl/$postId/comments'), // Endpoint to add a comment
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode(commentData),
    // );

    // if (response.statusCode != 201) {
    //   throw Exception('Failed to add comment');
    // }
    return updatedPost;
  }
}
