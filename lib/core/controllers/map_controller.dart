import 'dart:developer';
import 'dart:io';

import 'package:car_rental/features/map_view/models/ads_map_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InfoWindowController extends GetxController {
  bool _showInfoWindow = false;
  bool _tempHidden = false;
  DataAdsMap? _adsMap;
  double? _leftMargin;
  double? _topMargin;

  void rebuildInfoWindow() {
    update();
  }

  void updateResturant(DataAdsMap adsMap) {
    _adsMap = adsMap;
    update();
  }

  void updateVisibility(bool visibility) {
    _showInfoWindow = visibility;
    update();
  }

  void updateInfoWindow(
    BuildContext context,
    GoogleMapController controller,
    LatLng location,
    double infoWindowWidth,
    double markerOffset,
  ) async {
    ScreenCoordinate screenCoordinate =
        await controller.getScreenCoordinate(location);
    double devicePixelRatio =
        Platform.isAndroid ? MediaQuery.of(context).devicePixelRatio : 1.0;
    double left = (screenCoordinate.x.toDouble() / devicePixelRatio) -
        (infoWindowWidth / 2);
    double top =
        (screenCoordinate.y.toDouble() / devicePixelRatio) - markerOffset;
    if (left < 0 || top < 0) {
      _tempHidden = true;
    } else {
      _tempHidden = false;
      _leftMargin = left;
      _topMargin = top;
    }
    update();
  }

  bool get showInfoWindow =>
      (_showInfoWindow == true && _tempHidden == false) ? true : false;

  double get leftMargin => _leftMargin!;

  double get topMargin => _topMargin!;

  DataAdsMap get ads => _adsMap!;
}
