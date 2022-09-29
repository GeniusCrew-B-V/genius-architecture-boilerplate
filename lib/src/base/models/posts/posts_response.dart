import 'package:baseproject/src/base/models/posts/post_model_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'posts_response.g.dart';

@JsonSerializable()
class PostsDetailResponse {
  @JsonKey(name: 'posts')
  List<PostModelResponse> posts;
  int maxElementsNum;

  PostsDetailResponse({required this.posts, required this.maxElementsNum});

  factory PostsDetailResponse.fromJson(Map<String, dynamic> json) => _$PostsDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PostsDetailResponseToJson(this);
}
