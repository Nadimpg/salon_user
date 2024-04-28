
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/utils/app_icons.dart';
import 'package:barber_user_app/view/screen/search/inner_widget/search_filter.dart';
import 'package:barber_user_app/view/screen/search/search_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:barber_user_app/view/widgets/error/general_error.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:barber_user_app/view/widgets/service_card/service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchsController searchController = Get.find<SearchsController>();
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
          appBarContent: CustomBack(text: "Search".tr, isIcon: false),
        ),
        body: RefreshIndicator(
          backgroundColor: AppColors.cardBgColor,
          color: AppColors.primaryOrange,
          onRefresh: () async {
            await searchController.filterCategory();
          },
          child: Obx(() {
            switch (searchController.rxRequestStatus.value) {
              case Status.loading:
              case Status.internetError:
                return const CustomLoader();
              case Status.error:
                return GeneralErrorScreen(
                  onTap: () {
                    searchController.filterCategory();
                  },
                );
              case Status.completed:
                return  SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///============== search ============
                      CustomTextField(
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (value) {
                          if (value.isNotEmpty) {
                            searchController.searchCategory(search: value);
                          }
                        },
                        hintText: "Search".tr,
                        hintColor: AppColors.white,
                        fillColor: AppColors.stroke,
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 24,
                          color: AppColors.white,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return const SearchFilter();
                              },
                            );
                          },
                          child:const Padding(
                            padding:  EdgeInsets.all(12.0),
                            child:CustomImage(
                              imageSrc: AppIcons.filter,
                              size: 12,
                              imageColor: AppColors.paragraph,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      const ServiceCard(),
                    ],
                  ),
                );
            }
          }),
        ),
      ),
    );
  }
}

