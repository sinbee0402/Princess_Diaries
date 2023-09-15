import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/domain/use_case/use_cases.dart';
import 'package:princess_diaries/presentation/main/main_state.dart';
import 'package:princess_diaries/presentation/main/main_ui_event.dart';

@injectable
class MainViewModel with ChangeNotifier {
  final UseCases _useCases;

  DateTime _focusedMonth = DateTime.now();
  DateTime get focusedMonth => _focusedMonth;

  MainState _state = const MainState();
  MainState get state => _state;

  MainViewModel(this._useCases) {
    _loadPosts();
  }

  void changeMonth(DateTime newMonth) {
    _focusedMonth = newMonth;
    notifyListeners(); // 변경 사항을 리스너에 알립니다.
  }

  void onEvent(MainUiEvent event) {
    switch (event) {
      case LoadPosts():
        _loadPosts();
      // case DeletePost():
      //   _deletePost;
    }
  }

  Future<void> _loadPosts() async {
    List<Post> posts = await _useCases.getPosts();
    _state = state.copyWith(
      posts: posts,
    );
    notifyListeners();
  }

  // Future<void> _deletePost(Post post) async {
  //   await useCases.deletePost(post);
  //   await _loadPosts();
  // }
}
