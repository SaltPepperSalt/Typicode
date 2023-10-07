// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostForList _$PostForListFromJson(Map<String, dynamic> json) => PostForList(
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$PostForListToJson(PostForList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

PostForDetail _$PostForDetailFromJson(Map<String, dynamic> json) =>
    PostForDetail(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$PostForDetailToJson(PostForDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'body': instance.body,
    };

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      name: json['name'] as String,
      email: json['email'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
