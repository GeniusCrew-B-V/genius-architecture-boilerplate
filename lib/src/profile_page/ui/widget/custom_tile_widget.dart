import 'package:baseproject/resources/res.dart';
import 'package:flutter/material.dart';

class CustomTileWidget extends StatelessWidget {
  final Function onPressed;
  final String text;

  const CustomTileWidget({Key? key, required this.onPressed, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Theme.of(context).primaryColor), borderRadius: BorderRadius.all(Radius.circular(10))),
      child: InkWell(
        onTap: null,
        child: ListTile(
          iconColor: Theme.of(context).primaryColor,
          title: Text(
            text,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold, color: AppColors.white),
          ),
          onTap: () => onPressed(),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
