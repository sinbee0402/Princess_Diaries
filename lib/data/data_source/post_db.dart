import 'package:injectable/injectable.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:sqflite/sqflite.dart';

@singleton
class PostDb {
  Database db;

  PostDb(this.db);

  Future<List<Post>> getPosts() async {
    // SELECT * FROM posts
    final posts = await db.query('post');
    return posts.map((e) => Post.fromJson(e)).toList();
  }

  Future<Post?> getPostById(int id) async {
    // SELECT * FROM note WHERE id = $id
    final posts = await db.query(
      'post',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (posts.isNotEmpty) {
      return Post.fromJson(posts.first);
    }
    return null;
  }

  Future<void> insertPost(Post post) async {
    // INSERT INTO posts (id, emoji, date, title, content) VALUES (?, ?, ?, ?, ?)
    await db.insert('post', post.toJson());
  }

  Future<void> deletetPost(Post post) async {
    // DELETE FROM posts WHERE id = ?
    await db.delete(
      'post',
      where: 'id = ?',
      whereArgs: [post.id],
    );
  }

  Future<void> updateNote(Post post) async {
    // UPDATE posts SET emoji = ?, date = ?, title = ?, content = ? WHERE id = ?
    await db.update(
      'post',
      post.toJson(),
      where: 'id = ?',
      whereArgs: [post.id],
    );
  }
}
