
import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/category/category_model.dart';

import 'package:get/get.dart';

class CategoryController extends GetxController with GetxServiceMixin {
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  CategoryModel categoryModel = CategoryModel();
  List<Datum> categoryList = [];

  var clearSearch = true.obs;

  getCategory({String search = ""}) async {
    categoryList = [];
    setRxRequestStatus(Status.loading);

    var response =
    await ApiClient.getData("${ApiConstant.categorySearch}$search");

    if (response.statusCode == 200) {
      categoryModel = CategoryModel.fromJson(response.body);

      List<Datum>? rawData = categoryModel.data;

      if (rawData != null && rawData.isNotEmpty) {
        categoryList.addAll(rawData);

        if (search.isNotEmpty) {
          clearSearch.value = false;
          refresh();
        }
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
    getCategory();
    super.onInit();
  }
}