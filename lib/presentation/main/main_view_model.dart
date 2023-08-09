import 'package:flutter/material.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/domain/use_case/use_cases.dart';
import 'package:princess_diaries/presentation/main/main_state.dart';
import 'package:princess_diaries/presentation/main/main_ui_event.dart';

class MainViewModel with ChangeNotifier {
  final UseCases useCases;

  MainState _state = const MainState();
  MainState get state => _state;

  MainViewModel(this.useCases);

  void onEvent(MainUiEvent event) {
    switch (event) {
      case LoadPosts():
        _loadPosts;

      case DeletePost():
        _deletePost;
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
    await _loadPosts();
  }
}
