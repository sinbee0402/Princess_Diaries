import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'add_edit_post_event.freezed.dart';

@freezed
sealed class AddEditPostEvent<T> with _$AddEditPostEvent<T> {
  //const factory AddEditPostEvent.changeBase(String url) = ChangeBase;
  const factory AddEditPostEvent.savePost(
    int? id,
    String title,
    String content,
  ) = SavePost;
}
