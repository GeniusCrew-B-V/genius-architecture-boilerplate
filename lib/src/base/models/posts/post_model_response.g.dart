// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModelResponse _$PostModelResponseFromJson(Map<String, dynamic> json) =>
    PostModelResponse(
      title: json['title'] as String,
      creatorId: json['creatorId'] as String,
      creatorImage: json['creatorImage'] as String,
      caption: json['caption'] as String,
      image: json['image'] as String,
      postDate: json['postDate'] as String,
      postId: json['id'] as String,
      creatorName: json['creatorName'] as String,
    );

Map<String, dynamic> _$PostModelResponseToJson(PostModelResponse instance) =>
    <String, dynamic>{
      'image': instance.image,
      'postDate': instance.postDate,
      'creatorId': instance.creatorId,
      'title': instance.title,
      'creatorName': instance.creatorName,
      'creatorImage': instance.creatorImage,
      'caption': instance.caption,
      'id': instance.postId,
    };
