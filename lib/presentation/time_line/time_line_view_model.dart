import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/domain/use_case/use_cases.dart';
import 'package:princess_diaries/presentation/time_line/time_line_state.dart';
import 'package:princess_diaries/presentation/time_line/time_line_ui_event.dart';

@injectable
class TimeLineViewModel with ChangeNotifier {
  final UseCases useCases;

  DateTime _focusedMonth = DateTime.now();
  DateTime get focusedMonth => _focusedMonth;

  TimeLineState _state = const TimeLineState();
  TimeLineState get state => _state;

  Post? _recentlyDeletedPost;

  TimeLineViewModel(this.useCases) {
    _loadPosts();
  }

  void changeMonth(DateTime newMonth) {
    _focusedMonth = newMonth;
    _state = state.copyWith(
        filteredPosts: state.posts
            .where((post) =>
                post.postingTime.year == _focusedMonth.year &&
                post.postingTime.month == _focusedMonth.month)
            .toList());
    notifyListeners(); // 변경 사항을 리스너에 알립니다.
  }

  void onEvent(TimeLineUiEvent event) {
    switch (event) {
      case LoadPosts():
        _loadPosts();
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
      filteredPosts: posts,
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

      await _loadPosts();

      _recentlyDeletedPost = null;
    }
  }
}
