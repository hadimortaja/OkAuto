import 'package:car_rental/core/controllers/app_controller.dart';
import 'package:car_rental/core/utils/app_imports.dart';
import 'package:car_rental/core/utils/helper.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyView extends StatelessWidget {
  AppController appController = Get.find();
  WebViewController? _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 62.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              CustomText(
                "Privacy Policy",
                fontSize: 22.sp,
                fontFamily: "tajawalb",
              ),
              Icon(
                Icons.arrow_back_ios,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 29.h,
        ),
        Expanded(
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: 'https://ok.fresh-app.com/policy.html',
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
            },
          ),
        ),
      ]),
    );
  }
}
