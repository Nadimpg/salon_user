import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_icons.dart';
import 'package:barber_user_app/view/screen/reschedule_appoinment/reschedule_appoinment_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReScheduleAppointment extends StatefulWidget {
  const ReScheduleAppointment({super.key});

  @override
  State<ReScheduleAppointment> createState() => _ReScheduleAppointmentState();
}

class _ReScheduleAppointmentState extends State<ReScheduleAppointment> {
  RescheduleAppointMentController controller=Get.find<RescheduleAppointMentController>();
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
  var id=Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
          appBarContent: CustomBack(text: "Re-Schedule Appointment".tr),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ///============= select date ==============
              CustomText(
                  text: "Select Date".tr,
                  fontWeight: FontWeight.w600,
                  bottom: 16),
              GestureDetector(
                onTap: () {
                  _selectDate(context);
                  print('available slot ++++++++++++++ ${selectedDate.toLocal()}');
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
                          text: "${selectedDate.toLocal()}".split(' ')[0]),
                      const CustomImage(
                        imageSrc: AppIcons.bookings,
                        size: 24,
                        imageColor: AppColors.white,
                      ),
                    ],
                  ),
                ),
              ),
              CustomText(
                  text: "Available Slot ".tr,
                  fontWeight: FontWeight.w600,
                  top: 24,
                  bottom: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                      controller.time.value=timeList[index];
                      print('available slot ++++++++++++++ ${timeList[index]}');
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
            ],
          ),
        ),
        bottomNavigationBar:controller.isLoading?const  CustomLoader(): GetBuilder<RescheduleAppointMentController>(
          builder: (controller) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child:controller.isLoading? CustomLoader(): CustomButton(
                titleText: "Continue".tr,
                onPressed: () {
                  print('id++++++++++++++++ $id');
                  controller.reSchedule(id: id.toString(), date: selectedDate.toLocal().toString(), time: controller.time.value);
                },
              ),
            );
          }
        ),
      ),
    );
  }
}
