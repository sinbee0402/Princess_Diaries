import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:princess_diaries/domain/model/post.dart';

@singleton
class PostDb {
  final db = FirebaseFirestore.instance;

  Future<List<Post>> getPosts() async {
    final _snapshot = await db.collection('Posts').get();
    List<Post> posts = _snapshot.docs
        .map(
          (e) => Post.fromJson(e.data()),
        )
        .toList();
    return posts;
  }

  Future<Post?> getPostById(int id) async {
    final post = await db.collection('Posts').doc('$id');
    post.get().then(
      (value) {
        final data = value.data() as Map<String, dynamic>;
        return Post.fromJson(data);
      },
      onError: (e) => print('Error getting document: $e'),
    );
  }

  Future<void> insertPost(Post post) async {
    await db.collection('Posts').doc('${post.id}').set({
      'emoji': post.emoji,
      'date': post.date,
      'title': post.title,
      'content': post.content,
    });
  }

  Future<void> deletetPost(Post post) async {
    await db.collection('Posts').doc('${post.id}').delete();
  }

  Future<void> updateNote(Post post) async {
    await db.collection('Posts').doc('${post.id}').update({
      'emoji': post.emoji,
      'date': post.date,
      'title': post.title,
      'content': post.content,
    });
  }
}
