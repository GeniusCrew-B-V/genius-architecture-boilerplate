import 'package:json_annotation/json_annotation.dart';

part 'notification_preference_response_model.g.dart';

@JsonSerializable()
class NotificationPreferenceResponseModel {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'isAnActiveNotification')
  final bool isAnActiveNotification;

  NotificationPreferenceResponseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isAnActiveNotification,
  });

  factory NotificationPreferenceResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$NotificationPreferenceResponseModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$NotificationPreferenceResponseModelToJson(this);
}
