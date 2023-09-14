import 'package:injectable/injectable.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/domain/repository/post_repository.dart';

@singleton
class GetPostsUseCase {
  final PostRepository _repository;

  GetPostsUseCase(this._repository);

  Future<List<Post>> call() async {
    List<Post> posts = await _repository.getPosts();

    return posts;
  }
}
