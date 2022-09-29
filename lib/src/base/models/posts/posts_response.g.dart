// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsDetailResponse _$PostsDetailResponseFromJson(Map<String, dynamic> json) =>
    PostsDetailResponse(
      posts: (json['posts'] as List<dynamic>)
          .map((e) => PostModelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxElementsNum: json['maxElementsNum'] as int,
    );

Map<String, dynamic> _$PostsDetailResponseToJson(
        PostsDetailResponse instance) =>
    <String, dynamic>{
      'posts': instance.posts,
      'maxElementsNum': instance.maxElementsNum,
    };
