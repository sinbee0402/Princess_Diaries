import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/domain/repository/post_repository.dart';
import 'package:princess_diaries/presentation/add_edit_post/add_edit_post_event.dart';
import 'package:princess_diaries/presentation/add_edit_post/add_edit_post_ui_event.dart';

@injectable
class AddEditPostViewModel with ChangeNotifier {
  final PostRepository _repository;

  final _eventController = StreamController<AddEditPostUiEvent>.broadcast();

  Stream<AddEditPostUiEvent> get eventStream => _eventController.stream;

  AddEditPostViewModel(this._repository);

  void onEvent(AddEditPostEvent event) {
    switch (event) {
      //case ChangeBase(:final url):
      case SavePost(:final post):
        _savePost(post);
    }
  }

  Future<void> _savePost(Post post) async {
    if (post.id == null) {
      await _repository.insertPost(post);
    } else {
      await _repository.updatePost(
        post.copyWith(updateTime: DateTime.now()),
      );
    }

    _eventController.add(const AddEditPostUiEvent.editPost());
  }
}
