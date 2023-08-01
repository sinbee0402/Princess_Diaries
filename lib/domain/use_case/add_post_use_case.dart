import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/domain/repository/post_repository.dart';

class AddPostUseCase {
  final PostRepository _repository;

  AddPostUseCase(this._repository);

  Future<void> call(Post post) async {
    await _repository.insertPost(post);
  }
}
