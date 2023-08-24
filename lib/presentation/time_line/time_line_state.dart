import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:princess_diaries/domain/model/post.dart';

part 'time_line_state.freezed.dart';

part 'time_line_state.g.dart';

@freezed
class TimeLineState with _$TimeLineState {
  const factory TimeLineState({
    @Default([]) List<Post> posts,
  }) = _TimeLineState;

  factory TimeLineState.fromJson(Map<String, Object?> json) =>
      _$TimeLineStateFromJson(json);
}
