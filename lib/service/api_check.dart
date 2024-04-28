import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/helper/prefs_helper.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/utils/snack_bar.dart';
import 'package:get/get.dart';

class ApiChecker {
  static void checkApi(Response response, {bool getXSnackBar = false}) async {
    if (response.statusCode == 401) {
      await PrefsHelper.remove(AppConstants.bearerToken);
      Get.offAllNamed(AppRoute.signInScreen);
    } else {
      showCustomSnackBar(response.statusText!, getXSnackBar: getXSnackBar);
    }
  }
}