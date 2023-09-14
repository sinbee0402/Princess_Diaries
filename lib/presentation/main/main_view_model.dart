import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/domain/repository/post_repository.dart';
import 'package:princess_diaries/presentation/main/main_state.dart';
import 'package:princess_diaries/presentation/main/main_ui_event.dart';

@injectable
class MainViewModel with ChangeNotifier {
  final PostRepository _repository;

  MainState _state = const MainState();
  MainState get state => _state;

  MainViewModel(this._repository);

  void onEvent(MainUiEvent event) {
    switch (event) {
      case LoadEmojis(:final yM):
        _loadEmojis(yM);
      // case DeletePost():
      //   _deletePost;
    }
  }

  Future<void> _loadEmojis(int yM) async {
    List<Post> posts = await _repository.getPosts(yM);
    _state = state.copyWith(
      posts: posts,
    );
    notifyListeners();

    Map<DateTime, String> events = {};
    posts.forEach((post) {
      final date = DateFormat('yyyy-MM-dd, H:m').parse(post.date);
      final emoji = post.emoji;

      events[date] = emoji;
    });

    _state = state.copyWith(
      events: events,
    );
    notifyListeners();
  }

  // Future<void> _deletePost(Post post) async {
  //   await useCases.deletePost(post);
  //   await _loadPosts();
  // }
}
