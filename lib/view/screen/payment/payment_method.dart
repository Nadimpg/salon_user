import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChoosePaymentMethod extends StatefulWidget {
  const ChoosePaymentMethod({super.key});

  @override
  State<ChoosePaymentMethod> createState() => _ChoosePaymentMethodState();
}

class _ChoosePaymentMethodState extends State<ChoosePaymentMethod> {

  int currentIndex = 0;

  List<dynamic> payment = [
    "Credit/Debit Card",
    "MTN Money",
    "Airtel Money"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
          appBarContent: CustomBack(text: "Make Payment".tr),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: "Choose your payment method".tr,
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  bottom: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: payment.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: AppColors.cardBgColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppColors.primaryLightOrange,
                                      width: 1,
                                      style: BorderStyle.solid),
                                  color: currentIndex == index
                                      ? AppColors.primaryOrange
                                      : AppColors.cardBgColor,
                                ),
                              ),
                              CustomText(text: payment[index], left: 12),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16)
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
          physics: const ClampingScrollPhysics(),
          child: CustomButton(titleText: "Proceed to Payment".tr,onPressed: () => Get.toNamed(AppRoute.makePayment),),
        ),
      ),
    );
  }
}
