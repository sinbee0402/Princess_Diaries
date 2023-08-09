import 'package:injectable/injectable.dart';
import 'package:princess_diaries/data/data_source/post_db.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/domain/repository/post_repository.dart';

@Singleton(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  PostDb db;

  PostRepositoryImpl(this.db);

  @override
  Future<List<Post>> getPosts() async {
    return await db.getPosts();
  }

  @override
  Future<Post?> getPostById(int id) async {
    return await db.getPostById(id);
  }

  @override
  Future<void> insertPost(Post post) async {
    await db.insertPost(post);
  }

  @override
  Future<void> deletetPost(Post post) async {
    await db.deletetPost(post);
  }

  @override
  Future<void> updateNote(Post post) async {
    await db.updateNote(post);
  }
}
