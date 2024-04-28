import 'dart:convert';

import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/helper/prefs_helper.dart';
import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/auth/location_controller/location_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  LocationController locationController = Get.find<LocationController>();

  bool signInLoading = false;
  TextEditingController emailController =
  TextEditingController(text: kDebugMode ? "teyoj37371@centerf.com" : "");
  TextEditingController passWordController =
  TextEditingController(text: kDebugMode ? "Nadim12345" : "");

  var headers = {'Content-Type': 'application/json'};

  signInUser() async {
    signInLoading = true;
    update();
    Map<String, String> body = {
      'email': emailController.text,
      'password': passWordController.text,
    };

    var response = await ApiClient.postData(ApiConstant.login, jsonEncode(body),
        headers: headers);

    if (response.statusCode == 200) {
      PrefsHelper.setString(AppConstants.bearerToken, response.body["access_token"]);
      PrefsHelper.setBool(AppConstants.isSocialLogIn, false);
      PrefsHelper.setString(
          AppConstants.profileID, response.body["user_id"].toString());
      Get.offNamed(
        AppRoute.navBar,
      );
      emailController.clear();
      passWordController.clear();
    } else {
      ApiChecker.checkApi(response);
    }
    signInLoading = false;
    update();
  }

  Future<void> signInWithGoogle() async {
    //==================Get Location Permission=============

    locationController.getLocation();

    //========Trigger the authentication flow=========

    final googleUser = await GoogleSignIn().signIn();

    debugPrint(
        "credential====================================================$googleUser");
    debugPrint(
        "googleAuth?.idToken====================================================${googleUser!.id}");

    //================Send Information To Server==================
    signInLoading = true;
    update();

    //===============Get latitude and longitude============

    String? latitude = await PrefsHelper.getString(AppConstants.latitude);
    String? longitude =
    await PrefsHelper.getString(AppConstants.longitude);

    var body = {
      "name": googleUser.displayName ?? "",
      "email": googleUser.email,
      "google_id": googleUser.id,
      "user_type": "user",
      "latitude": latitude,
      "longitude": longitude,
    };

    var response = await ApiClient.postData(  ApiConstant.socialAuth, body);

    if (response.statusCode == 200) {
      debugPrint(
          "Access token=================================${response.body["access_token"]}");

      PrefsHelper.setString(
          AppConstants.bearerToken, response.body["access_token"]);

      Get.offAllNamed(AppRoute.navBar);
    } else {
      GoogleSignIn().signOut();
      ApiChecker.checkApi(response);
      //toastMessage(message: response.body['email'][0]);
    }

    signInLoading = false;
    update();
  }

}
