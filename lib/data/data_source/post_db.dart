import 'package:injectable/injectable.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:sqflite/sqflite.dart';

@singleton
class PostDb {
  Database _db;

  PostDb(this._db);

  Future<List<Post>> getPosts() async {
    // SELECT * FROM post
    final posts = await _db.query('post');
    return posts.map((e) => Post.fromJson(e)).toList();
  }

  Future<Post?> getPostById(int id) async {
    // SELECT * FROM note WHERE id = $id
    final posts = await _db.query(
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
    // INSERT INTO posts (id, emoji, date, content) VALUES (?, ?, ?, ?, ?)
    await _db.insert('post', post.toJson());
  }

  Future<void> deletePost(Post post) async {
    // DELETE FROM posts WHERE id = ?
    await _db.delete(
      'post',
      where: 'id = ?',
      whereArgs: [post.id],
    );
  }

  Future<void> updateNote(Post post) async {
    // UPDATE posts SET emoji = ?, date = ?, content = ? WHERE id = ?
    await _db.update(
      'post',
      post.toJson(),
      where: 'id = ?',
      whereArgs: [post.id],
    );
  }
}
