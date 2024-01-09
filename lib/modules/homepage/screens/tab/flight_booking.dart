// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skeleton/core/generated/assets.dart';
import 'package:skeleton/core/styles/app_color.dart';
import 'package:skeleton/core/styles/theme/theme_controller/theme_controller.dart';
import 'package:skeleton/core/utils/constant/app_string.dart';
import 'package:skeleton/core/widgets/app_button.dart';
import 'package:skeleton/core/widgets/app_normal_textfield.dart';
import 'package:skeleton/core/widgets/app_select_textfield.dart';
import 'package:skeleton/core/widgets/app_sizebox.dart';
import 'package:skeleton/modules/homepage/controllers/home_controller.dart';

class FlightBooking extends StatefulWidget {
  const FlightBooking({super.key});

  @override
  State<FlightBooking> createState() => _FlightBookingState();
}

class _FlightBookingState extends State<FlightBooking>
    with SingleTickerProviderStateMixin {
  HomepageController homeController = Get.find();
  ThemeController themeController = Get.find();

  int way = 0;
  final GlobalKey<FormState> flightKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5.h, top: 5.h, bottom: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: AppColor.grey40,
                ),
                child: Radio(
                  activeColor: AppColor.primaryColor,
                  value: 0,
                  groupValue: way,
                  onChanged: (values) {
                    setState(() {
                      way = values!;
                      debugPrint('Wayy is  --->$way');
                    });
                  },
                ),
              ),
              Text(
                AppText.oneWay,
                style: TextStyle(
                  color: themeController.isDarkMode()
                      ? AppColor.secondaryTextColor
                      : AppColor.primaryTextColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              AppSpace(
                width: 10.h,
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: AppColor.grey40,
                ),
                child: Radio(
                  activeColor: AppColor.primaryColor,
                  value: 1,
                  groupValue: way,
                  onChanged: (values) {
                    setState(() {
                      way = values!;
                      debugPrint(way.toString());
                    });
                  },
                ),
              ),
              Text(
                AppText.roundway,
                style: TextStyle(
                  color: themeController.isDarkMode()
                      ? AppColor.secondaryTextColor
                      : AppColor.primaryTextColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Form(
                key: flightKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    SelectDataTextField(
                      controller: homeController.fromController,
                    ),
                    SelectDataTextField(
                      controller: homeController.toController,
                      labelText: 'To',
                      hintText: 'To',
                      icon: Assets.iconIconto,
                    ),
                    way == 0
                        ? GestureDetector(
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
                                          primary: AppColor
                                              .primaryColor, // <-- SEE HERE
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
                                print(pickedDate);
                                String formattedDate =
                                    DateFormat('dd/MM/yyyy').format(pickedDate);
                                print(formattedDate);
                                setState(() {
                                  homeController.dateInput.text = formattedDate;
                                  homeController.departureController.text =
                                      homeController.dateInput.text;
                                  //set output date to TextField value.
                                });
                              } else {
                                // print("Date is not selected");
                              }
                              debugPrint(
                                  homeController.departureController.text);
                            },
                            child: AppNormalTextField(
                              controller: homeController.departureController,
                              enabled: false,
                              labelText: 'Departure',
                              hintText: 'Departure',
                              icon: Assets.iconCalender,
                            ),
                          )
                        : Row(
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
                                                primary: AppColor
                                                    .primaryColor, // <-- SEE HERE
                                                onPrimary: AppColor
                                                    .secondaryTextColor, // <-- SEE HERE
                                                onSurface: AppColor
                                                    .primaryTextColor // <-- SEE HERE
                                                ),
                                            textButtonTheme:
                                                TextButtonThemeData(
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
                                      String formattedDate =
                                          DateFormat('dd/MM/yyyy')
                                              .format(pickedDate);
                                      // print(formattedDate);
                                      homeController.startTime = pickedDate;
                                      setState(() {
                                        homeController.dateInputFrom.text =
                                            formattedDate;
                                        homeController
                                                .departureFromController.text =
                                            homeController.dateInputFrom.text;
                                        homeController.update();
                                        //set output date to TextField value.
                                      });
                                    } else {
                                      // print("Date is not selected");
                                    }
                                    debugPrint(homeController
                                        .departureController.text);
                                  },
                                  child: AppNormalTextField(
                                    controller:
                                        homeController.departureFromController,
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
                                      firstDate: DateTime.now()
                                          .subtract(const Duration(days: 30)),
                                      lastDate: DateTime(2400),
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme: ColorScheme.light(
                                                primary: AppColor
                                                    .primaryColor, // <-- SEE HERE
                                                onPrimary: AppColor
                                                    .secondaryTextColor, // <-- SEE HERE
                                                onSurface: AppColor
                                                    .primaryTextColor // <-- SEE HERE
                                                ),
                                            textButtonTheme:
                                                TextButtonThemeData(
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
                                      String formattedDate =
                                          DateFormat('dd/MM/yyyy')
                                              .format(pickedDate);
                                      // print(formattedDate);
                                      setState(() {
                                        homeController.dateInputTo.text =
                                            formattedDate;
                                        homeController
                                                .departureToController.text =
                                            homeController.dateInputTo.text;
                                        //set output date to TextField value.
                                      });
                                    } else {
                                      // print("Date is not selected");
                                    }
                                    debugPrint(homeController
                                        .departureController.text);
                                  },
                                  child: AppNormalTextField(
                                    controller:
                                        homeController.departureToController,
                                    labelText: 'To',
                                    hintText: 'To',
                                    enabled: false,
                                    icon: Assets.iconCalender,
                                  ),
                                ),
                              )
                            ],
                          ),
                    AppNormalTextField(
                      controller: homeController.passengerController,
                      validatorError: 'Enter valid Amount of Passenger',
                      labelText: 'Passenger',
                      hintText: 'Passenger',
                      icon: Assets.iconProfile,
                      keyboardType: TextInputType.number,
                      inputAction: TextInputAction.done,
                    ),
                    AppSpace(
                      height: 15.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        // if (flightKey.currentState!.validate()) {
                        //   CommonMethod.sendToNextScreen(
                        //       context, Routes.flightScreen);
                        //   homeController.fromController.clear();
                        //   homeController.toController.clear();
                        //   homeController.departureFromController.clear();
                        //   homeController.departureToController.clear();
                        //   homeController.departureController.clear();
                        //   homeController.passengerController.clear();
                        // }
                      },
                      child: AppButton(
                        buttonText: AppText.searchFlight,
                        fontSize: 18.sp,
                        buttonTextColor: AppColor.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 35.h, top: 45.h),
                child: GestureDetector(
                  onTap: () {
                    homeController.swapValues();
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.h),
                    height: 48.h,
                    width: 48.h,
                    decoration: BoxDecoration(
                        color: AppColor.secondaryTextColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColor.grey40,
                        )),
                    child: Image.asset(
                      Assets.iconSwap,
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
