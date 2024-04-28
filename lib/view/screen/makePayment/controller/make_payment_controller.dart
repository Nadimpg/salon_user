
import 'package:barber_user_app/helper/prefs_helper.dart';
import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/booking_request/booking_request_controller.dart';
import 'package:barber_user_app/view/screen/profile/profile_controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/models/requests/customer.dart';
import 'package:flutterwave_standard/models/requests/customizations.dart';
import 'package:flutterwave_standard/models/responses/charge_response.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class MakePaymentController extends GetxController {
  ProfileController profileController = Get.find<ProfileController>();
  BookingRequestController bookingRequestController = Get.find<BookingRequestController>();
  dynamic package;

  RxBool isloading = false.obs;
  Customer customer = Customer(email: "");

  generateGatewayLink({required String ammount, required String bookingid,required String providerId,required String userId}) async {
    isloading.value = true;
    refresh();

    var info = profileController.profileModel.value;

    var body = {
      "amount": ammount,
      "email": info.email,
      "currency": "NGN",
      "name": info.name,
      "phone": info.phoneNumber ?? "123456789",
      "booking_id": bookingid,
      "provider_id" : providerId,
      "user_id" : userId
    };

    customer = Customer(
        name: info.name,
        phoneNumber: info.phoneNumber ?? "123456789",
        email: info.email!);

    var response =
    await ApiClient.postData("${ApiConstant.makePayment}$bookingid", body);

    if (response.statusCode == 200) {
      debugPrint(
          "Response URL===================================${response.body["link"]}");

      makePayment(
          redirectUrl: response.body["link"],
          ammount: ammount,
          bookingId: bookingid.toString(), providerid: providerId, userId: userId,);
    } else {
      ApiChecker.checkApi(response);
    }

    isloading.value = false;
    refresh();
  }

  makePayment(
      {required String redirectUrl,
        required String ammount,
        required String bookingId,
        required String providerid,
        required String userId
      }) async {
    var uuid = const Uuid();

    debugPrint("uuid========================${uuid.v1()}");

    final Flutterwave flutterwave = Flutterwave(
        context: Get.context!,
        publicKey: ApiConstant.paymentPublicKey,
        currency: "NGN",
        redirectUrl: redirectUrl,
        txRef: uuid.v1(),
        amount: ammount,
        customer: customer,
        paymentOptions: "ussd, card, barter, payattitude",
        customization: Customization(title: "My Payment"),
        isTestMode: true);

    final ChargeResponse response = await flutterwave.charge();

    debugPrint(
        "Payment Success===================================${response.success}");

    debugPrint(
        "Payment transactionId===================================${response.transactionId}");

    debugPrint(
        "Payment status===================================${response.status}");
    debugPrint(
        "Payment txRef===================================${response.txRef}");

    PrefsHelper.setBool(AppConstants.paymentDone, response.success!);

    inputInServer(
        ammount: ammount,
        status: response.status!,
        txRef: response.txRef!,
        bookingid: bookingId,
        transactionId: response.transactionId!, providerId: providerid, userId: userId);
  }

  inputInServer({
    required String ammount,
    required String status,
    required String txRef,
    required String bookingid,
    required String transactionId,
    required String providerId,
    required String userId

  }) async {
    var info = profileController.profileModel.value;

   /* //=============Get User ID==========
    var profileID = await PrefsHelper.getString(
      AppConstants.profileID,
    );*/

    //debugPrint("user_id==========================>>>>>>>>>>>$profileID");

    var body = {
      "booking_id": bookingid,
      "user_id": userId,
      "tx_ref": txRef,
      "amount": ammount,
      "currency": "NGN",
      "payment_type": "Card",
      "status": status,
      "email": info.email,
      "name": info.name,
      "provider_id" : providerId,
    };

    var response = await ApiClient.postData(ApiConstant.paymentSuccess, body);

    if (response.statusCode == 200) {
      bookingRequestController.getBookingRequest();
    } else {
      ApiChecker.checkApi(response);
    }
  }
}








/*
import 'package:barber_user_app/helper/prefs_helper.dart';
import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/makePayment/customer.dart';
import 'package:barber_user_app/view/screen/profile/profile_controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/models/requests/customer.dart';
import 'package:flutterwave_standard/models/requests/customizations.dart';
import 'package:flutterwave_standard/models/responses/charge_response.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class MakePaymentController extends GetxController {
  ProfileController profileController = Get.find<ProfileController>();
  dynamic package;

  RxBool isloading = false.obs;
  Customer customer = Customer(email: "");

  generateGatewayLink({required String ammount, required String bookingid,required String providerId}) async {
    isloading.value = true;
    refresh();

    var info = profileController.profileModel.value;

    var body = {
      "amount": ammount,
      "email": info.email,
      "currency": "NGN",
      "name": info.name,
      "phone": info.phoneNumber ?? "123456789",
      "booking_id": bookingid,
      "provider_id" : providerId
    };

    customer = Customer(
        name: info.name,
        phoneNumber: info.phoneNumber ?? "123456789",
        email: info.email!);

    var response =
    await ApiClient.postData("${ApiConstant.makePayment}$bookingid", body);

    if (response.statusCode == 200) {
      debugPrint(
          "Response URL===================================${response.body["link"]}");

      makePayment(
        redirectUrl: response.body["link"],
        ammount: ammount,
        bookingId: bookingid.toString(), providerid: providerId,);
    } else {
      ApiChecker.checkApi(response);
    }

    isloading.value = false;
    refresh();
  }

  makePayment(
      {required String redirectUrl,
        required String ammount,
        required String bookingId,
        required String providerid
      }) async {
    var uuid = const Uuid();

    debugPrint("uuid========================${uuid.v1()}");

    final Flutterwave flutterwave = Flutterwave(
        context: Get.context!,
        publicKey: ApiConstant.paymentPublicKey,
        currency: "NGN",
        redirectUrl: redirectUrl,
        txRef: uuid.v1(),
        amount: ammount,
        customer: customer,
        paymentOptions: "ussd, card, barter, payattitude",
        customization: Customization(title: "My Payment"),
        isTestMode: true);

    final ChargeResponse response = await flutterwave.charge();

    debugPrint(
        "Payment Success===================================${response.success}");

    debugPrint(
        "Payment transactionId===================================${response.transactionId}");

    debugPrint(
        "Payment status===================================${response.status}");
    debugPrint(
        "Payment txRef===================================${response.txRef}");

    PrefsHelper.setBool(AppConstants.paymentDone, response.success!);

    inputInServer(
        ammount: ammount,
        status: response.status!,
        txRef: response.txRef!,
        bookingid: bookingId,
        transactionId: response.transactionId!, providerId: providerid);
  }

  inputInServer({
    required String ammount,
    required String status,
    required String txRef,
    required String bookingid,
    required String transactionId,
    required String providerId,

  }) async {
    var info = profileController.profileModel.value;

    //=============Get User ID==========
    var profileID = await PrefsHelper.getInt(
      AppConstants.profileID,
    );

    debugPrint("user_id==========================>>>>>>>>>>>$profileID");

    var body = {
      "booking_id": bookingid,
      "user_id": profileID.toString(),
      "tx_ref": txRef,
      "amount": ammount,
      "currency": "NGN",
      "payment_type": "Card",
      "status": status,
      "email": info.email,
      "name": info.name,
      "provider_id" : providerId,
    };

    var response = await ApiClient.postData(ApiConstant.paymentSuccess, body);

    if (response.statusCode == 200) {

    } else {
      ApiChecker.checkApi(response);
    }
  }
}*/

