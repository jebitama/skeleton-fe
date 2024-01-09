import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeleton/core/generated/assets.dart';
import 'package:skeleton/core/styles/app_color.dart';
import 'package:skeleton/core/styles/theme/app_theme.dart';
import 'package:skeleton/core/styles/theme/theme_controller/theme_controller.dart';
import 'package:skeleton/core/widgets/app_custom_text.dart';
import 'package:skeleton/core/widgets/bookmark_button.dart';
import 'package:skeleton/modules/homepage/models/special_offer_model.dart';

class SpecialOfferDetailsContainer extends StatefulWidget {
  final String? image;
  final String? price;
  final String? offer;
  final String? place;
  final String? placeLocation;
  final SpecialOfferModel model;
  const SpecialOfferDetailsContainer(
      {super.key,
      this.image,
      this.price,
      this.offer,
      this.place,
      this.placeLocation,
      required this.model});

  @override
  State<SpecialOfferDetailsContainer> createState() =>
      _SpecialOfferDetailsContainerState();
}

class _SpecialOfferDetailsContainerState
    extends State<SpecialOfferDetailsContainer> {
  ThemeController themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 261.h,
      width: 268.h,
      decoration: BoxDecoration(
        color: themeController.isDarkMode()
            ? AppColor.lightContainer
            : AppColor.lightGrey,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 153.h,
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
                  child: Image.asset(
                    widget.image ?? Assets.imagesSpone,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColor.blackLight,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.h, vertical: 4.h),
                      child: CustomText(
                        text: widget.offer ?? '20%Off',
                        textAlign: TextAlign.center,
                        textColor: AppColor.secondaryTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: EdgeInsets.all(8.h),
                      child: BookmarkButton(
                        cartModel: widget.model,
                      )),
                ),
              ],
            ),
            CustomText(
              text: widget.place ?? 'Preston rendal, Maine ',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              textColor:
                  AppTheme.getColorsTheme(context).textTheme.titleMedium!.color,
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2.h),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5.h),
                    child: Image.asset(
                      Assets.iconLocation,
                      height: 16.h,
                    ),
                  ),
                  Expanded(
                    child: CustomText(
                      text: widget.placeLocation ?? 'Dubai, abudhabi',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      maxLines: 1,
                      textColor: AppColor.grey50,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            CustomText(
              text: widget.price ?? '\$200.00',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              textColor:
                  AppTheme.getColorsTheme(context).textTheme.titleMedium!.color,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
