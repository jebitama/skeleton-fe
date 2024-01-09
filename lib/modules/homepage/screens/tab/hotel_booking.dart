import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skeleton/core/generated/assets.dart';
import 'package:skeleton/core/styles/app_color.dart';
import 'package:skeleton/core/styles/theme/theme_controller/theme_controller.dart';
import 'package:skeleton/core/widgets/app_button.dart';
import 'package:skeleton/core/widgets/app_custom_text.dart';
import 'package:skeleton/core/widgets/app_normal_textfield.dart';
import 'package:skeleton/core/widgets/app_select_textfield.dart';
import 'package:skeleton/core/widgets/app_sizebox.dart';
import 'package:skeleton/modules/homepage/controllers/home_controller.dart';
import 'package:skeleton/modules/homepage/screens/widgets/select_person.dart';

class HotelBooking extends StatefulWidget {
  const HotelBooking({super.key});

  @override
  State<HotelBooking> createState() => _HotelBookingState();
}

class _HotelBookingState extends State<HotelBooking> {
  HomepageController homeController = Get.find();
  ThemeController themeController = Get.find();
  final GlobalKey<FormState> hotelKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.h, right: 20.h, top: 24.h),
          child: Form(
            key: hotelKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0.h),
                  child: SelectDataTextField(
                    controller: homeController.homeHotelFromController,
                    icon: Assets.iconLocation,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                      primary:
                                          AppColor.primaryColor, // <-- SEE HERE
                                      onPrimary: AppColor
                                          .secondaryTextColor, // <-- SEE HERE
                                      onSurface: AppColor
                                          .primaryTextColor // <-- SEE HERE
                                      ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      iconColor: Colors.red,
                                      // button text color
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (pickedDate != null) {
                            // print(pickedDate);
                            homeController.startTime = pickedDate;
                            String formattedDate =
                                DateFormat('dd/MM/yyyy').format(pickedDate);
                            // print(formattedDate);
                            // print( 'home time ---> ${homeController.startTime}');

                            setState(() {
                              homeController.dateInputFrom.text = formattedDate;
                              homeController.departureFromController.text =
                                  homeController.dateInputFrom.text;
                              //set output date to TextField value.
                            });
                          } else {
                            // print("Date is not selected");
                          }
                          debugPrint(homeController.departureController.text);
                        },
                        child: AppNormalTextField(
                          controller: homeController.departureFromController,
                          labelText: 'From',
                          hintText: 'From',
                          enabled: false,
                          icon: Assets.iconCalender,
                        ),
                      ),
                    ),
                    AppSpace(
                      width: 20.h,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                      primary:
                                          AppColor.primaryColor, // <-- SEE HERE
                                      onPrimary: AppColor
                                          .secondaryTextColor, // <-- SEE HERE
                                      onSurface: AppColor
                                          .primaryTextColor // <-- SEE HERE
                                      ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      iconColor: Colors.red,
                                      // button text color
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (pickedDate != null) {
                            // print(pickedDate);
                            homeController.lastTime = pickedDate;
                            String formattedDate =
                                DateFormat('dd/MM/yyyy').format(pickedDate);
                            // print(formattedDate);
                            setState(() {
                              homeController.dateInputTo.text = formattedDate;
                              homeController.departureToController.text =
                                  homeController.dateInputTo.text;
                              //set output date to TextField value.
                            });
                          } else {
                            // print("Date is not selected");
                          }
                          debugPrint(homeController.departureController.text);
                        },
                        child: AppNormalTextField(
                          controller: homeController.departureToController,
                          labelText: 'To',
                          hintText: 'To',
                          enabled: false,
                          icon: Assets.iconCalender,
                        ),
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    //
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        // ignore: prefer_const_constructors
                        return SelectPerson();
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: themeController.isDarkMode()
                          ? AppColor.lightContainer
                          : AppColor.secondaryTextColor,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: themeController.isDarkMode()
                            ? AppColor.secondaryTextColor
                            : AppColor.grey30,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.h),
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.iconProfile,
                            height: 24.h,
                            color: themeController.isDarkMode()
                                ? AppColor.grey50
                                : AppColor.primaryTextColor,
                          ),
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(left: 8.h),
                                child: GetBuilder<HomepageController>(
                                  builder: (controller) {
                                    return homeController.personSelect
                                        ? CustomText(
                                            fontWeight: FontWeight.w400,
                                            textAlign: TextAlign.start,
                                            textColor: themeController
                                                    .isDarkMode()
                                                ? AppColor.secondaryTextColor
                                                : AppColor.primaryTextColor,
                                            fontSize: 16.sp,
                                            text:
                                                '${homeController.rooms} Rooms, ${homeController.adults} Adults ${homeController.children} Children',
                                          )
                                        : CustomText(
                                            text: 'Person',
                                            fontSize: 16.sp,
                                            textColor: themeController
                                                    .isDarkMode()
                                                ? AppColor.secondaryTextColor
                                                : AppColor.grey50,
                                            textAlign: TextAlign.start,
                                            fontWeight: FontWeight.w400,
                                          );
                                  },
                                  init: HomepageController(),
                                )),
                          ),
                          homeController.personSelect
                              ? const SizedBox()
                              : Image.asset(
                                  Assets.iconDownarrow,
                                  height: 24.h,
                                )
                        ],
                      ),
                    ),
                  ),
                ),
                AppSpace(
                  height: 30.h,
                ),
                GestureDetector(
                  onTap: () {
                    if (hotelKey.currentState!.validate()) {
                      // CommonMethod.sendToNextScreen(
                      //   context,
                      //   Routes.searchHotel,
                      // );
                      // homeController.update();
                      // homeController.fromController.clear();
                      // homeController.homeHotelFromController.clear();
                      // homeController.toController.clear();
                      // homeController.departureFromController.clear();
                      // homeController.departureToController.clear();
                    }
                  },
                  child: AppButton(
                    buttonText: 'Search hotels',
                    fontSize: 18.sp,
                    buttonTextColor: AppColor.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
