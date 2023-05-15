import 'package:car_rental/core/utils/app_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

class ProgressDialogUtils {
  static show() {
    SVProgressHUD.show();
    SVProgressHUD.setBackgroundColor(AppColors.primaryColor.withOpacity(0.5));
    SVProgressHUD.setBackgroundLayerColor(
        AppColors.primaryColor.withOpacity(0.5));
    SVProgressHUD.setBackgroundLayerColor(AppColors.primaryColor);
    // SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark);
  }

  static hide() {
    SVProgressHUD.dismiss();
  }
}
