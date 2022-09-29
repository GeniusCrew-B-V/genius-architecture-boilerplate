import 'package:flutter/material.dart';

import '../../../../resources/res.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  final double size;
  final bool showShadow;

  const IconContainer({
    Key? key,
    required this.icon,
    this.size = 35,
    this.showShadow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Sizes.paddingS),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(
          Sizes.borderRadiusS,
        ),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: Sizes.containerShadowBlurRadius,
                  offset: Offset(
                    Sizes.containerShadowOffsetX,
                    Sizes.containerShadowOffsetY,
                  ),
                ),
              ]
            : [],
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: size,
      ),
    );
  }
}
