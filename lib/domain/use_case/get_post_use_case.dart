import 'package:injectable/injectable.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/domain/repository/post_repository.dart';

@singleton
class GetPostUseCase {
  final PostRepository _repository;

  GetPostUseCase(this._repository);

  Future<Post?> call(int id) async {
    return await _repository.getPostById(id);
  }
}
