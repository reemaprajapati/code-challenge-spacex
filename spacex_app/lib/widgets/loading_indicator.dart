import 'package:flutter/material.dart';
import 'package:spacex_app/res/colors.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: new AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
      ),
    );
  }
}
