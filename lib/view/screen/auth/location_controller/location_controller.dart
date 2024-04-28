
import 'package:barber_user_app/helper/prefs_helper.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  bool addressLoading = false;
  // late PermissionStatus _permissionGranted;
  // Location loc = Location();
  // loc.LocationData? locationData;

  Future getLocation() async {
    try {
      addressLoading = true;
      update();

      Location location = Location();

      bool serviceEnabled;
      PermissionStatus permissionGranted;
      LocationData locationData;

      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      locationData = await location.getLocation();

      PrefsHelper.setString(
          AppConstants.latitude, locationData.latitude.toString());
      PrefsHelper.setString(
          AppConstants.longitude, locationData.longitude.toString());

      debugPrint(
          "Latitute====================================${locationData.latitude}");
      debugPrint(
          "Longitude====================================${locationData.longitude}");
    } catch (error) {
      addressLoading = false;
      update();
      //Get.snackbar("Error", error.toString());
    }
  }

  @override
  void onInit() {
    getLocation();
    super.onInit();
  }
}
