import 'package:flutter/material.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/domain/repository/post_repository.dart';
import 'package:princess_diaries/presentation/time_line/time_line_state.dart';
import 'package:princess_diaries/presentation/time_line/time_line_ui_event.dart';

class TimeLineViewModel with ChangeNotifier {
  final PostRepository _repository;

  TimeLineState _state = const TimeLineState();
  TimeLineState get state => _state;

  Post? _recentlyDeletedPost;

  TimeLineViewModel(this._repository);

  void onEvent(TimeLineUiEvent event) {
    switch (event) {
      case LoadPosts():
        _loadPosts;
      case DeletePost():
        _deletePost;
      case RestorePost():
        _restorePost;
    }
  }

  Future<void> _loadPosts() async {
    List<Post> posts = await _repository.getPosts();
    _state = state.copyWith(
      posts: posts,
    );
    notifyListeners();
  }

  Future<void> _deletePost(Post post) async {
    await _repository.deletetPost(post);
    _recentlyDeletedPost = post;

    await _loadPosts();
  }

  Future<void> _restorePost() async {
    if (_recentlyDeletedPost != null) {
      await _repository.insertPost(_recentlyDeletedPost!);
      _recentlyDeletedPost = null;

      _loadPosts();
    }
  }
}
