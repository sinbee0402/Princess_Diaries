import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:princess_diaries/domain/model/post.dart';

part 'main_ui_event.freezed.dart';

@freezed
sealed class MainUiEvent<T> with _$MainUiEvent<T> {
  const factory MainUiEvent.loadPosts() = LoadPosts;
  const factory MainUiEvent.deletePost(Post post) = DeletePost;
}
