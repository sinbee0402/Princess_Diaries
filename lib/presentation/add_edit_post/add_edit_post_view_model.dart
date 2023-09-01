import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/domain/repository/post_repository.dart';
import 'package:princess_diaries/presentation/add_edit_post/add_edit_post_event.dart';

@injectable
class AddEditPostViewModel with ChangeNotifier {
  final PostRepository _repository;

  AddEditPostViewModel(this._repository);

  void onEvent(AddEditPostEvent event) {
    switch (event) {
      //case ChangeBase(:final url):
      case SavePost(:final id, :final emoji, :final content):
        _savePost(id, emoji, content);
    }
  }

  Future<void> _savePost(int? id, String emoji, String content) async {
    if (id == null) {
      await _repository.insertPost(
        Post(
          emoji: emoji,
          date: DateTime.now().millisecondsSinceEpoch,
          content: content,
        ),
      );
    } else {
      await _repository.updatePost(
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
