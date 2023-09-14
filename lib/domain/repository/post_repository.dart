import 'package:princess_diaries/domain/model/post.dart';

abstract interface class PostRepository {
  // 포스트(타임라인 목록) 불러오기
  Future<List<Post>> getPosts();
  // 포스트 정보/내용 불러오기
  Future<Post?> getPostById(int id);
  // 포스트 추가하기
  Future<void> insertPost(Post post);
  // 포스트 삭제하기
  Future<void> deletePost(Post post);
  // 포스트 수정하기
  Future<void> updatePost(Post post);
}
