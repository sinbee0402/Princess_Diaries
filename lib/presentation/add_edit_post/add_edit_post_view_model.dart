import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/domain/use_case/use_cases.dart';
import 'package:princess_diaries/presentation/add_edit_post/add_edit_post_event.dart';

@injectable
class AddEditPostViewModel with ChangeNotifier {
  final UseCases _useCases;

  AddEditPostViewModel(this._useCases);

  void onEvent(AddEditPostEvent event) {
    switch (event) {
      //case ChangeBase(:final url):

      case SavePost():
        _savePost;
    }
  }

  Future<void> _savePost(int? id, String emoji, String content) async {
    if (id == null) {
      await _useCases.addPost(
        Post(
          emoji: emoji,
          date: DateTime.now().millisecondsSinceEpoch,
          content: content,
        ),
      );
    } else {
      await _useCases.addPost(
        Post(
          id: id,
          emoji: emoji,
          date: DateTime.now().millisecondsSinceEpoch,
          content: content,
        ),
      );
    }
  }
}
