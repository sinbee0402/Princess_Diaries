import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'add_edit_post_ui_event.freezed.dart';

@freezed
sealed class AddEditPostUiEvent<T> with _$AddEditPostUiEvent<T> {
  const factory AddEditPostUiEvent.editPost() = EditPost;
  //const factory AddEditPostUiEvent.showSnackBar(String message) = ShowSnackBar;
}
