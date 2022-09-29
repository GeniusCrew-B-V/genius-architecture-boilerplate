import 'package:baseproject/resources/res.dart';
import 'package:baseproject/src/base/models/posts/post_model_response.dart';
import 'package:baseproject/src/base/widget/ui/custom_circular_progress_indicator.dart';
import 'package:baseproject/src/post_detail/ui/viewmodel/post_detail_view_model_main.dart';
import 'package:flutter/material.dart';

import '../../../../i18n/translations.dart';
import '../../../base/widget/ui/square_avatar.dart';

class PostDetailCard extends StatefulWidget {
  final PostDetailViewModelMain? viewModel;

  const PostDetailCard({Key? key, @required this.viewModel}) : super(key: key);

  @override
  State<PostDetailCard> createState() => _PostDetailCardState();
}

class _PostDetailCardState extends State<PostDetailCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.viewModel!.post,
        builder: (context, AsyncSnapshot<PostModelResponse> snap) {
          if (snap.hasData) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(child: CustomCircularProgressIndicator());
            }
            if (snap.connectionState == ConnectionState.done)
              return Builder(
                builder: (context) {
                  PostModelResponse postModel = snap.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: Sizes.postHeight,
                        width: double.infinity,
                        child: Image.network(
                          postModel.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: 5,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Theme.of(context).colorScheme.secondary,
                            Theme.of(context).colorScheme.primary,
                          ],
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(Sizes.padding),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SquareAvatar(image: postModel.image),
                            const SizedBox(
                              width: Sizes.padding,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    postModel.creatorName,
                                    overflow: TextOverflow.clip,
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                    "${translation.postCard.postedOn + " " + postModel.postDate}",
                                    overflow: TextOverflow.clip,
                                    style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white.withOpacity(0.7)),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.more_vert_rounded,
                              color: AppColors.gray,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.padding,
                        ),
                        child: Text(
                          postModel.title,
                          style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Sizes.padding, vertical: Sizes.paddingS),
                        child: Text(
                          postModel.caption,
                          style: Theme.of(context).textTheme.bodyText2?.copyWith(color: AppColors.postCardDescriptionTextColor, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  );
                },
                // ),
              );
          }
          if (snap.hasError)
            return Center(
              child: Text('Error'),
            );
          if (snap.connectionState == ConnectionState.waiting)
            return Center(child: CustomCircularProgressIndicator());
          else
            return Center(
              child: Text('No data'),
            );
        });
  }
}
