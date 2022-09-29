import 'package:json_annotation/json_annotation.dart';

part 'post_model_response.g.dart';

@JsonSerializable()
class PostModelResponse {
  String image;
  String postDate;
  String creatorId;
  String title;
  String creatorName;
  String creatorImage;
  String caption;
  @JsonKey(name: 'id')
  String postId;

  PostModelResponse({
    required this.title,
    required this.creatorId,
    required this.creatorImage,
    required this.caption,
    required this.image,
    required this.postDate,
    required this.postId,
    required this.creatorName,
  });

  factory PostModelResponse.fromJson(Map<String, dynamic> json) => _$PostModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelResponseToJson(this);
}
