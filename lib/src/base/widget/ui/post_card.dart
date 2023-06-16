import 'package:baseproject/i18n/translations.dart';
import 'package:baseproject/resources/res.dart';
import 'package:baseproject/src/base/models/posts/post_model_response.dart';
import 'package:baseproject/src/base/widget/ui/square_avatar.dart';
import 'package:flutter/material.dart';

// The Card used in the Posts page
class PostCard extends StatelessWidget {
  final PostModelResponse postModel;

  const PostCard({
    Key? key,
    required this.postModel,
  }) : super(key: key);

  _buildUserSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.paddingS),
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
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "${translation.postCard.postedOn + " " + postModel.postDate}",
                  overflow: TextOverflow.clip,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white.withOpacity(0.7)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(color: AppColors.postCardColor),
        padding: const EdgeInsets.all(Sizes.paddingXS),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FadeInImage.assetNetwork(placeholder: ImageSrc.logo, image: postModel.image, width: MediaQuery.of(context).size.width, height: 200, fit: BoxFit.fitWidth),
            ),
            _buildUserSection(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.paddingS),
              child: Text(postModel.title, maxLines: 1, overflow: TextOverflow.fade, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
            ),
            const SizedBox(
              height: Sizes.paddingXS,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.paddingS),
              child: Text(postModel.caption, maxLines: 3, overflow: TextOverflow.fade, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white.withOpacity(0.7))),
            ),
            // _buildBottomSection(context),
            // SizedBox(height: Dimension.padding),
          ],
        ),
      ),
    );
  }
}
