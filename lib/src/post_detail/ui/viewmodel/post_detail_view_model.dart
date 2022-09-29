part of 'post_detail_view_model_shared.dart';

mixin PostDetailViewModel on PostDetailViewModelShared {
  late String postId;
  late Future<PostModelResponse> post;

  getPostDetail() async {
    post = postDetailRepository.getPostDetail(postId).catchError((e) {
      showSnackBar!(e.toString());
    });
  }
}
