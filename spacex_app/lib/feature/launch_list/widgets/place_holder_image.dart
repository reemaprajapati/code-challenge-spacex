import 'package:flutter/material.dart';
import 'package:spacex_app/res/colors.dart';

class PlaceHolderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.colorGrey
      ),
    );
  }
}