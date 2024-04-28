

import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/booking_request/booking_request_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingRequestController extends GetxController with GetxServiceMixin {
  final rxRequestStatus = Status.loading.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  RxList<Datum> bookingReqModel = <Datum>[].obs;

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

  getBookingRequest() async {
    setRxRequestStatus(Status.loading);

    var response = await ApiClient.getData(ApiConstant.bookingRequest);

    if (response.statusCode == 200) {
      bookingReqModel.value =
      List<Datum>.from(response.body["data"].map((x) => Datum.fromJson(x)));

      if (bookingReqModel.isNotEmpty) {
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
        "${ApiConstant.bookingRequest}?page=$page",
      );
      currentPage = response.body['pagination']['current_page'];
      totalPage = response.body['pagination']['total_pages'];

      if (response.statusCode == 200) {
        var demoList = List<Datum>.from(
            response.body["data"].map((x) => Datum.fromJson(x)));
        bookingReqModel.addAll(demoList);

        bookingReqModel.refresh();
      } else {
        ApiChecker.checkApi(response);
      }
      isLoadMoreRunning(false);
    }
  }

//=====================refresh Booking==================
  refreshBookingReq() {
    bookingReqModel.clear();
    getBookingRequest();
    page.value = 1;
    refresh();
  }

  @override
  void onInit() {
    scrollController.addListener(addScrollListener);
    getBookingRequest();
    super.onInit();
  }
}








/*
import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/booking_request/booking_request_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BookingRequestController extends GetxController with GetxServiceMixin{
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  BookingRequestModel bookingRequestModel = BookingRequestModel();
  List<Datum> bookingRequestList = [];

  ///=========pagination==============
  var totalPage = 0;
  var currentPage = 0;
  RxInt page = 1.obs;

  var isLoadMoreRunning = false.obs;
  ScrollController scrollController = ScrollController();

  Future<void> addScrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMore();
    }
  }

  loadMore() async {
    debugPrint("===============load more=============");
    if (rxRequestStatus.value != Status.loading &&
        isLoadMoreRunning.value == false &&
        totalPage != currentPage) {
      isLoadMoreRunning(true);
      page.value += 1;

      Response response = await ApiClient.getData(
        "${ApiConstant.bookingRequest}?page=$page",
      );
      currentPage = response.body['pagination']['current_page'];
      totalPage = response.body['pagination']['total_pages'];

      if (response.statusCode == 200) {
        var demoList = List<Datum>.from(
            response.body["data"].map((x) => Datum.fromJson(x)));
        bookingRequestModel.addAll(demoList);

        bookingRequestModel.refresh();
      } else {
        ApiChecker.checkApi(response);
      }
      isLoadMoreRunning(false);
    }
  }

  getBookingRequest() async {
    bookingRequestList = [];
    setRxRequestStatus(Status.loading);

    var response =
    await ApiClient.getData("${ApiConstant.bookingRequest}");

    if (response.statusCode == 200) {
      bookingRequestModel = BookingRequestModel.fromJson(response.body);

      List<Datum>? rawData = bookingRequestModel.data;

      if (rawData != null && rawData.isNotEmpty) {
        bookingRequestList.addAll(rawData);

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

  @override
  void onInit() {
    getBookingRequest();
    super.onInit();
  }
}*/
