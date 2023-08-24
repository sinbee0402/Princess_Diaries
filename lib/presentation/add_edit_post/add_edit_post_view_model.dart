import 'package:flutter/material.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/domain/repository/post_repository.dart';
import 'package:princess_diaries/presentation/add_edit_post/add_edit_post_event.dart';

class AddEditPostViewModel with ChangeNotifier {
  final PostRepository repository;

  AddEditPostViewModel(this.repository);

  void onEvent(AddEditPostEvent event) {
    switch (event) {
      //case ChangeBase(:final url):

      case SavePost():
        _savePost;
    }
  }

  Future<void> _savePost(int? id, String title, String content) async {
    if (id == null) {
      await repository.insertPost(
        Post(
            id: id,
            emoji:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Noto_Emoji_KitKat_263a.svg/220px-Noto_Emoji_KitKat_263a.svg.png',
            date: DateTime.now(),
            title: title,
            content: content),
      );
    } else {
      await repository.updatePost(
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
}
