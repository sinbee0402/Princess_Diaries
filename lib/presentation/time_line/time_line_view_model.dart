import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/domain/use_case/use_cases.dart';
import 'package:princess_diaries/presentation/time_line/time_line_state.dart';
import 'package:princess_diaries/presentation/time_line/time_line_ui_event.dart';

@injectable
class TimeLineViewModel with ChangeNotifier {
  final UseCases useCases;

  TimeLineState _state = const TimeLineState();
  TimeLineState get state => _state;

  Post? _recentlyDeletedPost;

  TimeLineViewModel(this.useCases) {
    _loadPosts;
  }

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
    List<Post> posts = await useCases.getPosts();
    _state = state.copyWith(
      posts: posts,
    );
    notifyListeners();
  }

  Future<void> _deletePost(Post post) async {
    await useCases.deletePost(post);
    _recentlyDeletedPost = post;

    await _loadPosts();
  }

  Future<void> _restorePost() async {
    if (_recentlyDeletedPost != null) {
      await useCases.addPost(_recentlyDeletedPost!);
      _recentlyDeletedPost = null;

      _loadPosts();
    }
  }
}
