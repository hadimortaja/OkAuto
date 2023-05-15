import 'package:car_rental/core/controllers/auth_controller.dart';
import 'package:car_rental/core/services/sp_helper.dart';
import 'package:car_rental/core/utils/app_imports.dart';
import 'package:car_rental/core/value/animate_do.dart';
import 'package:car_rental/features/choose_country_view/data/data_souces/cities_data_source.dart';
import 'package:car_rental/features/choose_service_view/data/data_sources/choose_service_data_source.dart';
import 'package:car_rental/features/home_view/data/data_sources/home_banners_data_source.dart';
import 'package:car_rental/features/home_view/data/data_sources/home_categories_data_source.dart';
import 'package:car_rental/features/home_view/data/data_sources/most_popular_data_source.dart';
import 'package:car_rental/features/main_view/presentation/main_view.dart';
import 'package:car_rental/features/onboarding_view/presentation/views/onboarding_view.dart';
import 'package:car_rental/features/profile_view/data/data_sources/get_profile_data_source.dart';
import 'package:car_rental/features/profile_view/data/data_sources/get_vendor_profile_data_source.dart';
import 'package:car_rental/features/signin_view/presentation/views/signin_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart' as Geo;

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
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
  void initState() {
    var delay = Duration(seconds: 10);
    Future.delayed(delay, () async {
      chooseServiceDataSource();
      homeCategoriesDataSource();
      homeMostPopularDataSource();
      homeBannersDataSource();
      citiesDataSource();
      getProfileDataSource();
      if (SPHelper.spHelper.getType() == "1") {
        getVendorProfileDataSource();
      } else {}
      // if (SPHelper.spHelper.getViewOnBoarding() == true) {
      Get.offAll(() => MainView());
      // } else {
      // Get.offAll(() => OnBoardingScreen());
      // }
      getCurrentLocation();
      print(authController.lat);
      print(authController.long);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: Get.height,
      width: Get.width,
      child: Image.asset(
        'assets/images/qsplashnew (2).gif',
        fit: BoxFit.fill,
      ),
    ));
  }
}
