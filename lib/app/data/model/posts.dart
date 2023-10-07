import 'package:json_annotation/json_annotation.dart';

part 'posts.g.dart';

@JsonSerializable()
class PostForList {
  @JsonKey(name: 'title')
  String title;
  @JsonKey(includeFromJson: false)
  int commentCount;

  PostForList({
    required this.title,
    this.commentCount = 0,
  });

  factory PostForList.fromJson(Map<String, dynamic> json) =>
      _$PostForListFromJson(json);
  Map<String, dynamic> toJson() => _$PostForListToJson(this);
}

@JsonSerializable()
class PostForDetail {
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'body')
  String body;
  @JsonKey(includeFromJson: false, defaultValue: [])
  List<Comment>? commets;
  @JsonKey(includeFromJson: false, defaultValue: '')
  String userNmae;

  PostForDetail({
    required this.title,
    required this.body,
    this.userNmae = '',
    this.commets,
  });

  factory PostForDetail.fromJson(Map<String, dynamic> json) =>
      _$PostForDetailFromJson(json);
  Map<String, dynamic> toJson() => _$PostForDetailToJson(this);
}

@JsonSerializable()
class Comment {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'body')
  String body;

  Comment({
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
