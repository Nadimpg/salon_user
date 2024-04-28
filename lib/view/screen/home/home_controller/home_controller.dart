import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/home/home_model/home_category_model.dart';
import 'package:barber_user_app/view/screen/home/home_model/home_featured_model.dart';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  /// =========== category ============
  CategoryModel categoryModel = CategoryModel();
  List<CategoryMessage> categoryList = [];

  Future<bool> getCategory() async {
    categoryList = [];
    setRxRequestStatus(Status.loading);

    var response = await ApiClient.getData(ApiConstant.showCategory);

    if (response.statusCode == 200) {
      categoryModel = CategoryModel.fromJson(response.body);

      List<CategoryMessage>? rawData = categoryModel.message;

      if (rawData != null && rawData.isNotEmpty) {
        categoryList.addAll(rawData);
      }
     // debugPrint("=======================${categoryList[1].categoryName}");
      return true;
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }

    return false;
  }

  /// =========== home featured ===========

  HomeFeaturedModel homeFeaturedModel = HomeFeaturedModel();
  List<Message> featuredList = [];
  Future<bool> featuredProviders() async {
    featuredList = [];

    var response = await ApiClient.getData(ApiConstant.featuredProviders);

    if (response.statusCode == 200) {
      homeFeaturedModel = HomeFeaturedModel.fromJson(response.body);
      List<Message>? rawData = homeFeaturedModel.message;

      if (rawData != null && rawData.isNotEmpty) {
        featuredList.addAll(rawData);
        update();
      }
      // debugPrint("Featured=======================${featuredList[1].address}");
      return true;
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }

    return false;
  }

  /// =========== home featured ===========

  HomeFeaturedModel homeNearBydModel = HomeFeaturedModel();
  List<Message> nearByList = [];
  Future<bool> nearByProviders() async {
    nearByList = [];

    var response = await ApiClient.getData(ApiConstant.nearByProviders);

    if (response.statusCode == 200) {
      homeNearBydModel = HomeFeaturedModel.fromJson(response.body);
      List<Message>? rawData = homeNearBydModel.message;

      if (rawData != null && rawData.isNotEmpty) {
        nearByList.addAll(rawData);
        update();
      }
      // debugPrint("NearBy=======================${nearByList[1].address}");
      return true;
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }

    return false;
  }

  /// ========== service details ============
  serviceDetails() async {}

  homeRespose() async {
    bool getCategotyStatus = await getCategory();
    bool featuredProvidersStatus = await featuredProviders();
    bool nearByProvidersStatus = await nearByProviders();

    if (getCategotyStatus && featuredProvidersStatus && nearByProvidersStatus) {
      setRxRequestStatus(Status.completed);
    }
  }

  @override
  void onInit() {
    homeRespose();
    super.onInit();
  }
}
