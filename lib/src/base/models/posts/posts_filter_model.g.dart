// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsFilterModel _$PostsFilterModelFromJson(Map<String, dynamic> json) =>
    PostsFilterModel(
      pageNumber: json['pageNumber'] as int?,
      totalPerPage: json['totalPerPage'] as int?,
    );

Map<String, dynamic> _$PostsFilterModelToJson(PostsFilterModel instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'totalPerPage': instance.totalPerPage,
    };
