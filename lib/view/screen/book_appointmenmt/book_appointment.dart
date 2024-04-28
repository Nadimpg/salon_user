import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/network_image.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/utils/app_icons.dart';
import 'package:barber_user_app/utils/snack_bar.dart';
import 'package:barber_user_app/view/screen/book_appointmenmt/book_appointment_controller.dart';
import 'package:barber_user_app/view/screen/book_appointmenmt/custom_dropdown.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/error/general_error.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:barber_user_app/view/widgets/row_text/row_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  BookAppoinmentController controller = Get.find<BookAppoinmentController>();
  int catId = Get.arguments;
  @override
  void initState() {
    controller.bookAppointmentCategory(catId: catId);
    print('bookAppointId============ $catId');
    super.initState();
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  late int currentIndex = 0;

  List<String> timeList = [
    "9.30 AM",
    "10.00 AM",
    "11.00 AM",
    "12.00 AM",
    "01.00 PM",
    "02.00 PM",
    "03.00 PM",
    "04.00 PM",
    "05.00 PM",
    "06.00 PM",
    "07.00 PM",
    "08.00 PM",
  ];

  final List<String> items = [
    'Home Service',
    'Salon Service',
  ];

  String selectedFilteredValue = "";

  String? selectedService;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
          appBarContent: CustomBack(text: "Book Appointment".tr),
        ),
        body: Obx(() {
          switch (controller.rxRequestStatus.value) {
            case Status.loading:
              return const CustomLoader();
            case Status.internetError:
              return const CustomLoader();
            case Status.error:
              return GeneralErrorScreen(
                onTap: () {
                  controller.bookAppointmentCategory(catId: catId);
                },
              );

            case Status.completed:
              return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///================ cover photo ===================
                    CustomNetworkImage(
                      imageUrl:
                          "${ApiConstant.baseUrl}images/${controller.provider.coverPhoto}",
                      height: 180.h,
                      width: MediaQuery.of(context).size.width,
                    ),

                    SizedBox(
                      height: 16.h,
                    ),

                    ///========salon name =============
                    CustomText(
                        text: controller.providerName.value =
                            controller.provider.businessName.toString(),
                        fontWeight: FontWeight.w600),
                    const SizedBox(height: 12),

                    ///============ address =============
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            size: 16, color: AppColors.primaryOrange),
                        CustomText(
                          text: controller.address.value =
                              controller.provider.address.toString(),
                          fontSize: 14,
                          color: AppColors.paragraph,
                          left: 12,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    ///============= review =================
                    Row(
                      children: [
                        const Icon(Icons.star,
                            size: 16, color: AppColors.primaryOrange),
                        CustomText(
                          text:
                              "${controller.avgRating} (${controller.totalReview} Reviews)",
                          fontSize: 14,
                          left: 12,
                          color: AppColors.paragraph,
                        ),
                      ],
                    ),

                    ///============ choose service ==============
                    CustomText(
                        text: "Choose Your Services".tr,
                        fontWeight: FontWeight.w600,
                        top: 24,
                        bottom: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            text: "Service Type".tr,
                            fontWeight: FontWeight.w600),
                        CustomDropDown(
                            onChanged: (value) {
                              controller.serviceType.value = value!;
                              selectedService = value;

                              controller.selectedValues.clear();
                              controller.totalAMount = 0;
                              // controller.refresh();
                              controller.service.clear();
                              controller.finalOutput.clear();

                              debugPrint(
                                  "Service+++++++++++++++++++++++${controller.serviceType}");
                            },
                            title: "Select Service",
                            items: items,
                            dropdownKey: const ValueKey<int>(0),
                            selectedValue: selectedService),
                      ],
                    ),
                    const SizedBox(height: 16),

                    ///==============> service & cateLog ==================
                     if (controller.serviceType.value.isNotEmpty)

                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                            itemCount: controller.provider.services?.length,
                            itemBuilder: (context, index) {
                              controller.selectedValues
                                  .putIfAbsent(index, () => null);
                              return Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                        text: controller.provider
                                            .services![index].serviceName
                                            .toString(),
                                        fontWeight: FontWeight.w600),
                                    CustomDropDown(
                                      onChanged: (value) {
                                        if (controller.selectedValues[index] !=
                                            value) {
                                          controller.selectedValues[index] =
                                              value;

                                          controller.service.add({
                                            "service_id": controller
                                                .provider.services![index].id,
                                            "catalouge_id": controller.provider
                                                .services![index].catalog![0].id
                                          });

                                          String myValue =
                                              controller.selectedValues[index];
                                          String myValueFiltered = myValue
                                              .replaceAll(
                                                  RegExp(r'\b\d+\$'), '')
                                              .trim();

                                          for (int i = 0;
                                              i <
                                                  controller
                                                      .provider
                                                      .services![index]
                                                      .catalog!
                                                      .length;
                                              i++) {
                                            if (myValueFiltered ==
                                                controller
                                                    .provider
                                                    .services![index]
                                                    .catalog![i]
                                                    .catalogName!
                                                    .trim()) {
                                              int homeServicePrice = int.parse(
                                                  controller
                                                      .provider
                                                      .services![index]
                                                      .catalog![i]
                                                      .homeServiceCharge!);

                                              int salonServicePrice = int.parse(
                                                  controller
                                                      .provider
                                                      .services![index]
                                                      .catalog![i]
                                                      .salonServiceCharge!);

                                              if (controller
                                                      .serviceType.value ==
                                                  'Home Service') {
                                                controller.totalPrice(
                                                    price: homeServicePrice);
                                              } else {
                                                controller.totalPrice(
                                                    price: salonServicePrice);
                                              }

                                              selectedFilteredValue = controller
                                                  .selectedValues[index];

                                              // Break out of the loop once the price is calculated
                                              break;
                                            }
                                          }

                                          setState(() {});
                                        }
                                      },

                                      title: "Select Catalog",

                                      //============================Show Catelouge name and Price based on serviceType======================

                                      items: controller.serviceType.value ==
                                              'Home Service'
                                          ? controller.provider.services![index]
                                              .catalog!
                                              .map((catalog) =>
                                                  "${catalog.catalogName} ${catalog.homeServiceCharge}\$")
                                              .toList()
                                          : controller.provider.services![index]
                                              .catalog!
                                              .map((catalog) =>
                                                  "${catalog.catalogName} ${catalog.salonServiceCharge}\$")
                                              .toList(),

                                      selectedValue:
                                          controller.selectedValues[index],
                                      dropdownKey: ValueKey<int>(
                                          index), // Pass the selected value from the list
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),

                    /// ============= Service duration =================
                    const SizedBox(height: 24),
                    RowText(
                      maxLine: 2,
                        field: "Estimated Service Duration".tr,
                        value:
                            '${controller.serviceDuration.value = controller.provider.services![0].serviceDuration.toString()}  minutes',
                        color: AppColors.primaryOrange,
                        fontSize: 16),
                    const SizedBox(height: 12),

                    /// ============== total amount ===================
                    RowText(
                        field: "Total Amount".tr,
                        value:
                            "\$ ${controller.totalCharge.value = controller.totalAMount.toString()}",
                        color: AppColors.primaryOrange,
                        fontSize: 16),
                    const SizedBox(height: 12),

                    /// ============== Advance Booking Money =============
                    RowText(
                        field: "Advance Booking Money".tr,
                        value:
                            "\$ ${controller.advanceMoney.value = controller.calculatedPercentage(percentage: controller.parcentage.percentage!).toString()}",
                        color: AppColors.primaryOrange,
                        fontSize: 16),

                    /// =============== select date ================
                    CustomText(
                        text: "Select Date".tr,
                        fontWeight: FontWeight.w600,
                        top: 16,
                        bottom: 16),

                    GestureDetector(
                      onTap: () {
                        _selectDate(context);
                        print(
                            'Select Data=============${selectedDate.toLocal()}');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: AppColors.cardBgColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                                text: (controller.bookingTime.value = DateFormat('yMMMd').format(selectedDate.toLocal()))
                            ),
                            const CustomImage(
                              imageSrc: AppIcons.bookings,
                              size: 24,
                              imageColor: AppColors.white,
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///============== Available Services ============
                    CustomText(
                        text: "Available Slot ".tr,
                        fontWeight: FontWeight.w600,
                        top: 24,
                        bottom: 16),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 1,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 12,
                              mainAxisExtent: 36),
                      itemCount: timeList.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                            controller.time.value = timeList[index];
                            print(
                                'Available Slot=========== ${controller.time.value}');
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: currentIndex == index
                                ? AppColors.primaryOrange
                                : AppColors.bgColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: currentIndex == index
                                    ? Colors.transparent
                                    : AppColors.stroke,
                                width: 1,
                                style: BorderStyle.solid),
                          ),
                          child: Center(
                            child: CustomText(
                              text: timeList[index],
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    /// =============== booking confirm text ==================
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.error_outline,
                            color: AppColors.white, size: 20),
                        Flexible(
                          child: CustomText(
                            text:
                                "You have to pay the booking money to confirm your booking"
                                    .tr,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            maxLines: 2,
                            left: 8,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    /// =============== continue button =====================

                    CustomButton(
                      titleText: "Continue".tr,
                      onPressed: () {
                        if (controller.totalCharge.value == '0') {
                          toastMessage(message: 'Select a service');
                        } else {
                          Get.toNamed(AppRoute.bookingSummery);
                        }
                      },
                    ),
                  ],
                ),
              );
          }
        }),
      ),
    );
  }
}
