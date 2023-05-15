import 'package:car_rental/core/controllers/auth_controller.dart';
import 'package:car_rental/core/controllers/upload_ads_controller.dart';
import 'package:car_rental/core/utils/app_imports.dart';
import 'package:car_rental/core/utils/helper.dart';
import 'package:car_rental/features/upload_ads_customer_view/presentation/widgets/choose_ads_type_widget.dart';
import 'package:car_rental/features/upload_boat_view/presentation/views/upload_boat_view.dart';
import 'package:car_rental/features/upload_car_view/presentation/views/upload_car_view.dart';
import 'package:car_rental/features/upload_caravan_view/presentation/views/upload_caravan_view.dart';
import 'package:car_rental/features/upload_mobile_number_customer_view/presentation/views/upload_mobile_number_customer_view.dart';
import 'package:car_rental/features/upload_motor_view/presentation/views/upload_motor_view.dart';
import 'package:car_rental/features/upload_truck_view/presentation/views/upload_truck_view.dart';
import 'package:car_rental/features/upload_vechile_number_view/presentation/views/upload_vechile_number_customer_view.dart';
import 'package:car_rental/features/upload_vehicle_number_customer_view/presentation/views/upload_vehicle_number_customer_view.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UploadAdsCustomerView extends StatelessWidget {
  List<String> images = [
    "car_show",
    "truck",
    "Icon awesome-car-alt",
    "Icon awesome-car-alt",
    "1icons8-sail-boat-301",
    "1icons8-dirt-bike-80",
    "1icons8-caravan-60",
    "rent"
  ];

  List<String> des = [
    "You will be able to see all ads but you\nwill be restricted when adding some ads"
        .tr,
    "You will be able to see all ads and you will be\nable to add ads in all sections"
        .tr,
    "You will be able to see all ads but you\nwill be restricted when adding some ads"
        .tr,
    "You will be able to see all ads but you\nwill be restricted when adding some ads"
        .tr,
    "You will be able to see all ads but you\nwill be restricted when adding some ads"
        .tr,
    "You will be able to see all ads but you\nwill be restricted when adding some ads"
        .tr,
    "You will be able to see all ads but you\nwill be restricted when adding some ads"
        .tr,
  ];
  // List<String> titles = ["Cars", "Trucks", "Mobile Numbers", "Vehicle Numbers"];
  AuthController authController = Get.find();
  UploadAdsController uploadAdsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 60.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        Obx(() {
          return uploadAdsController.getCategoriesData.value.code == null
              ? Helper.loading()
              : uploadAdsController.getCategoriesData.value.data!.length == 0
                  ? Column(
                      children: [
                        SizedBox(
                          height: 12.h,
                        ),
                        CustomText(
                          "There is No Categories",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    )
                  : Expanded(
                      child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(children: [
                        Column(
                          children: [
                            CustomText(
                              "Upload Your Ad",
                              fontSize: 22.sp,
                              fontFamily: "tajawalb",
                            ),
                            SizedBox(
                              height: 18.h,
                            ),
                            CustomText(
                              "Choose the category you want to place\nyour ad in",
                              fontSize: 15.sp,
                              color: AppColors.borderColor,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 17.h,
                            ),
                            SizedBox(
                              width: Get.width,
                              child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: uploadAdsController
                                      .getCategoriesData.value.data!.length,
                                  shrinkWrap: true,
                                  primary: false,
                                  itemBuilder: (context, index) {
                                    return ChooseAdsTypeWidget(
                                      onTap: () {
                                        uploadAdsController
                                                .getCategorySelect.value =
                                            uploadAdsController
                                                .getCategoriesData
                                                .value
                                                .data![index];
                                        print(uploadAdsController
                                            .getCategorySelect.value.name);
                                        print(uploadAdsController
                                            .getCategorySelect.value.id);
                                        if (index == 0) {
                                          Get.find<UploadAdsController>()
                                              .setIndexStepper(0);
                                          Get.to(() => UploadCarView());
                                        } else if (index == 2) {
                                          uploadAdsController
                                              .setIndexVehicleNumberStepper(0);
                                          Get.to(() =>
                                              UploadVehicleNumberCustomerView());
                                        } else if (index == 3) {
                                          Get.find<UploadAdsController>()
                                              .setIndexStepper(0);
                                          Get.to(() => UploadCarView(
                                                isClassic: true,
                                              ));
                                        } else if (index == 1) {
                                          authController.cleanFilter();
                                          Get.find<UploadAdsController>()
                                              .setIndexStepper(0);
                                          Get.to(() => UploadTruckView());
                                        } else if (index == 4) {
                                          authController.cleanFilter();
                                          Get.find<UploadAdsController>()
                                              .setIndexBoatStepper(0);
                                          Get.to(() => UploadBoatView());
                                        } else if (index == 5) {
                                          authController.cleanFilter();
                                          Get.find<UploadAdsController>()
                                              .setIndexMotorStepper(0);
                                          Get.to(() => UploadMotorView());
                                        } else if (index == 6) {
                                          authController.cleanFilter();
                                          Get.find<UploadAdsController>()
                                              .setIndexCaravanStepper(0);
                                          Get.to(() => UploadCaravanView());
                                        }
                                      },
                                      imageName: images[index],
                                      title: uploadAdsController
                                          .getCategoriesData
                                          .value
                                          .data![index]
                                          .name!
                                          .tr,
                                      desc: des[index],
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: 17.h,
                            ),
                          ],
                        )
                      ]),
                    ));
        })
      ]),
    );
  }
}
