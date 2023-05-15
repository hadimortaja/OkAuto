import 'package:car_rental/core/controllers/upload_ads_controller.dart';
import 'package:car_rental/core/utils/app_imports.dart';

class StepperMotor extends StatelessWidget {
  final int index;

  //todo:two list: icons and text ;
  StepperMotor(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            4,
            (i) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Get.find<UploadAdsController>().setIndexBoatStepper(i);
                      },
                      child: Container(
                        width: 25.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index >= i
                                ? AppColors.black
                                : Colors.transparent,
                            border: Border.all(
                                color: index >= i
                                    ? AppColors.black
                                    : Colors.grey)),
                        child: index > i
                            ? Icon(
                                Icons.check,
                                color: AppColors.whiteColor,
                                size: 15.r,
                              )
                            : Center(
                                child: CustomText(
                                "${i + 1}",
                                fontSize: 12.5.sp,
                                color: index >= i
                                    ? AppColors.whiteColor
                                    : Colors.grey,
                                fontWeight: FontWeight.w400,
                              )),
                      ),
                    ),
                    i != 3
                        ? Container(
                            width: 32.w,
                            height: 1.h,
                            decoration: BoxDecoration(color: AppColors.grey),
                          )
                        : SizedBox()
                  ],
                )),
      ),
    );
  }
}
