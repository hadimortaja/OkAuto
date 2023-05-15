import 'package:bot_toast/bot_toast.dart';
import 'package:car_rental/core/controllers/auth_controller.dart';
import 'package:car_rental/core/controllers/upload_ads_controller.dart';
import 'package:car_rental/core/utils/app_imports.dart';
import 'package:car_rental/core/utils/helper.dart';
import 'package:car_rental/features/my_ads_view/data/data_sources/my_ads_data_source.dart';
import 'package:car_rental/features/upload_ads_customer_view/data/data_sources/upload_ads_data_source.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChoosePlanView extends StatelessWidget {
  String? categoryId;
  ChoosePlanView({this.categoryId});
  UploadAdsController uploadAdsController = Get.find();
  AuthController authController = Get.find();
  // List<Color> colors = [
  //   Color(0xff929DC2),
  //   Color(0xff20BB03),
  //   Color(0xffFBD230),
  //   Color(0xff929DC2),
  //   Color(0xff20BB03),
  //   Color(0xffFBD230)
  // ];
  List<String> desc = [
    "With this plan, you will be able to display your ad for free and republish it only once"
        .tr,
    "With this plan, you will be able to display your ad, appear at the top, and repost twice"
        .tr,
    "With this plan, you will be able to display your ad and appear in all pages and repost four times"
        .tr
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              Column(
                children: [
                  CustomText(
                    "Choose Your Plan",
                    fontSize: 24.sp,
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.transparent,
                  )),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Obx(() {
            return uploadAdsController.getPlansData.value.code == null
                ? Helper.loading()
                : uploadAdsController.getPlansData.value.data!.length == 0
                    ? CustomText(
                        "There is No Plans",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      )
                    : Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: uploadAdsController
                                .getPlansData.value.data!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  uploadAdsController.getPlansDataSelect.value =
                                      uploadAdsController
                                          .getPlansData.value.data![index];
                                  if (uploadAdsController
                                          .getPlansDataSelect.value.status ==
                                      0) {
                                    BotToast.showText(
                                        text: "Please Select Other Plan");
                                  } else {
                                    if (categoryId == "1") {
                                      uploadAdsDataSource(
                                          category_id: "1",
                                          city_id: authController
                                              .getCitiesSelect.value.id
                                              .toString(),
                                          address: uploadAdsController.address,
                                          brand_id: authController
                                              .getBrabdSelect.value.id
                                              .toString(),
                                          color_id: authController
                                              .getColorsSelect.value.id
                                              .toString(),
                                          condition: uploadAdsController
                                              .condition.value,
                                          content: uploadAdsController.desc,
                                          description: uploadAdsController.desc,
                                          kilometer:
                                              uploadAdsController.Killometers,
                                          name: uploadAdsController.name,
                                          phone: uploadAdsController.mobile
                                              .toString(),
                                          price: uploadAdsController.price
                                              .toString(),
                                          production_year: uploadAdsController
                                              .getProductionYearSelect
                                              .value
                                              .name
                                              .toString(),
                                          service_id: "1",
                                          status: "1",
                                          style_id: authController
                                              .getCarModelSelect.value.id
                                              .toString(),
                                          type_product: "for_sale",
                                          whatsapp:
                                              uploadAdsController.whatsapp,
                                          planId: uploadAdsController
                                              .getPlansDataSelect.value.id
                                              .toString());
                                    } else if (categoryId == "2") {
                                      uploadAdsDataSource(
                                        category_id: "2",
                                        city_id: authController
                                            .getCitiesSelect.value.id
                                            .toString(),
                                        address: uploadAdsController.address,
                                        brand_id: authController
                                            .getTruckBrandsSelect.value.id
                                            .toString(),
                                        color_id: authController
                                            .getColorsSelect.value.id
                                            .toString(),
                                        condition:
                                            uploadAdsController.condition.value,
                                        content: uploadAdsController.desc,
                                        description: uploadAdsController.desc,
                                        kilometer:
                                            uploadAdsController.Killometers,
                                        name: uploadAdsController.name,
                                        phone: uploadAdsController.mobile
                                            .toString(),
                                        price: uploadAdsController.price
                                            .toString(),
                                        production_year: uploadAdsController
                                            .getProductionYearSelect.value.name
                                            .toString(),
                                        status: "1",
                                        style_id: authController
                                            .getTruckModelSelect.value.id
                                            .toString(),
                                        type_product: "for_sale",
                                        whatsapp: uploadAdsController.whatsapp,
                                        planId: uploadAdsController
                                            .getPlansDataSelect.value.id
                                            .toString(),
                                      );
                                    } else if (categoryId == "4") {
                                      uploadAdsDataSource(
                                          category_id: "4",
                                          address: authController
                                              .getCitiesSelect.value.name,
                                          // condition: uploadAdsController.condition.value,
                                          content: uploadAdsController.descV,
                                          description:
                                              uploadAdsController.descV,
                                          phone: uploadAdsController.mobileV,
                                          price: uploadAdsController.priceV
                                              .toString(),
                                          vehicle_type: uploadAdsController
                                              .vehicleType.value,
                                          city_id: authController
                                              .getCitiesSelect.value.id
                                              .toString(),
                                          code: uploadAdsController.codeV,
                                          vehicle_number: uploadAdsController
                                              .vNumber
                                              .toString(),
                                          number_type: uploadAdsController
                                              .numberType.value,
                                          planId: uploadAdsController
                                              .getPlansDataSelect.value.id
                                              .toString(),
                                          // service_id: "1",

                                          whatsapp: uploadAdsController.whatsV
                                              .toString());
                                    } else if (categoryId == "3") {
                                      uploadAdsDataSource(
                                          category_id: "3",
                                          condition: uploadAdsController
                                              .condition.value,
                                          content: uploadAdsController.descM,
                                          description:
                                              uploadAdsController.descM,
                                          phone: uploadAdsController.phoneM,
                                          price: uploadAdsController.priceM,
                                          sim_type: uploadAdsController
                                                      .indexSimType ==
                                                  0
                                              ? "1"
                                              : "2",
                                          planId: uploadAdsController
                                              .getPlansDataSelect.value.id
                                              .toString(),
                                          // service_id: "1",

                                          whatsapp:
                                              uploadAdsController.whatsappM);
                                    } else if (categoryId == "9") {
                                      uploadAdsDataSource(
                                        category_id: "9",
                                        city_id: authController
                                            .getCitiesSelect.value.id
                                            .toString(),
                                        address: uploadAdsController.address,
                                        brand_id: authController
                                            .getBrabdSelect.value.id
                                            .toString(),
                                        color_id: authController
                                            .getColorsSelect.value.id
                                            .toString(),
                                        condition:
                                            uploadAdsController.condition.value,
                                        content: uploadAdsController.desc,
                                        description: uploadAdsController.desc,
                                        kilometer:
                                            uploadAdsController.Killometers,
                                        name: uploadAdsController.name,
                                        phone: uploadAdsController.mobile
                                            .toString(),
                                        // price: DailyPrice,
                                        production_year: uploadAdsController
                                            .getProductionYearSelect.value.name
                                            .toString(),
                                        status: "1",
                                        style_id: authController
                                            .getCarModelSelect.value.id
                                            .toString(),
                                        type_product: "for_rent",
                                        whatsapp: uploadAdsController.whatsapp,
                                        price_daily:
                                            uploadAdsController.DailyPrice,
                                        price_monthly:
                                            uploadAdsController.Monthlyprice,
                                        price_yearly:
                                            uploadAdsController.Yearlyprice,
                                        planId: uploadAdsController
                                            .getPlansDataSelect.value.id
                                            .toString(),
                                      );
                                    } else if (categoryId == "5") {
                                      uploadAdsDataSource(
                                          category_id: "5",
                                          city_id: authController
                                              .getCitiesSelect.value.id
                                              .toString(),
                                          address: uploadAdsController.address,
                                          brand_id: authController
                                              .getBrabdSelect.value.id
                                              .toString(),
                                          color_id: authController
                                              .getColorsSelect.value.id
                                              .toString(),
                                          condition: uploadAdsController
                                              .condition.value,
                                          content: uploadAdsController.desc,
                                          description: uploadAdsController.desc,
                                          kilometer:
                                              uploadAdsController.Killometers,
                                          name: uploadAdsController.name,
                                          phone: uploadAdsController.mobile
                                              .toString(),
                                          price: uploadAdsController.price
                                              .toString(),
                                          production_year: uploadAdsController
                                              .getProductionYearSelect
                                              .value
                                              .name
                                              .toString(),
                                          service_id: "1",
                                          status: "1",
                                          style_id: authController
                                              .getCarModelSelect.value.id
                                              .toString(),
                                          type_product: "for_sale",
                                          whatsapp:
                                              uploadAdsController.whatsapp,
                                          planId: uploadAdsController
                                              .getPlansDataSelect.value.id
                                              .toString());
                                    } else if (categoryId == "11") {
                                      uploadAdsDataSource(
                                          category_id: "11",
                                          city_id: authController
                                              .getCitiesSelect.value.id
                                              .toString(),
                                          address: uploadAdsController.address,
                                          condition: uploadAdsController
                                              .condition.value,
                                          content: uploadAdsController.desc,
                                          description: uploadAdsController.desc,
                                          name: uploadAdsController.name,
                                          phone: uploadAdsController.mobile
                                              .toString(),
                                          production_year: uploadAdsController
                                              .getProductionYearSelect
                                              .value
                                              .name
                                              .toString(),
                                          status: "1",
                                          price: uploadAdsController.price,
                                          whatsapp:
                                              uploadAdsController.whatsapp,
                                          planId: uploadAdsController
                                              .getPlansDataSelect.value.id
                                              .toString());
                                    } else if (categoryId == "12") {
                                      uploadAdsDataSource(
                                          category_id: "12",
                                          city_id: authController
                                              .getCitiesSelect.value.id
                                              .toString(),
                                          address: uploadAdsController.address,
                                          condition: uploadAdsController
                                              .condition.value,
                                          content: uploadAdsController.desc,
                                          description: uploadAdsController.desc,
                                          name: uploadAdsController.name,
                                          phone: uploadAdsController.mobile
                                              .toString(),
                                          production_year: uploadAdsController
                                              .getProductionYearSelect
                                              .value
                                              .name
                                              .toString(),
                                          status: "1",
                                          price: uploadAdsController.price,
                                          whatsapp:
                                              uploadAdsController.whatsapp,
                                          planId: uploadAdsController
                                              .getPlansDataSelect.value.id
                                              .toString());
                                    } else if (categoryId == "13") {
                                      uploadAdsDataSource(
                                          category_id: "13",
                                          city_id: authController
                                              .getCitiesSelect.value.id
                                              .toString(),
                                          address: uploadAdsController.address,
                                          condition: uploadAdsController
                                              .condition.value,
                                          content: uploadAdsController.desc,
                                          description: uploadAdsController.desc,
                                          name: uploadAdsController.name,
                                          phone: uploadAdsController.mobile
                                              .toString(),
                                          status: "1",
                                          price: uploadAdsController.price,
                                          whatsapp:
                                              uploadAdsController.whatsapp,
                                          planId: uploadAdsController
                                              .getPlansDataSelect.value.id
                                              .toString());
                                    }
                                  }
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w),
                                      child: Container(
                                        height: 120.h,
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                            color: uploadAdsController
                                                        .getPlansData
                                                        .value
                                                        .data![index]
                                                        .status ==
                                                    0
                                                ? Colors.grey.withOpacity(0.23)
                                                : Color(int.parse("0xff" +
                                                        uploadAdsController
                                                            .getPlansData
                                                            .value
                                                            .data![index]
                                                            .color
                                                            .toString()
                                                            .substring(1, 7)))
                                                    .withOpacity(0.50),
                                            borderRadius:
                                                BorderRadius.circular(15.r)),
                                        child: Padding(
                                          padding: EdgeInsets.all(12.r),
                                          child: Row(
                                            children: [
                                              CustomSvgImage(
                                                imageName: "taj",
                                                color: AppColors.primaryColor,
                                              ),
                                              SizedBox(
                                                width: 20.w,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 260.w,
                                                    child: Row(
                                                      children: [
                                                        CustomText(
                                                          uploadAdsController
                                                              .getPlansData
                                                              .value
                                                              .data![index]
                                                              .title,
                                                          fontSize: 16.sp,
                                                        ),
                                                        Spacer(),
                                                        CustomText(
                                                          uploadAdsController
                                                              .getPlansData
                                                              .value
                                                              .data![index]
                                                              .price,
                                                          fontSize: 16.sp,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 14.h,
                                                  ),
                                                  Container(
                                                    constraints: BoxConstraints(
                                                        maxWidth: 254.w),
                                                    child: CustomText(
                                                      uploadAdsController
                                                          .getPlansData
                                                          .value
                                                          .data![index]
                                                          .description,
                                                      fontSize: 13.sp,
                                                      color: AppColors.grey,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40.h,
                                    )
                                  ],
                                ),
                              );
                            }));
          })
        ],
      ),
    );
  }
}
