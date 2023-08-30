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

  Future<void> _savePost(int? id, String emoji, String content) async {
    if (id == null) {
      await repository.insertPost(
        Post(
          id: id,
          emoji: emoji,
          date: DateTime.now(),
          content: content,
        ),
      );
    } else {
      await repository.updatePost(
        Post(
          emoji: emoji,
          date: DateTime.now(),
          content: content,
        ),
      );
    }
  }
}
