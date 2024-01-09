import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeleton/core/generated/assets.dart';
// import 'package:skeleton/core/routes/common_method.dart';
import 'package:skeleton/core/styles/app_color.dart';
import 'package:skeleton/core/styles/theme/app_theme.dart';
import 'package:skeleton/core/styles/theme/theme_controller/theme_controller.dart';
import 'package:skeleton/core/utils/constant/app_string.dart';
import 'package:skeleton/core/widgets/app_custom_text.dart';
import 'package:skeleton/core/widgets/app_sizebox.dart';
import 'package:skeleton/core/widgets/bookmark_button.dart';
import 'package:skeleton/modules/bookmark/controllers/bookmark_controller.dart';
import 'package:skeleton/modules/homepage/models/special_offer_model.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  BookmarkController bookmarkController = Get.find();
  ThemeController themeController = Get.find();

  @override
  void initState() {
    bookmarkController.update();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Row(
                children: [
                  CustomText(
                    text: AppText.bookmark,
                    textColor: AppTheme.getColorsTheme(context)
                        .textTheme
                        .titleMedium!
                        .color,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GetBuilder<BookmarkController>(
              builder: (controller) {
                return AppColor.fav.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.imagesWishlistNull,
                            height: 100.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 24.h, bottom: 16.h),
                            child: CustomText(
                              text: AppText.nFY,
                              textColor: themeController.isDarkMode()
                                  ? AppColor.secondaryTextColor
                                  : AppColor.primaryTextColor,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w700,
                              fontSize: 22.sp,
                            ),
                          ),
                          CustomText(
                            text: AppText.sP,
                            textColor: themeController.isDarkMode()
                                ? AppColor.secondaryTextColor
                                : AppColor.primaryTextColor,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ],
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.only(top: 16.h),
                        itemCount: AppColor.fav.length,
                        itemBuilder: (context, index) {
                          String s = AppColor.fav[index];
                          SpecialOfferModel model =
                              SpecialOfferModel.fromJson(jsonDecode(s));
                          // print('Product Image --> ${model.image}');
                          return GestureDetector(
                            onTap: () {
                              // CommonMethod.sendToNextScreen(
                              //     context, Routes.hotelDetailsScreen,
                              //     arg: model);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 16.h),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: themeController.isDarkMode()
                                      ? AppColor.lightContainer
                                      : AppColor.lightGrey,
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Image.asset('specialOfferModel.image!'),
                                      Stack(
                                        children: [
                                          Container(
                                              height: 152.h,
                                              width: double.infinity,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.r),
                                              ),
                                              child: Image.asset(
                                                model.image!,
                                                fit: BoxFit.cover,
                                                height: 152.h,
                                                width: double.infinity,
                                              )),
                                          model.offer == null
                                              ? const AppSpace()
                                              : Padding(
                                                  padding: EdgeInsets.all(8.h),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColor.blackLight,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.r),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 6.h,
                                                              vertical: 3.h),
                                                      child: CustomText(
                                                        text: model.offer ?? '',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 13.sp,
                                                        textAlign:
                                                            TextAlign.center,
                                                        textColor: AppColor
                                                            .secondaryTextColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding: EdgeInsets.all(8.h),
                                              child: BookmarkButton(
                                                conHeight: 24.h,
                                                cartModel: model,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.h),
                                        child: CustomText(
                                          text: model.place,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          textColor:
                                              themeController.isDarkMode()
                                                  ? AppColor.secondaryTextColor
                                                  : AppColor.primaryTextColor,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 4.h),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              Assets.iconLocation,
                                              height: 16.h,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 5.h),
                                              child: CustomText(
                                                text: model.placeLocation,
                                                textAlign: TextAlign.start,
                                                textColor:
                                                    themeController.isDarkMode()
                                                        ? AppColor
                                                            .secondaryTextColor
                                                        : AppColor.grey50,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      CustomText(
                                        text: model.price,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        textColor: themeController.isDarkMode()
                                            ? AppColor.secondaryTextColor
                                            : AppColor.primaryTextColor,
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
              },
              init: BookmarkController(),
            ),
          ),
        ],
      ),
    );
  }
}
