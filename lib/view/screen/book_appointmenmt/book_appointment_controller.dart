import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/utils/snack_bar.dart';
import 'package:barber_user_app/view/screen/book_appointmenmt/book_appointment_model.dart';
import 'package:barber_user_app/view/screen/booking_request/booking_request_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookAppoinmentController extends GetxController {
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  BookingRequestController bookingRequestController =
      Get.put(BookingRequestController());

  BookAppointmentModel bookAppointmentModel = BookAppointmentModel();
  Provider provider = Provider();
  Parcentage parcentage = Parcentage();

  var selectedValues = {}.obs;

  var totalReview = 0;
  num avgRating = 0;

  var totalAMount = 0;

  totalPrice({required int price}) {
    totalAMount += price;
    debugPrint("Total Price=============================$totalAMount");
    update();
  }

  clearPrice() {
    totalAMount = 0;
    update();
  }

  int calculatedPercentage({required int percentage}) {
    int calculatedPercentage = 0;

    calculatedPercentage = (totalAMount * percentage) ~/ 100;

    debugPrint(
        "calculatedPercentage=============================$calculatedPercentage");

    return calculatedPercentage;
  }

  bookAppointmentCategory({required int catId}) async {
    setRxRequestStatus(Status.loading);

    var response =
        await ApiClient.getData(ApiConstant.bookAppoinment + catId.toString());

    if (response.statusCode == 200) {
      bookAppointmentModel = BookAppointmentModel.fromJson(response.body);

      var rawData = bookAppointmentModel.provider;
      var parcentageData = bookAppointmentModel.parcentage;

      /* if (rawData != null) {
        provider = rawData;
        parcentage = parcentageData!;
        totalReview = bookAppointmentModel.totalReview!;
        avgRating = bookAppointmentModel.avgRating!;
      }*/
      if (rawData != null) {
        provider = rawData;
        parcentage = parcentageData!; // Use a default value or handle null case
        totalReview = bookAppointmentModel.totalReview!; // Same as above
        avgRating = bookAppointmentModel.avgRating!; // Same as above
      }
      if(provider.services!.isEmpty){
        toastMessage(message: 'Service not available');
        navigator!.pop();
      }

      setRxRequestStatus(Status.completed);
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  /// ============== post booking ==================

  var providerName = ''.obs;
  var serviceType = "".obs;
  var address = "".obs;
  var bookingTime = ''.obs;
  var time = '9.30 AM'.obs;
  var serviceDuration = "".obs;
  var totalCharge = "".obs;
  var advanceMoney = "".obs;

  List<Map<String, dynamic>> service = [];
  List<Map<String, dynamic>> finalOutput = [];
  List<String> catalougeList = [];

  List<int> serviceIndexList = [];
  bool loading = false;
  bool isConfirm = false;

  postBooking(
      {required String userId,
      required String providerId,
      required String serviceDuration,
      required String service,
      required String totalPrice,
      required String advancePrice,
      required String date,
      required String time,
      required String serviceType}) async {
    loading = true;
    update();

    var body = {
      "userId": userId,
      "providerId": providerId,
      "serviceDuration": serviceDuration,
      "service": service,
      "price": totalPrice,
      "advance_money": advancePrice,
      "date": date,
      "time": time,
      "serviceType": serviceType
    };

    var response = await ApiClient.postData(
      ApiConstant.postBooking,
      body,
    );
    if (response.statusCode == 200) {
      bookingRequestController.getBookingRequest();
      // Get.toNamed(AppRoute.choosePayment);
      isConfirm = true;

      update();
    } else {
      ApiChecker.checkApi(response);

      print("Resonse++++++++++++++++++++++${response.body}");
    }

    loading = false;
    update();
  }
}

class ServiceCatalog {
  final int serviceId;
  final int catalogueId;

  ServiceCatalog({required this.serviceId, required this.catalogueId});

  Map<String, dynamic> toJson() {
    return {
      'service_id': serviceId,
      'catalogue_id': catalogueId,
    };
  }
}
