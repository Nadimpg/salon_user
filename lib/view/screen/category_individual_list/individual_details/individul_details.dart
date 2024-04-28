import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/network_image.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/category_individual_list/individual_details/individual_details_controller/individual_details_controller.dart';
import 'package:barber_user_app/view/screen/category_individual_list/individual_details/rating_screen.dart';
import 'package:barber_user_app/view/screen/category_individual_list/inner_widget/review_card.dart';
import 'package:barber_user_app/view/screen/home/home_card_details/review_screen.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/error/general_error.dart';
import 'package:barber_user_app/view/widgets/row_text/row_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IndividualDetails extends StatefulWidget {
  const IndividualDetails({super.key});

  @override
  State<IndividualDetails> createState() => _IndividualDetailsState();
}

class _IndividualDetailsState extends State<IndividualDetails> {
  IndividualDetailsController controller = Get.find<IndividualDetailsController>();
  int catId = Get.arguments;
  @override
  void initState() {
    debugPrint("salon deatils id ========== $catId");
    controller.providerDetails(catId: catId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: AppColors.bgColor,
          extendBody: true,
          appBar:  const CustomAppBar(
            appBarContent:  CustomBack(text: 'Service Details'),
          ),
          body: Obx(() {
            switch (controller.rxRequestStatus.value) {
              case Status.loading:
                return const CustomLoader();
              case Status.internetError:
                return const CustomLoader();
              case Status.error:
                return GeneralErrorScreen(onTap: () {
                  controller.providerDetails(catId: catId);
                });
              case Status.completed:
                var data = controller.individualDetailsList;
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ///======== cover photo ==========
                      CustomNetworkImage(
                        borderRadius: BorderRadius.circular(8),
                        imageUrl:
                        "${ApiConstant.baseUrl}images/${data.gallaryPhoto![0]}",
                        height: 180.h,
                        width: MediaQuery.of(context).size.width,
                      ),
                      SizedBox(height: 16.h,),
                      ///======== service name =========
                      CustomText(
                          text: data.serviceName.toString(),
                          fontWeight: FontWeight.w600),
                      const SizedBox(height: 12),


                      /// ========= duration ========
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.watch_later_outlined,
                              color: AppColors.primaryOrange, size: 12),
                          CustomText(
                              text:
                                  "Duration - ${data.serviceDuration} minutes",
                              fontSize: 12,
                              left: 4),
                        ],
                      ),
                      const SizedBox(height: 12),

                      /// ========= review ========
                      IconButton(onPressed: (){
                        Get.to(()=>RatingScreen(),arguments: data);
                      }, icon:  Row(
                        children: [
                          Icon(Icons.star, size: 16, color: AppColors.primaryOrange),
                          CustomText(
                              text: controller.avgRating.toString(),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              left: 12),
                          CustomText(
                              text: '( ${controller.totalReview} Reviews )',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              left: 12),
                        ],
                      ),),


                      /// ========= description ========
                      if (data.serviceDescription!.isNotEmpty)
                        const CustomText(
                            text: "Description",
                            fontWeight: FontWeight.w600,
                            top: 24,
                            bottom: 16),
                      CustomText(
                        text: data.serviceDescription.toString(),
                        maxLines: 5,
                        textAlign: TextAlign.start,
                        fontSize: 14,
                        color: AppColors.paragraph,
                        overflow: TextOverflow.ellipsis,
                      ),

                      /// ========= gallery ========
                    if(data.gallaryPhoto!.isNotEmpty)  CustomText(
                        text: "Gallery".tr,
                        fontWeight: FontWeight.w600,
                        top: 24,
                        bottom: 16,
                      ),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.gallaryPhoto!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 12),
                              height: 80.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "${ApiConstant.baseUrl}images/${data.gallaryPhoto![index]}")),
                                  borderRadius: BorderRadius.circular(12)),
                            );
                          },
                        ),
                      ),


                      ///========== service hour ===========
                      CustomText(
                          text: "Service Hours".tr,
                          fontWeight: FontWeight.w600,
                          top: 24,
                          bottom: 16),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return RowText(
                            field:
                                data.availableServiceOur![index].day.toString(),
                            value:
                                "${data.availableServiceOur![index].startTime} - ${data.availableServiceOur![index].endTime}",
                          );
                        },
                      ),
                    /*  if (data.serviceRating!.isNotEmpty)
                        CustomText(
                            text: "User Review".tr,
                            fontWeight: FontWeight.w600,
                            top: 24,
                            bottom: 16),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data.serviceRating!.length,
                          itemBuilder: (context, index) {
                            return ReviewCard(
                              imageWidget: Container(
                                height: 40.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "${ApiConstant.baseUrl}${data.serviceRating![index].userImage}")),
                                    borderRadius: BorderRadius.circular(12)),

                              ),
                              name: data.serviceRating![index].userName
                                  .toString(),
                              description:
                                  data.serviceRating![index].review.toString(),
                              month:'12',
                              userRating: data.serviceRating![index].rating!.toDouble(),
                                // DateConverter.dateAndMonth(data.createdAt.toString())
                            );
                          }),
                      const SizedBox(height: 16),*/
                      const SizedBox(height: 24),
                      CustomButton(
                          titleText: "Book Appointment".tr,
                          onPressed: () =>
                              Get.toNamed(AppRoute.bookAppointment,arguments:data.providerId))
                    ],
                  ),
                );
            }
          })),
    );
  }
}
