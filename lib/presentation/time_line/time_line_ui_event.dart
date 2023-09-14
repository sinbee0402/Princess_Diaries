import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:princess_diaries/domain/model/post.dart';

part 'time_line_ui_event.freezed.dart';

@freezed
sealed class TimeLineUiEvent<T> with _$TimeLineUiEvent<T> {
  const factory TimeLineUiEvent.loadPosts(int yM) = LoadPosts;
  const factory TimeLineUiEvent.deletePost(Post post) = DeletePost;
  const factory TimeLineUiEvent.restorePost(Post post) = RestorePost;
}
