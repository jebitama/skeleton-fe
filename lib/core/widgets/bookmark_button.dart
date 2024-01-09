import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeleton/core/generated/assets.dart';
import 'package:skeleton/core/styles/app_color.dart';
import 'package:skeleton/modules/bookmark/controllers/bookmark_controller.dart';
import 'package:skeleton/modules/homepage/models/special_offer_model.dart';

class BookmarkButton extends StatefulWidget {
  final double? conHeight;
  final double? conWidth;
  final double? conPaddingAll;
  final SpecialOfferModel? cartModel;
  const BookmarkButton({
    super.key,
    this.conHeight,
    this.conWidth,
    this.conPaddingAll,
    this.cartModel,
  });

  @override
  State<BookmarkButton> createState() => _FevButtonState();
}

class _FevButtonState extends State<BookmarkButton> {
  BookmarkController bookmarkController = Get.put(BookmarkController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    AppColor.fav = await bookmarkController.getData() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookmarkController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.isPressed = !controller.isPressed;
            controller.update();
            SpecialOfferModel model = widget.cartModel!;
            if (!AppColor.fav.contains(jsonEncode(model))) {
              AppColor.fav.add(jsonEncode(model));
            } else {
              AppColor.fav.remove(jsonEncode(model));
            }
            bookmarkController.setData(AppColor.fav);
          },
          child: Container(
            height: widget.conHeight ?? 24.h,
            width: widget.conWidth ?? 24.h,
            decoration: BoxDecoration(
              color: AppColor.blackLight,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(widget.conPaddingAll ?? 4.h),
              child: !AppColor.fav.contains(jsonEncode(widget.cartModel))
                  ? Image.asset(
                      Assets.iconLike,
                      color: AppColor.secondaryTextColor,
                    )
                  : Image.asset(
                      Assets.iconLikebold,
                      color: AppColor.secondaryTextColor,
                    ),
            ),
          ),
        );
      },
      init: BookmarkController(),
    );
  }
}
