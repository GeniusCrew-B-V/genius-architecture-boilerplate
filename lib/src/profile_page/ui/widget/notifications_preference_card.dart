import 'package:baseproject/resources/res.dart';
import 'package:baseproject/src/profile_page/domain/model/notifications_preferences/notification_preference_response_model.dart';
import 'package:baseproject/src/profile_page/ui/viewmodel/profile_page_view_model_main.dart';
import 'package:flutter/material.dart';

class NotificationPreferenceCard extends StatelessWidget {
  final NotificationPreferenceResponseModel notificationPreference;
  final ProfilePageViewModelMain viewModel;

  const NotificationPreferenceCard({Key? key, required this.notificationPreference, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(top: Sizes.paddingS, bottom: Sizes.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: null,
              dense: true,
              visualDensity: VisualDensity(vertical: -3),
              minLeadingWidth: 0,
              title: Padding(
                padding: EdgeInsets.only(left: Sizes.padding),
                child: Text(
                  notificationPreference.title,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontWeight: FontWeight.w600, color: notificationPreference.isAnActiveNotification ? Theme.of(context).primaryColor : AppColors.gray),
                ),
              ),
              contentPadding: EdgeInsets.zero,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: Sizes.paddingS),
                  Checkbox(
                      value: notificationPreference.isAnActiveNotification,
                      onChanged: (newVal) {
                        print(newVal.toString());
                      })
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
              child: Text(notificationPreference.description, style: Theme.of(context).textTheme.bodyText2),
            ),
          ],
        ),
      ),
    );
  }
}
