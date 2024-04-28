import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/network_image.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/book_appointmenmt/book_appointment_controller.dart';
import 'package:barber_user_app/view/screen/category_individual_list/inner_widget/review_card.dart';
import 'package:barber_user_app/view/screen/home/home_card_details/home_card_details_controller.dart';
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

class HomeCardDetails extends StatefulWidget {
  const HomeCardDetails({super.key});

  @override
  State<HomeCardDetails> createState() => _HomeCardDetailsState();
}

class _HomeCardDetailsState extends State<HomeCardDetails> {
  List<String> category = [
    "Spa",
    "Nails",
    "Barber",
    "Salon",
    "Women’s",
    "Men’s",
    "Massage",
    "Piercing",
    "Skin care",
    "Hair Care",
    "Makeover",
    "Facial"
  ];
  HomeCardDetailsController controller=Get.find<HomeCardDetailsController>();
  BookAppoinmentController bookAppoinmentController = Get.find<BookAppoinmentController>();
  @override
  void initState() {
   controller.getSalonDetail(catId: catId);
    super.initState();
  }

  int catId = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
          appBarContent: CustomBack(text: "Salon Details".tr),
        ),
        body: Obx(() {
          switch (controller.rxRequestStatus.value) {
          case Status.loading:
          return const CustomLoader();
          case Status.internetError:
          return const CustomLoader();
          case Status.error:
          return GeneralErrorScreen(onTap: () {
            controller.getSalonDetail(catId: catId);
          });
          case Status.completed:
            var data=controller.selonDetails;
       return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///======image========
              CustomNetworkImage(
                borderRadius: BorderRadius.circular(8),
                imageUrl:
                "${ApiConstant.baseUrl}images/${controller.selonDetails.coverPhoto}",
                height: 180.h,
                width: MediaQuery.of(context).size.width,
              ),
                SizedBox(height: 16.h,),
              ///========== name =========
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                      text: data.businessName.toString(),
                      fontWeight: FontWeight.w600),
                 /* Container(
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.primaryOrange),
                    child: const Icon(Icons.share_outlined,
                        color: AppColors.white, size: 14),
                  ),*/
                ],
              ),
              const SizedBox(height: 12),

              ///======== rating =========
             IconButton(onPressed: (){
               Get.to(()=>ReviewScreen(),arguments: data);
             }, icon: Row(
               children: [
                 const Icon(Icons.star, size: 16, color: AppColors.primaryOrange),
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

              const SizedBox(height: 12),

              ///======== location ============
              Row(
                children: [
                  const Icon(Icons.location_on,
                      size: 16, color: AppColors.primaryOrange),
                  CustomText(
                      text: data.address.toString(),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      left: 12)
                ],
              ),

              ///======== description ===========
             if(data.description!.isNotEmpty)  const CustomText(
                  text: "Description",
                  fontWeight: FontWeight.w600,
                  top: 24,
                  bottom: 16),
              CustomText(
                text: data.description.toString(),
                maxLines: 5,
                textAlign: TextAlign.start,
                fontSize: 14,
                color: AppColors.paragraph,
                overflow: TextOverflow.ellipsis,
              ),

              ///======== service ========
              if(data.salonDetails!.isNotEmpty)  const CustomText(
                  text: "Services",
                  fontWeight: FontWeight.w600,
                  top: 24,
                  bottom: 16),
              Container(
                height: 120,
                margin: const EdgeInsets.only(top: 16),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: data.salonDetails!.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.catalougeListScreen,arguments: data.salonDetails![index].id);
                        print('service Id ===============${data.salonDetails![index].id}');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 90.w,
                              width: 90.w,
                              margin: const EdgeInsets.only(right: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "${ApiConstant.baseUrl}images/${data.salonDetails![index].gallaryPhoto![0]}"))
                              ),
                            ),
                            CustomText(text: data.salonDetails![index].serviceName.toString())
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              ///========= Service Hours  =========

              if(data.availableServiceOur!.isNotEmpty)  CustomText(
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
                      field: data.availableServiceOur![index].day.toString(),
                      value:
                          "${data.availableServiceOur![index].startTime} - ${data.availableServiceOur![index].endTime}",

                    );
                  },
                ),

              ///=========== gallery =========
                CustomText(
                  text: "Gallery".tr,
                  fontWeight: FontWeight.w600,
                  top: 24,
                  bottom: 16,
                ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: data.gallaryPhoto!.length,
                    itemBuilder: (context,index){
                      return Container(
                        height: 90.w,
                        width: 90.w,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "${ApiConstant.baseUrl}images/${data.gallaryPhoto![index]}"))
                        ),
                      );
                }),
              ),

             /* ///========= user review =========
            if(data.providerRating!.isNotEmpty)  CustomText(
                  text: "User Review".tr,
                  fontWeight: FontWeight.w600,
                  top: 24,
                  bottom: 16),

              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                // providerDetails.providerRating!.length
                itemCount: data.providerRating?.length,
                itemBuilder: (BuildContext context,index) {
                  var reviewCard = ReviewCard(
                    imageWidget: Container(
                      height: 40.w,
                      width: 40.w,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "${ApiConstant.baseUrl}images/${data.gallaryPhoto![0]}"))
                      ),
                    ),
                    name: data.providerRating![index].user!.name.toString(),
                    description: data.providerRating![index].review.toString(),
                    month:data.providerRating![index].createdAt.toString(),
                    userRating: data.providerRating![index].rating!.toDouble(),
                    // rating: providerDetails.providerRating![index].rating!.toDouble(),
                    //   data.providerRating![index].createdAt! == null ? '' : DateConverter.isoStringToLocalAMPM(data.providerRating![index].createdAt.toString() )
                  );
                  return reviewCard;
                },
              ),*/

              const SizedBox(height: 24),
              CustomButton(
                  titleText: "Book Appointment".tr,
                  onPressed: () {
                    Get.toNamed(AppRoute.bookAppointment,arguments: data.id);
                  },
          ),

            ],
          ),
        );
  }
})
      ),
    );
  }
}
