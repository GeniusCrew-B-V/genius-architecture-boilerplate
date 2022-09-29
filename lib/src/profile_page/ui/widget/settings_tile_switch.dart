import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../resources/res.dart';
import '../../../base/widget/ui/icon_container.dart';

class SettingsTileSwitch extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool switchValue;
  final Function(bool) onSwitchValueChange;
  final IconData icon;

  const SettingsTileSwitch({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.switchValue,
    required this.onSwitchValueChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: IconContainer(
        icon: icon,
      ),
      title: Padding(
        padding: const EdgeInsets.only(
          bottom: Sizes.paddingS,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: Sizes.fontSizeS,
              ),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.caption!.copyWith(
              color: AppColors.shuttleGrey,
            ),
      ),
      trailing: Transform.scale(
        scale: Sizes.listTileSwitchScale,
        child: CupertinoSwitch(
          value: switchValue,
          activeColor: Theme.of(context).primaryColor,
          onChanged: onSwitchValueChange,
        ),
      ),
    );
  }
}
