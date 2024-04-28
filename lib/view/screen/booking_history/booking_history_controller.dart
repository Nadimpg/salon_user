import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/booking_history/booking_history_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingHistoryController extends GetxController{

  final rxRequestStatus = Status.loading.obs;


  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  RxList<Datum> bookingHistoryModel = <Datum>[].obs;

  var totalPage = 0;
  var currentPage = 0;

  bool isLoading = false;

  ScrollController scrollController = ScrollController();

  //===================Pagination Scroll Controller===============

  Future<void> addScrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMore();
    }
  }
  //==================================Booking req==================================

  getBookingHistory() async {
    setRxRequestStatus(Status.loading);

    var response = await ApiClient.getData(ApiConstant.bookingHistory);

    if (response.statusCode == 200) {
      bookingHistoryModel.value =
      List<Datum>.from(response.body["data"].map((x) => Datum.fromJson(x)));

      if (bookingHistoryModel.isNotEmpty) {
        currentPage = response.body['pagination']['current_page'];
        totalPage = response.body['pagination']['total_pages'];
      }

      //  bookingReqList.value = bookingReqModel.value.data!;
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
//==================================Pagination============================
  var isLoadMoreRunning = false.obs;
  RxInt page = 1.obs;

  loadMore() async {
    debugPrint("===============load more=============");
    if (rxRequestStatus.value != Status.loading &&
        isLoadMoreRunning.value == false &&
        totalPage != currentPage) {
      isLoadMoreRunning(true);
      page.value += 1;

      Response response = await ApiClient.getData(
        "${ApiConstant.bookingHistory}?page=$page",
      );
      currentPage = response.body['pagination']['current_page'];
      totalPage = response.body['pagination']['total_pages'];

      if (response.statusCode == 200) {
        var demoList = List<Datum>.from(
            response.body["data"].map((x) => Datum.fromJson(x)));
        bookingHistoryModel.addAll(demoList);

        bookingHistoryModel.refresh();
      } else {
        ApiChecker.checkApi(response);
      }
      isLoadMoreRunning(false);
    }
  }
//=====================refresh Booking==================
  refreshBookingReq() {
    bookingHistoryModel.clear();
    getBookingHistory();
    page.value = 1;
    refresh();
  }

  @override
  void onInit() {
    scrollController.addListener(addScrollListener);
    getBookingHistory();
    super.onInit();
  }


  /*final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  /// =========== categoryIndividual ============
  BookingHistoryModel bookingHistoryModel = BookingHistoryModel();
  List<Datum> bookingHistoryList = [];


  getBookingHistory() async {
    bookingHistoryList = [];
    setRxRequestStatus(Status.loading);

    var response = await ApiClient.getData(ApiConstant.bookingHistory);

    if (response.statusCode == 200) {
      bookingHistoryModel=BookingHistoryModel.fromJson(response.body);

      List<Datum>? rawData = bookingHistoryModel.data;

      if (rawData != null && rawData.isNotEmpty) {
        bookingHistoryList.addAll(rawData);
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
  }*/

}