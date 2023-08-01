import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/domain/repository/post_repository.dart';

class UpdatePostUseCase {
  final PostRepository _repository;

  UpdatePostUseCase(this._repository);

  Future<void> call(Post post) async {
    await _repository.updateNote(post);
  }
}
