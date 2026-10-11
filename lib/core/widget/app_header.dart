import 'package:flutter/material.dart';
import 'package:project_one/core/utils/text_styles.dart';

import '../utils/app_colors.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key, required this.title, required this.height});

  final String title;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.greyColor.withOpacity(.2),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(
              Icons.arrow_back,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width * height,
        ),
        Text(title, style: AppTextStyles.inter500_20),
      ],
    );
  }
}
