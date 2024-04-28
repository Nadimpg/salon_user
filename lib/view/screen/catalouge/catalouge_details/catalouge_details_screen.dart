import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/network_image.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/utils/snack_bar.dart';
import 'package:barber_user_app/view/screen/book_appointmenmt/book_appointment_controller.dart';
import 'package:barber_user_app/view/screen/catalouge/catalouge_details/catalouge_details_controller.dart';
import 'package:barber_user_app/view/screen/catalouge/catalouge_details/catelog_rating.dart';
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

class CatalougeDetailsScreen extends StatefulWidget {
  const CatalougeDetailsScreen({super.key});

  @override
  State<CatalougeDetailsScreen> createState() => _CatalougeDetailsScreenState();
}

class _CatalougeDetailsScreenState extends State<CatalougeDetailsScreen> {
  CatalougeDetailsController controller=Get.find<CatalougeDetailsController>();
  BookAppoinmentController bookAppoinmentController = Get.find<BookAppoinmentController>();
  int catId = Get.arguments;
  @override
  void initState() {
    debugPrint("Catalouge deatils id ========== $catId");
    controller.getCatalougeDetail(catId: catId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: AppColors.bgColor,
          extendBody: true,
          appBar:const  CustomAppBar(
            appBarContent:  CustomBack(text: 'Catalouge Details'),
          ),
          body: Obx(() {
            switch (controller.rxRequestStatus.value) {
              case Status.loading:
                return const CustomLoader();
              case Status.internetError:
                return const CustomLoader();
              case Status.error:
                return GeneralErrorScreen(onTap: () {
                  controller.getCatalougeDetail(catId: catId);
                });
              case Status.completed:
                var data = controller.catalougDetails;
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
                        "${ApiConstant.baseUrl}${data.image![0]}",
                        height: 180.h,
                        width: MediaQuery.of(context).size.width,
                      ),
                      SizedBox(height: 16.h,),
                      ///======== service name =========
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                              text: data.catalogName.toString(),
                              fontWeight: FontWeight.w600),
                        /*  Container(
                            height: 24,
                            width: 24,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryOrange),
                            child: const Icon(Icons.share_outlined,
                                color: AppColors.white, size: 14),
                          ),*/
                        ],
                      ),
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
                         Get.to(()=>CatalogRating(),arguments: data);
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
                      if (data.catalogDescription!.isNotEmpty)
                        const CustomText(
                            text: "Description",
                            fontWeight: FontWeight.w600,
                            top: 24,
                            bottom: 16),
                      CustomText(
                        text: data.catalogDescription.toString(),
                        maxLines: 5,
                        textAlign: TextAlign.start,
                        fontSize: 14,
                        color: AppColors.paragraph,
                        overflow: TextOverflow.ellipsis,
                      ),

                      /// ========= gallery ========
                      if(data.image!.isNotEmpty)  CustomText(
                        text: "Gallery".tr,
                        fontWeight: FontWeight.w600,
                        top: 24,
                        bottom: 16,
                      ),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.image!.length,
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
                                          "${ApiConstant.baseUrl}${data.image![index]}")),
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
                            data.serviceHour![index].day.toString(),
                            value:
                            "${data.serviceHour![index].startTime} - ${data.serviceHour![index].endTime}",
                          );
                        },
                      ),

                      const SizedBox(height: 24),
                      CustomButton(
                          titleText: "Book Appointment".tr,
                          onPressed: () {
                           /* if(bookAppoinmentController.service.isEmpty){
                              Navigator.pop(context);
                              toastMessage(message: 'Service not available');
                            }else {
                              Get.toNamed(AppRoute.bookAppointment,arguments:data.id);
                            }*/
                            Get.toNamed(AppRoute.bookAppointment,arguments:data.id);

                            debugPrint('catalougedetails id =================${data.id}');
                          }

                      )
                    ],
                  ),
                );
            }
          })),
    );
  }
}
