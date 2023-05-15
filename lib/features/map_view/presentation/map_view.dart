import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/core/controllers/home_controller.dart';
import 'package:car_rental/core/controllers/map_controller.dart';
import 'package:car_rental/core/utils/app_imports.dart';
import 'package:car_rental/core/utils/helper.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart' as Geo;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;

class NearResturantMapScreen extends StatefulWidget {
  @override
  _NearResturantMapScreenState createState() => _NearResturantMapScreenState();
}

class _NearResturantMapScreenState extends State<NearResturantMapScreen> {
  GoogleMapController? mapController;

  HomeController homeController = Get.find();
  LatLng _center = LatLng(31.5, 34.46667);
  final double _zoom = 5.0;
  BitmapDescriptor? currentIcon;
  double lat = 0;

  double long = 0;
  double distanc = 0;

  // getCustomIcon() async {
  //   BitmapDescriptor bitmapDescriptor = await BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration.empty, "assets/images/mapicon.png");
  //   currentIcon = bitmapDescriptor;
  //   setState(() {});
  // }

  Set<Marker> _markers2 = Set<Marker>();

  getAllAdsLocation(InfoWindowController controller) async {
    try {
      for (var i = 0;
          i < homeController.getAdsMapData.value.data!.length;
          i++) {
        var now = DateTime.now().millisecondsSinceEpoch;

        _markers2.add(Marker(
          markerId: MarkerId(
              homeController.getAdsMapData.value.data![i].toString() +
                  now.toString()),
          position: LatLng(
            double.parse(
                homeController.getAdsMapData.value.data![i].locationLat),
            double.parse(
                homeController.getAdsMapData.value.data![i].locationLong),
          ),
          icon: await MarkerIcon.downloadResizePictureCircle(
            homeController.getAdsMapData.value.data![i].photo!,
            size: 150,
            addBorder: true,
            borderColor: Colors.white,
            borderSize: 15,
          ),
          onTap: () {
            controller.updateInfoWindow(
              context,
              mapController!,
              LatLng(
                double.parse(
                    homeController.getAdsMapData.value.data![i].locationLat),
                double.parse(
                    homeController.getAdsMapData.value.data![i].locationLong),
              ),
              _infoWindowWidth,
              _markerOffset,
            );
            controller
                .updateResturant(homeController.getAdsMapData.value.data![i]);
            controller.updateVisibility(true);
            controller.rebuildInfoWindow();

            setState(() {});
          },
        ));
      }
      setState(() {});
    } catch (e) {}
  }

  getCurrentLocation() async {
    try {
      Geo.Geolocator.requestPermission();
      Geo.Position position = await Geo.Geolocator.getCurrentPosition(
        desiredAccuracy: Geo.LocationAccuracy.high,
      );
      LatLng myLocation = LatLng(position.latitude, position.longitude);

      mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: myLocation, zoom: 14),
        ),
      );
      lat = position.latitude;
      long = position.longitude;

      setState(() {});
    } catch (e) {}
  }

  final double _infoWindowWidth = 250;
  final double _markerOffset = 170;
  @override
  void initState() {
    super.initState();
    // getCustomIcon();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GetBuilder<InfoWindowController>(
          init: InfoWindowController(),
          builder: (controller) => Stack(
            children: <Widget>[
              Positioned(
                child: GoogleMap(
                  myLocationEnabled: true,
                  mapType: MapType.satellite,
                  onTap: (position) {
                    if (controller.showInfoWindow) {
                      controller.updateVisibility(false);
                      controller.rebuildInfoWindow();
                    }
                  },
                  onCameraMove: (position) {
                    if (controller.ads.active != null) {
                      controller.updateInfoWindow(
                        context,
                        mapController!,
                        LatLng(double.parse(controller.ads.locationLat),
                            double.parse(controller.ads.locationLong)),
                        _infoWindowWidth,
                        _markerOffset,
                      );
                      controller.rebuildInfoWindow();
                    }
                  },
                  onMapCreated: (GoogleMapController controllerMap) async {
                    mapController = controllerMap;
                    await getCurrentLocation();
                    await getAllAdsLocation(controller);
                  },
                  markers: _markers2,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: _zoom,
                  ),
                ),
              ),
              // controller.ads.address == null
              //     ? SizedBox()
              //     : Positioned(
              //         left: 0,
              //         top: 0,
              //         child: Visibility(
              //           visible: controller.showInfoWindow,
              //           child: Container(
              //             margin: EdgeInsets.only(
              //               left: controller.leftMargin,
              //               top: controller.topMargin,
              //             ),
              //             // Custom InfoWindow Widget starts here
              //             child: Container(
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(12),
              //                 color: Colors.white,
              //               ),
              //               // height: 155,
              //               width: 250,
              //               padding: EdgeInsets.all(15),
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: <Widget>[
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     children: [
              //                       controller.ads.photo == null
              //                           ? Container(
              //                               width: 45,
              //                               height: 45,
              //                               decoration: BoxDecoration(
              //                                 shape: BoxShape.circle,
              //                                 color: AppColors.primaryColor,
              //                               ),
              //                             )
              //                           : CachedNetworkImage(
              //                               imageUrl: controller.ads.photo!,
              //                               imageBuilder:
              //                                   (context, imageProvider) =>
              //                                       Container(
              //                                 width: 45,
              //                                 height: 45,
              //                                 decoration: BoxDecoration(
              //                                   shape: BoxShape.circle,
              //                                   image: DecorationImage(
              //                                     image: imageProvider,
              //                                     fit: BoxFit.fill,
              //                                   ),
              //                                 ),
              //                               ),
              //                               errorWidget:
              //                                   (context, url, error) =>
              //                                       Icon(Icons.error),
              //                             ),
              //                       SizedBox(
              //                         width: 8,
              //                       ),
              //                       CustomText(
              //                         Helper.limitString(
              //                             controller.ads.name, 15),
              //                         fontSize: 18,
              //                       )
              //                     ],
              //                   ),
              //                   CustomText(
              //                     controller.ads.description,
              //                     fontSize: 14,
              //                   ),
              //                   SizedBox(
              //                     width: 10,
              //                   ),
              //                   SizedBox(
              //                     height: ScreenUtil().setHeight(2),
              //                   ),
              //                   GestureDetector(
              //                     onTap: () {
              //                       // RestaurantsApis.restaurantsApis
              //                       //     .getAllCategories(controller
              //                       //         .resturant.userId
              //                       //         .toString()
              //                       //         .toString());
              //                       // RestaurantsApis.restaurantsApis
              //                       //     .getBestProductsByResturant(
              //                       //         controller.resturant.userId
              //                       //             .toString(),
              //                       //         1,
              //                       //         true);
              //                       // Get.to(() =>
              //                       //     RestaurantScreen(controller.resturant));

              //                       // RestaurantsApis.restaurantsApis
              //                       //     .getRestaurantProfile(
              //                       //         controller.resturant.id.toString());
              //                       // RestaurantsApis.restaurantsApis
              //                       //     .getOffersProductsByResturant(controller
              //                       //         .resturant.userId
              //                       //         .toString());
              //                       // Get.to(() => RestaurantDetailsScreen());
              //                     },
              //                     child: Container(
              //                       width: double.infinity,
              //                       height: ScreenUtil().setHeight(35),
              //                       decoration: BoxDecoration(
              //                         color: AppColors.primaryColor,
              //                         borderRadius: BorderRadius.circular(10),
              //                       ),
              //                       child: Center(
              //                         child: CustomText(
              //                           'View Ads Details'.tr,
              //                         ),
              //                       ),
              //                     ),
              //                   )
              //                 ],
              //               ),
              //             ),
              //             // Custom InfoWindow Widget ends here
              //           ),
              //         ),
              //       ),
            ],
          ),
        ),
      ),
    );
  }
}
