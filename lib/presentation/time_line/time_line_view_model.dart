import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
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
    _loadPosts(
      int.parse(
        DateFormat('yyyyMM').format(DateTime.now()),
      ),
    );
  }

  void changeMonth(DateTime newMonth) {
    _focusedMonth = newMonth;
    notifyListeners(); // 변경 사항을 리스너에 알립니다.
  }

  void onEvent(TimeLineUiEvent event) {
    switch (event) {
      case LoadPosts(:final yM):
        _loadPosts(yM);
      case DeletePost():
        _deletePost;
      case RestorePost():
        _restorePost;
    }
  }

  Future<void> _loadPosts(int yM) async {
    List<Post> posts = await useCases.getPosts(yM);
    _state = state.copyWith(
      posts: posts,
    );
    notifyListeners();
  }

  Future<void> _deletePost(Post post) async {
    await useCases.deletePost(post);
    _recentlyDeletedPost = post;

    await _loadPosts(post.yearMonth);
  }

  Future<void> _restorePost() async {
    if (_recentlyDeletedPost != null) {
      await useCases.addPost(_recentlyDeletedPost!);

      _loadPosts(_recentlyDeletedPost!.yearMonth);

      _recentlyDeletedPost = null;
    }
  }
}
