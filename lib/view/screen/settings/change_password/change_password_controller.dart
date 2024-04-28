import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/helper/prefs_helper.dart';
import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController  extends GetxController{

  bool signUpLoading = false;
  // var headers = {'Accept': 'application/json'};
  TextEditingController currentPasswordController=TextEditingController();
  TextEditingController newPasswordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  handleResetPassword()async{
    signUpLoading = true;
    var bearerToken =
    await PrefsHelper.getString(AppConstants.bearerToken);
    update();

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $bearerToken'
    };

    var body = {
      "current_password": currentPasswordController.text,
      "password": newPasswordController.text,
      "password_confirmation": confirmPasswordController.text
    };

    var response = await ApiClient.postData(ApiConstant.changePassword, body,
        headers: headers);

    if (response.statusCode == 200) {
      Get.snackbar("Done", "Successfully updated");
      Get.offNamed(AppRoute.settings);
    } else {
      ApiChecker.checkApi(response);
    }

    signUpLoading = false;
    update();
  }
}