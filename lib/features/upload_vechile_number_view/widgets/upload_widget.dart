import 'package:car_rental/core/utils/app_imports.dart';

class UploadWidget extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  final String? imageName;
  UploadWidget({this.title, this.onTap, this.imageName});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: Get.width,
            height: 59.h,
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.grey,
                ),
                borderRadius: BorderRadius.circular(15.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(children: [
                CustomText(
                  title,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12.r,
                )
              ]),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }
}
