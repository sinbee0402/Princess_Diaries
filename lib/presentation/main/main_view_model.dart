import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/domain/use_case/use_cases.dart';
import 'package:princess_diaries/presentation/main/main_state.dart';
import 'package:princess_diaries/presentation/main/main_ui_event.dart';

@injectable
class MainViewModel with ChangeNotifier {
  final UseCases useCases;

  MainState _state = const MainState();
  MainState get state => _state;

  MainViewModel(this.useCases);

  void onEvent(MainUiEvent event) {
    switch (event) {
      case LoadPosts():
        _loadPosts;
      case SavePost(:final id, :final title, :final content):
        _savePost;
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

  Future<void> _savePost(int? id, String title, String content) async {
    if (id == null) {
      await useCases.addPost(
        Post(
            id: id,
            emoji:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Noto_Emoji_KitKat_263a.svg/220px-Noto_Emoji_KitKat_263a.svg.png',
            date: DateTime.now(),
            title: title,
            content: content),
      );
    } else {
      await useCases.updatePost(
        Post(
          emoji:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Noto_Emoji_KitKat_263a.svg/220px-Noto_Emoji_KitKat_263a.svg.png',
          date: DateTime.now(),
          title: title,
          content: content,
        ),
      );
    }
  }

  Future<void> _deletePost(Post post) async {
    await useCases.deletePost(post);
    await _loadPosts();
  }
}
