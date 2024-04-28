import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/view/screen/home/home_controller/home_controller.dart';
import 'package:barber_user_app/view/screen/search/search_controller.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  SearchsController searchController = Get.put(SearchsController());
  HomeController categoryController = Get.put(HomeController());
  List<String> categoryList = [
    "All",
    "Haircuts",
    "Hair color",
    "Shaving",
    "Massage",
    "Face Wash",
  ];

  List<String> reviewList = [
    "5",
    "4",
    "3",
    "2",
    "1",
  ];
  int reviewIndex = 0;

  int categoryIndex = 0;
  RangeValues sliderValue = const RangeValues(1, 20);
  /*@override
  void initState() {
    newModifiedCategory=[];
    newModifiedCategory.removeAt(0);
  newModifiedCategory = categoryController.categoryList;

  newModifiedCategory.insert(0, CategoryMessage(
   categoryName: "All",
  ));

    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: AppColors.cardBgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: CustomText(
                  text: "Filter".tr,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  top: 24,
                  bottom: 24),
            ),
            const Divider(color: AppColors.stroke, height: 1, thickness: 1),
            CustomText(
                text: "Category".tr,
                fontWeight: FontWeight.w600,
                top: 12,
                left: 20,
                bottom: 16),


            ///========== category =========
            SizedBox(
              height: 36,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount:searchController. newModifiedCategory.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          categoryIndex = index;

                          searchController.category =searchController.newModifiedCategory[index].categoryName!;
                          print('category===========${searchController.category}');
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        height: 36,
                        margin: const EdgeInsets.only(right: 16,left: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: categoryIndex == index
                              ? AppColors.primaryOrange
                              : AppColors.cardBgColor,
                          border: Border.all(
                              color: categoryIndex == index
                                  ? AppColors.primaryOrange
                                  : AppColors.stroke),
                        ),
                        child:
                        CustomText(text: categoryController.categoryList[index].categoryName.toString(), fontSize: 12),
                      ),
                    );
                  }),
            ),



            ///========== rating ===========
            CustomText(
                text: "Ratings".tr,
                fontWeight: FontWeight.w600,
                top: 24,
                left: 20,
                bottom: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: List.generate(
                  reviewList.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        reviewIndex = index;
                        searchController.rating=reviewList[index];
                        print('rating===========${searchController.rating}');
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      height: 36,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: reviewIndex == index
                            ? AppColors.primaryOrange
                            : AppColors.stroke,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.star,
                              color: AppColors.white, size: 14),
                          CustomText(
                              text: reviewList[index], left: 5, fontSize: 14),
                        ],
                      ),
                    ),
                  ),
                ).toList(),
              ),
            ),
            CustomText(
                text: "Distance".tr,
                fontWeight: FontWeight.w600,
                top: 24,
                left: 20,
                bottom: 12),
            RangeSlider(
              values: sliderValue,
              max: 20,
              min: 1,
              activeColor: AppColors.primaryOrange,
              inactiveColor: AppColors.stroke,
              onChanged: (newValue) {
                setState(() {
                  sliderValue = newValue;

                  searchController.distance=sliderValue.end.toInt();
                  print('distance===========${searchController.distance}');
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "${sliderValue.start.toInt().toString()} km",
                  ),
                  CustomText(
                    text: "${sliderValue.end.toInt().toString()} km",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: CustomButton(
                  onPressed: () {
                    searchController.filterCategory();

                    Get.back();
                  }, titleText: "Apply".tr),
            ),
          ],
        ),
      ),
    );
  }
}
