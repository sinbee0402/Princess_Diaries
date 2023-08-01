import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/domain/repository/post_repository.dart';

class DeletePostUseCase {
  final PostRepository _repository;

  DeletePostUseCase(this._repository);

  Future<void> call(Post post) async {
    await _repository.deletetPost(post);
  }
}
