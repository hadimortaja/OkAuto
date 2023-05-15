import 'package:bot_toast/bot_toast.dart';
import 'package:car_rental/core/controllers/auth_controller.dart';
import 'package:car_rental/core/services/sp_helper.dart';
import 'package:car_rental/core/utils/app_imports.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/features/choose_country_view/data/data_souces/cities_data_source.dart';
import 'package:car_rental/features/choose_country_view/presentation/views/choose_country_view.dart';
import 'package:car_rental/features/create_account_normal_user/data/data_sources/sign_up_user_data_source.dart';
import 'package:car_rental/features/privacy_policy_view/presentation/views/privacy_policy_view.dart';
import 'package:car_rental/features/upload_truck_view/presentation/widgets/upload_widget.dart';
  
class CreateAccountNormalUserView extends StatefulWidget {
  static validationEmail(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return 'This field is required*'.tr;
    }
    if (!GetUtils.isEmail(value)) {
      return 'Incorrect email format'.tr;
    }
  }

  @override
  State<CreateAccountNormalUserView> createState() =>
      _CreateAccountNormalUserViewState();
}

class _CreateAccountNormalUserViewState
    extends State<CreateAccountNormalUserView> {
  final formKey = GlobalKey<FormState>();

  validation(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return 'This field is required*'.tr;
    }
  }

  String? email, password, confirmPassword, name;

  setEmail(String email) {
    this.email = email;
  }

  setPassword(String password) {
    this.password = password;
  }

  setConfirmPassword(String confirmPassword) {
    this.confirmPassword = confirmPassword;
  }

  setName(String name) {
    this.name = name;
  }

  validateConfirmPass(String data) {
    if (confirmPassword == null || confirmPassword == '') {
      return 'This field is required*'.tr;
    } else if (confirmPassword != password) {
      return 'The passwords do not match'.tr;
    }
  }

  bool isChecked = false;
  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100.h,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: CustomButton(
                onTap: () {
                  if (isChecked == false) {
                    BotToast.showText(
                      text: "Please Check The Terms",
                      contentColor: AppColors.primaryColor,
                    );
                  } else {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      signUpUserDataSource(
                          username: name,
                          email: email,
                          password: password,
                          password_confirmation: confirmPassword,
                          city_id: authController.getCitiesSelect.value.id
                              .toString(),
                          location_lat: authController.lat.toString(),
                          location_long: authController.long.toString());
                    }
                  }
                },
                width: Get.width,
                height: 59.h,
                btnColor: AppColors.primaryColor,
                title: "Continue",
              ),
            ),
          ],
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          SizedBox(
            height: 46.h,
          ),
          Expanded(
              child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomText(
                "Create Account",
                fontSize: 27.sp,
                fontFamily: "tajawalb",
              ),
              CustomText(
                "Sign up and get started",
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xffBFBFBF),
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomTextFormField(
                hint: "Username",
                onSaved: setName,
                validator: validation,
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomTextFormField(
                hint: "Email Address",
                onSaved: setEmail,
                validator: CreateAccountNormalUserView.validationEmail,
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
                height: 30.h,
              ),
              CustomTextFormField(
                hint: "Confirm Password",
                isPassword: true,
                onSaved: setConfirmPassword,
                validator: validateConfirmPass,
              ),
              SizedBox(
                height: 30.h,
              ),
              Obx(
                () => UploadWidget(
                  isBlack: authController.getCitiesSelect.value.name != null ||
                      authController.getCitiesSelect.value.nameEn != null,
                  onTap: () {
                    citiesDataSource();
                    Get.to(() => ChooseCountryView());
                  },
                  title: ((SPHelper.spHelper.getLanguage() == "en"
                              ? authController.getCitiesSelect.value.nameEn
                              : authController.getCitiesSelect.value.name) ==
                          null)
                      ? "City"
                      : SPHelper.spHelper.getLanguage() == "en"
                          ? authController.getCitiesSelect.value.nameEn
                          : authController.getCitiesSelect.value.name,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(
                      width: 17.w,
                      height: 17.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.r),
                          color: isChecked
                              ? AppColors.primaryColor
                              : Color(0xffBFBFBF).withOpacity(0.50)),
                      child: isChecked
                          ? Center(
                              child: Icon(
                              Icons.check,
                              color: AppColors.whiteColor,
                              size: 15.r,
                            ))
                          : SizedBox(),
                    ),
                  ),
                  SizedBox(
                    width: 13.w,
                  ),
                  CustomText(
                    "I agree with the",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => PrivacyPolicyView());
                    },
                    child: CustomText(
                      " Terms Conditions& Privacy Policy",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              )
            ]),
          ))
        ]),
      ),
    );
  }
}
