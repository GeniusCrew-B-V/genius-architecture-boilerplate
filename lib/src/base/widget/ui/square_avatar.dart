import 'package:baseproject/resources/res.dart';
import 'package:flutter/material.dart';

class SquareAvatar extends StatelessWidget {
  final String image;
  const SquareAvatar({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0), //or 15.0
      child: Container(
        height: 45,
        width: 45,
        color: AppColors.gray,
        child: Image.network(image, width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
      ),
    );
  }
}
