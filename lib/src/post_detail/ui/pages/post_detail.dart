import 'package:baseproject/i18n/translations.dart';
import 'package:baseproject/src/base/models/posts/post_model_response.dart';
import 'package:baseproject/src/base/widget/ui/app_bar_title.dart';
import 'package:baseproject/src/post_detail/ui/viewmodel/post_detail_view_model_main.dart';
import 'package:baseproject/src/post_detail/ui/widget/post_detail_card.dart';
import 'package:flutter/material.dart';

class PostDetail extends StatefulWidget {
  final PostDetailViewModelMain? viewModel;
  final Future<bool> Function()? onPop;
  const PostDetail({
    Key? key,
    @required this.viewModel,
    @required this.onPop,
  }) : super(key: key);

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  PostModelResponse? post;

  void initState() {
    widget.viewModel!.getPostDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: widget.onPop,
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: AppBarTitle(title: translation.postDetailPage.title),
      ),
      body: PostDetailCard(viewModel: widget.viewModel),
    );
  }
}
