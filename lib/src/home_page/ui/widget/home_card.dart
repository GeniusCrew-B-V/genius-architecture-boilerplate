import 'package:baseproject/src/home_page/domain/home_card_model.dart';
import 'package:flutter/material.dart';

import '../../../../resources/res.dart';

class HomeCard extends StatelessWidget {
  final HomeCardModel model;

  const HomeCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Sizes.paddingS, left: Sizes.padding, right: Sizes.padding),
      padding: EdgeInsets.all(Sizes.padding),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(Sizes.borderRadiusS)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            child: Text(
              model.userInitials,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            width: Sizes.padding,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black),
              ),
              Text(
                model.description,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
              )
            ],
          ))
        ],
      ),
    );
  }
}
