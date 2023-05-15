import 'package:car_rental/core/backend/apis.dart';
import 'package:car_rental/core/controllers/auth_controller.dart';
import 'package:car_rental/core/services/sp_helper.dart';
import 'package:car_rental/core/utils/app_imports.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/features/choose_method_view/presentation/views/choose_method_view.dart';
import 'package:car_rental/features/main_view/presentation/main_view.dart';
import 'package:car_rental/features/reset_password_view/presentation/views/reset_password_view.dart';
import 'package:car_rental/features/signin_view/data/data_sources/sign_in_data_source.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart' as Geo;

class SignInView extends StatefulWidget {
  static validationEmail(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return 'This field is required*'.tr;
    }
    if (!GetUtils.isEmail(value)) {
      return 'Incorrect email format'.tr;
    }
  }

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final formKey = GlobalKey<FormState>();

  validation(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return 'This field is required*'.tr;
    }
  }

  String? email, password;

  setEmail(String email) {
    this.email = email;
  }

  setPassword(String password) {
    this.password = password;
  }

  AuthController authController = Get.find();

  late GoogleMapController mapController;

  getCurrentLocation() async {
    try {
      Geo.Geolocator.requestPermission();
      Geo.Position position = await Geo.Geolocator.getCurrentPosition(
        desiredAccuracy: Geo.LocationAccuracy.high,
      );
      LatLng myLocation = LatLng(position.latitude, position.longitude);
      print("aaaaaaa" +
          position.latitude.toString() +
          position.longitude.toString());
      print(authController.lat);
      authController.lat = position.latitude.toString();
      authController.long = position.longitude.toString();
      if (mapController != null) {
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: myLocation, zoom: 15),
          ),
        );
      } else {}

      // markers.add(Marker(
      //   markerId: MarkerId('My location'),
      //   position: LatLng(myLocation.latitude, myLocation.longitude),
      //   icon: BitmapDescriptor.defaultMarker,
      // ));

      // homeVendorController.lat.value = position.latitude.toString();
      // homeVendorController.long.value = position.longitude.toString();
      setState(() {});
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                CustomPngImage(
                  imageName: "login",
                  width: Get.width,
                  height: 427.h,
                ),
                Positioned(
                    top: 30.h,
                    // left: 10.w,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    )),
                Positioned(
                  bottom: 20.h,
                  left: SPHelper.spHelper.getLanguage() == "en" ? 25.w : 0.w,
                  right: SPHelper.spHelper.getLanguage() == "en" ? 0.w : 25.w,
                  child: CustomText(
                    "Hi ! Welcome Back",
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: "tajawalb",
                  ),
                ),
                Positioned(
                  bottom: 0.h,
                  left: SPHelper.spHelper.getLanguage() == "en" ? 25.w : 0.w,
                  right: SPHelper.spHelper.getLanguage() == "en" ? 0.w : 25.w,
                  child: CustomText(
                    "You should log in to your account to can put ads",
                    color: Color(0xffBFBFBF),
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextFormField(
                      hint: "Username",
                      onSaved: setEmail,
                      validator: SignInView.validationEmail,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomTextFormField(
                      hint: "Password",
                      isPassword: true,
                      onSaved: setPassword,
                      validator: validation,
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => ResetPasswordView());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                            "Forget Password?",
                            fontSize: 15.sp,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 33.h,
                    ),
                    CustomButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          signInDataSource(email: email, password: password,
                          location_lat: authController.lat.toString(),
                          location_long: authController.long.toString()
                          );
                        }
                      },
                      height: 59.h,
                      width: Get.width,
                      title: "Log In",
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        getCurrentLocation();
                        Get.to(() => ChooseMethodView());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            "Don't have an account? ",
                            fontSize: 15.sp,
                            color: AppColors.borderColor,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          CustomText(
                            "Sign Up",
                            fontSize: 15.sp,
                            color: AppColors.primaryColor,
                            // fontFamily: "tajawalb",
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Get.off(() => MainView());
                    //   },
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       CustomText(
                    //         "Continue As A Visitor",
                    //         fontSize: 13.sp,
                    //         color: AppColors.primaryColor,
                    //         // fontFamily: "tajawalb",
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ]),
            )
          ]),
        ),
      ),
    );
  }
}
