import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/domain/use_case/get_posts_use_case.dart';
import 'package:princess_diaries/presentation/main/main_state.dart';
import 'package:princess_diaries/presentation/main/main_ui_event.dart';

@injectable
class MainViewModel with ChangeNotifier {
  final GetPostsUseCase _getPostsUseCase;

  MainState _state = const MainState();
  MainState get state => _state;

  MainViewModel(this._getPostsUseCase) {
    _loadPosts();
  }

  void onEvent(MainUiEvent event) {
    switch (event) {
      case LoadEmojis():
        _loadPosts();
      // case DeletePost():
      //   _deletePost;
    }
  }

  Future<void> _loadPosts() async {
    List<Post> posts = await _getPostsUseCase.call();
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
