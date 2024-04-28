import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/home/home_controller/home_controller.dart';
import 'package:barber_user_app/view/screen/home/home_model/home_category_model.dart';
import 'package:barber_user_app/view/screen/search/search_model.dart';
import 'package:get/get.dart';

class SearchsController extends GetxController{
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  SearchModel searchModel = SearchModel();
  List<Datum> searchList = [];

  var clearSearch = true.obs;
  String category = 'all';
  String rating = '0';
  int distance = 0;

  searchCategory({String search = ""}) async {
    searchList = [];
    setRxRequestStatus(Status.loading);

    var response = await ApiClient.getData("${ApiConstant.searchSalon}$search");

    if (response.statusCode == 200) {
      searchModel = SearchModel.fromJson(response.body);

      List<Datum>? rawData = searchModel.data;

      if (rawData != null && rawData.isNotEmpty) {
        searchList.addAll(rawData);

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

  filterCategory()async{
    searchList = [];
    setRxRequestStatus(Status.loading);

    var response = await ApiClient.getData("${ApiConstant.filterSalon}$category/$rating/$distance");

    if (response.statusCode == 200) {
      searchModel = SearchModel.fromJson(response.body);

      List<Datum>? rawData = searchModel.data;

      if (rawData != null && rawData.isNotEmpty) {
        searchList.addAll(rawData);
        print('SearcData==============${searchList[0].businessName}');
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

  searchFilter(){
    searchCategory();
    filterCategory();
  }
  List<CategoryMessage> newModifiedCategory=[];
  HomeController categoryController = Get.put(HomeController());
  @override
  void onInit() {
    filterCategory();
    newModifiedCategory = categoryController.categoryList;

    /*newModifiedCategory.insert(0, CategoryMessage(
      categoryName: "All",
    ));*/
    super.onInit();
  }
}