import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/view/screen/book_appointmenmt/book_appointment_controller.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown(
      {super.key,
      required this.title,
      required this.items,
      this.selectedValue,
      required this.onChanged,
      required this.dropdownKey});

  final String title;
  final List<String?> items;
  final String? selectedValue;

  final Key dropdownKey;

  final Function(String?)? onChanged;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  BookAppoinmentController controller = Get.put(BookAppoinmentController());
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      key: widget.key,
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Row(
          children: [
            Expanded(
              child: CustomText(
                text: widget.title,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        items: widget.items.map<DropdownMenuItem<String>>((String? item) {
          return DropdownMenuItem<String>(
            value: item,
            child: CustomText(
              text: item!,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          );
        }).toList(),

        value: widget.selectedValue,
        onChanged: widget.onChanged,

        // onChanged: (String? value) {
        //   setState(() {
        //     widget.selectedValue = value;
        //     print("catelog Saloncharge================  ${controller.provider.services![0].catalog![0].salonServiceCharge}");
        //     print("catelog Homecharge================  ${controller.provider.services![0].catalog![0].homeServiceCharge}");
        //     // controller.totalPrize();
        //   });
        // },
        buttonStyleData: ButtonStyleData(
          height: 44.h,
          width: 150.w,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.stroke,
            ),
            color: AppColors.cardBgColor,
          ),
          elevation: 2,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.keyboard_arrow_down_outlined),
          iconSize: 16,
          iconEnabledColor: AppColors.white,
          iconDisabledColor: AppColors.paragraph,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: AppColors.cardBgColor,
          ),
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 36,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
