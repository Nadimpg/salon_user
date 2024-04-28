import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/helper/prefs_helper.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/utils/app_images.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  final PageController controller = PageController();

  @override
  void initState() {
    PrefsHelper.setBool(AppConstants.onBoard, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;


    return SafeArea(
      top: true,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.bgColor,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 45.0, right: 45.0, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DotsIndicator(
                dotsCount: 4,decorator: const DotsDecorator(color: AppColors.stroke,activeColor: AppColors.white),
                position: currentIndex,
              ),
              GestureDetector(
                onTap: () {
                  controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                  if(currentIndex == 3){
                    Get.offAllNamed(AppRoute.signInScreen);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryOrange,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: const Icon(Icons.arrow_forward_ios_sharp,size: 20,color: AppColors.white),
                )
              ),
            ],
          ),
        ),
        body: PageView(
          physics: const ClampingScrollPhysics(),
          pageSnapping: true,
          controller: controller,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImage(imageSrc: AppImages.on1,imageType: ImageType.png,size: height*0.6,fit: BoxFit.fill),
                CustomText(
                  text: "Your satisfaction is our goal.".tr,
                  fontSize: 24,
                  maxLines: 2,overflow: TextOverflow.ellipsis,
                  top: 24,
                  left: 18,
                  right: 18,fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                ),
                CustomText(
                  text: "The best barber salon app for your good looks & beauty".tr,
                  fontSize: 14,
                  maxLines: 2,overflow: TextOverflow.ellipsis,
                  top: 12,
                  left: 18,
                  right: 18,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImage(imageSrc: AppImages.on2,imageType: ImageType.png,size: height*0.6,fit: BoxFit.fill),
                CustomText(
                  text: "Find & Booking Service".tr,
                  fontSize: 24,
                  maxLines: 2,overflow: TextOverflow.ellipsis,
                  top: 24,
                  left: 18,
                  right: 18,
                  textAlign: TextAlign.start,
                ),
                CustomText(
                  text: "Find & book your barber, salon & services anytime, anywhere.".tr,
                  fontSize: 14,
                  maxLines: 2,overflow: TextOverflow.ellipsis,
                  top: 12,
                  left: 18,
                  right: 18,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Column(
              children: [
                CustomImage(imageSrc: AppImages.on3,imageType: ImageType.png,size: height*0.6,fit: BoxFit.fill),
                CustomText(
                  text: "Style that fits your lifestyle".tr,
                  fontSize: 24,
                  top: 24,
                  maxLines: 2,overflow: TextOverflow.ellipsis,
                  left: 18,
                  right: 18,
                  textAlign: TextAlign.start,
                ),
                CustomText(
                  text: "Choose the special offers & services in nearest salon, create a stylish lifestyle.".tr,
                  fontSize: 14,
                  maxLines: 2,overflow: TextOverflow.ellipsis,
                  top: 12,
                  left: 18,
                  right: 18,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Column(
              children: [
                CustomImage(imageSrc: AppImages.on4,imageType: ImageType.png,size: height*0.6,fit: BoxFit.fill),
                CustomText(
                  text: "Style that fits your lifestyle".tr,
                  fontSize: 24,
                  top: 24,
                  maxLines: 2,overflow: TextOverflow.ellipsis,
                  left: 18,
                  right: 18,
                  textAlign: TextAlign.start,
                ),
                CustomText(
                  text: "Choose the special offers & services in nearest salon, create a stylish lifestyle.".tr,
                  fontSize: 14,
                  maxLines: 2,overflow: TextOverflow.ellipsis,
                  top: 12,
                  left: 18,
                  right: 18,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
