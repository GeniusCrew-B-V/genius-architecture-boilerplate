// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_preference_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationPreferenceResponseModel
    _$NotificationPreferenceResponseModelFromJson(Map<String, dynamic> json) =>
        NotificationPreferenceResponseModel(
          id: json['id'] as String,
          title: json['title'] as String,
          description: json['description'] as String,
          isAnActiveNotification: json['isAnActiveNotification'] as bool,
        );

Map<String, dynamic> _$NotificationPreferenceResponseModelToJson(
        NotificationPreferenceResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'isAnActiveNotification': instance.isAnActiveNotification,
    };
