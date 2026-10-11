import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../utils/app_colors.dart';

 class ConfigLoading {
  void showLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 1500)
      ..maskType = EasyLoadingMaskType.custom
      ..indicatorType = EasyLoadingIndicatorType.chasingDots
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 15.0
      ..progressColor = Colors.red
      ..indicatorColor = AppColors.primaryColor
      ..backgroundColor = Colors.grey.withOpacity(.3)
      ..textColor = Colors.grey
      ..maskColor = Colors.transparent
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}
