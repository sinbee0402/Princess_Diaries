import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    int? id,
    required String emojiPath,
    //@ColorConverter() required Color? color,
    required String content,
    @DateTimeConverter() required DateTime updateTime,
    @DateTimeConverter() required DateTime postingTime,
  }) = _Post;

  factory Post.fromJson(Map<String, Object?> json) => _$PostFromJson(json);
}

class DateTimeConverter implements JsonConverter<DateTime, int> {
  const DateTimeConverter();

  @override
  DateTime fromJson(int timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp);

  @override
  int toJson(DateTime date) => date.millisecondsSinceEpoch;
}

// class ColorConverter implements JsonConverter<Color, String> {
//   const ColorConverter();
//
//   @override
//   Color fromJson(String colorString) => Color(int.parse(colorString));
//
//   @override
//   String toJson(Color color) => color.value.toString();
// }
