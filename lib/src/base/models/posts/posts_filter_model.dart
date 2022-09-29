import 'package:json_annotation/json_annotation.dart';

part 'posts_filter_model.g.dart';

@JsonSerializable()
class PostsFilterModel {
  int? pageNumber;
  int? totalPerPage;
  //ADD ANY TYPE OF FILTERS

  PostsFilterModel({
    this.pageNumber,
    this.totalPerPage,
  });

  factory PostsFilterModel.fromJson(Map<String, dynamic> json) =>
      _$PostsFilterModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostsFilterModelToJson(this);
}
