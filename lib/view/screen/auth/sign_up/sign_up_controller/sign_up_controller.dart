
import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/helper/prefs_helper.dart';
import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController confirmPasController = TextEditingController();

  bool signUpLoading = false;

  String otp = "";
  var headers = {'Accept': 'application/json'};

  signUpUser() async {
    signUpLoading = true;
    update();
    Map<String, String> body = {
      'name': nameController.text,
      'email': emailController.text,
      'password': passWordController.text,
      'password_confirmation': confirmPasController.text,
      "latitude": "3214",
      "longitude": "1234",
      "user_type": "user",
    };
    var response = await ApiClient.postData(ApiConstant.register, body, headers: headers);
    if (response.statusCode == 200) {


      Get.toNamed(
        AppRoute.otpScreen,
        arguments: true
      );
      nameController.clear();

      passWordController.clear();
      confirmPasController.clear();
    } else {
      ApiChecker.checkApi(response);
    }
    signUpLoading = false;
    update();
  }


  Future<bool> resendOTP() async {
    var body = {
      "email": emailController.text,
    };
    var response = await ApiClient.postData(
      ApiConstant.resendOtp,
      body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      ApiChecker.checkApi(response);
      return false;
    }
  }

  varifyOTP() async {
    signUpLoading = true;
    update();
    var body = {"email": emailController.text, "otp": otp};
    var response = await ApiClient.postData(
      ApiConstant.verified,
      body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      PrefsHelper.setString(AppConstants.bearerToken,
          response.body["token"]["original"]["access_token"]);
      PrefsHelper.setBool(AppConstants.isProviderAdded, false);
      PrefsHelper.setBool(AppConstants.isSocialLogIn, false);

      Get.offNamed(
        AppRoute.navBar,
      );
    } else {
      ApiChecker.checkApi(response);
    }
    signUpLoading = false;
    update();

    print('email============${emailController.text}');
  }


  /// <-------------> forgetPassword <------------->
  TextEditingController forgetEmailTextCtrl=TextEditingController();
  handleForgetPassword()async{
    signUpLoading = true;
    update();
    var body={
      "email":forgetEmailTextCtrl.text.trim()
    };
    var response=await ApiClient.postData(ApiConstant.forgetPass, body,headers: headers);
    if(response.statusCode==200){
      Get.toNamed(AppRoute.forgetPasswordOtpScreen);
    }else{
      ApiChecker.checkApi(response);
    }
    signUpLoading=false;
    update();
  }

  /// ============= forgetOtp =========
  forgetOtp() async {
    signUpLoading = true;
    update();
    var body = {"email": forgetEmailTextCtrl.text, "otp": otp};
    var response = await ApiClient.postData(
      ApiConstant.verified,
      body,
      headers: headers,
    );
    print('statuscode ===============${response.statusCode}');
    if (response.statusCode == 200) {
      Get.offNamed(
        AppRoute.resetPassword,
      );
    } else {
      ApiChecker.checkApi(response);
    }
    signUpLoading = false;
    update();
  }

  ///======= resetPassword ========
      TextEditingController resetPasswordController=TextEditingController();
      TextEditingController resetConfirmPasswordController=TextEditingController();
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
        "password": resetPasswordController.text,
        "password_confirmation": resetConfirmPasswordController.text
      };

      var response = await ApiClient.postData(ApiConstant.resetPassword, body,
          headers: headers);

      if (response.statusCode == 200) {
        Get.snackbar("Done", "Successfully updated");
        Get.offNamed(AppRoute.signInScreen);
      } else {
        ApiChecker.checkApi(response);
      }

      signUpLoading = false;
      update();
    }


}
