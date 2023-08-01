import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/domain/repository/post_repository.dart';

class GetPostsUseCase {
  final PostRepository _repository;

  GetPostsUseCase(this._repository);

  Future<List<Post>> getPosts() async {
    List<Post> posts = await _repository.getPosts();

    return posts;
  }
}
