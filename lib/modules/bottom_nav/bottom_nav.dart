import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeleton/core/di/homepage_module.dart';
// import 'package:skeleton/core/di/dependencies.dart';
import 'package:skeleton/core/generated/assets.dart';
import 'package:skeleton/core/styles/app_color.dart';
import 'package:skeleton/core/styles/theme/theme_controller/theme_controller.dart';
import 'package:skeleton/core/widgets/app_button.dart';
import 'package:skeleton/core/widgets/app_custom_text.dart';
import 'package:skeleton/modules/account/account_screen.dart';
import 'package:skeleton/modules/bookmark/bookmark_screen.dart';
import 'package:skeleton/modules/bottom_nav/widgets/bottom_bar.dart';
import 'package:skeleton/modules/explore/explore_screen.dart';
import 'package:skeleton/modules/homepage/homepage_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  // int currentIndex = 0;

  HomepageModule homepageModule = Get.find();
  List<Widget> screenList = [
    const HomepageScreen(),
    const ExploreScreen(),
    const BookmarkScreen(),
    const AccountScreen(),
  ];

  int currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      // bottomBarController.setIndex(index);

      // bottomBarController.update();
      currentIndex = index;
      //  bottomBarController.c
    });
  }

  ThemeController themeController = Get.find();

  @override
  void initState() {
    if (kDebugMode) {
      print('bottom nav loaded');
    }
    // initiate homepage module
    homepageModule.dependencies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarVacabaItem> bottomBarItem = [
      BottomNavigationBarVacabaItem(
        activeIcon: Assets.iconSHome,
        icon: Assets.iconHome,
        txt: 'Home',
        onTap: () {
          setState(() {
            currentIndex = 0;
            //  bottomBarController.c
          });
        },
        colorIcon: AppColor.primaryColor,
      ),
      BottomNavigationBarVacabaItem(
        activeIcon: Assets.iconSBooking,
        icon: Assets.iconBooking,
        txt: 'Explore',
        onTap: () {
          setState(() {
            currentIndex = 1;
            //  bottomBarController.c
          });
        },
        colorIcon: AppColor.primaryColor,
      ),
      BottomNavigationBarVacabaItem(
        activeIcon: Assets.iconSBooking,
        icon: Assets.iconBooking,
        show: false,
        txt: 'Scan QR',
        onTap: () {},
        colorIcon: AppColor.primaryColor,
      ),
      BottomNavigationBarVacabaItem(
        activeIcon: Assets.iconSLike,
        icon: Assets.iconLike,
        txt: 'Bookmark',
        onTap: () {
          setState(() {
            currentIndex = 2;
            //  bottomBarController.c
          });
        },
        colorIcon: AppColor.primaryColor,
      ),
      BottomNavigationBarVacabaItem(
        activeIcon: Assets.iconSProfile,
        icon: Assets.iconProfile,
        txt: 'Account',
        onTap: () {
          setState(() {
            currentIndex = 3;
            //  bottomBarController.c
          });
        },
        colorIcon: AppColor.primaryColor,
      ),
    ];
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      builder: (controller) {
        return WillPopScope(
          onWillPop: () {
            if (currentIndex == 0) {
              {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    backgroundColor: themeController.isDarkMode()
                        ? AppColor.darkContainer
                        : AppColor.secondaryTextColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.r))),
                    insetPadding: EdgeInsets.symmetric(horizontal: 15.h),
                    title: Column(
                      children: [
                        Image.asset(
                          Assets.imagesExit,
                          height: 100.h,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 45.h),
                          child: Text(
                            'Sure ! You Want Exit',
                            style: TextStyle(
                              color: themeController.isDarkMode()
                                  ? AppColor.secondaryTextColor
                                  : AppColor.primaryTextColor,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                    actions: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: 10.h, left: 5.h, right: 5.h),
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.r),
                                      border: Border.all(
                                        color: AppColor.primaryColor,
                                        width: 1.5.h,
                                      )),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 14.h),
                                    child: Center(
                                      child: CustomText(
                                        text: 'No',
                                        textColor: AppColor.primaryColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: 10.h, left: 5.h, right: 5.h),
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: AppButton(
                                  buttonTextColor: AppColor.secondaryTextColor,
                                  buttonText: 'Yes',
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }
            } else {
              currentIndex = 0;
            }
            return Future(() => false);
          },
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              heroTag: 'BarcodeScanner',
              // Text('SD-24'),
              backgroundColor: AppColor.primaryColor,
              onPressed: () {},
              child: Image.asset(
                Assets.iconCamera,
                color: Colors.white,
                width: 37,
              ),
            ),
            extendBody: true,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: SafeArea(
              child: Center(
                child: screenList.elementAt(currentIndex),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              elevation: 5,
              shape: const CircularNotchedRectangle(),
              // showSelectedLabels: true,
              // showUnselectedLabels: true,
              // backgroundColor: themeController.isDarkMode()
              //     ? AppColor.lightContainer
              //     : AppColor.secondaryTextColor,
              // unselectedItemColor: themeController.isDarkMode()
              //     ? Colors.transparent
              //     : AppColor.secondaryTextColor,
              // selectedIconTheme: IconThemeData(
              //   size: 22.h,
              //   color: Colors.white,
              // ),
              // unselectedIconTheme: IconThemeData(
              //   color: AppColor.grey50,
              //   size: 22.h,
              // ),
              // type: BottomNavigationBarType.fixed,
              // currentIndex: currentIndex,
              // selectedItemColor: AppColor.primaryColor,
              // selectedLabelStyle: TextStyle(
              //   color: AppColor.primaryColor,
              //   fontSize: 14.sp,
              //   fontWeight: FontWeight.w400,
              // ),
              // unselectedLabelStyle: TextStyle(
              //   color: themeController.isDarkMode()
              //       ? AppColor.darkContainer
              //       : AppColor.secondaryTextColor,
              //   fontSize: 14.sp,
              //   fontWeight: FontWeight.w400,
              // ),
              // iconSize: 00
              // onTap: onItemTapped,
              // elevation: 100.h,
              // items: <BottomNavigationBarItem>[
              //   BottomNavigationBarItem(
              //     // ignore: avoid_unnecessary_containers
              //     activeIcon: Container(
              //       child: Container(
              //         height: 40.h,
              //         width: 40.w,
              //         decoration: BoxDecoration(
              //           color: AppColor.primaryLight,
              //           shape: BoxShape.circle,
              //         ),
              //         child: Padding(
              //           padding: EdgeInsets.all(8.h),
              //           child: Image.asset(
              //             Assets.iconSHome,
              //             color: AppColor.primaryColor,
              //           ),
              //         ),
              //       ),
              //     ),

              //     icon: const ImageIcon(AssetImage(Assets.iconHome)),
              //     label: 'Home',
              //   ),
              //   BottomNavigationBarItem(
              //     activeIcon: Container(
              //       height: 40.h,
              //       width: 40.w,
              //       decoration: BoxDecoration(
              //         color: AppColor.primaryLight,
              //         shape: BoxShape.circle,
              //       ),
              //       child: Padding(
              //         padding: EdgeInsets.all(8.h),
              //         child: Image.asset(
              //           Assets.iconSBooking,
              //           color: AppColor.primaryColor,
              //         ),
              //       ),
              //     ),
              //     icon: const ImageIcon(AssetImage(Assets.iconBooking)),
              //     label: 'Explore',
              //   ),
              //   BottomNavigationBarItem(
              //     activeIcon: Container(
              //       height: 40.h,
              //       width: 40.w,
              //       decoration: BoxDecoration(
              //         color: AppColor.primaryLight,
              //         shape: BoxShape.circle,
              //       ),
              //       child: Padding(
              //         padding: EdgeInsets.all(8.h),
              //         child: Image.asset(
              //           Assets.iconSLike,
              //           color: AppColor.primaryColor,
              //         ),
              //       ),
              //     ),
              //     icon: const ImageIcon(AssetImage(Assets.iconLike)),
              //     label: 'Bookmark',
              //   ),
              //   BottomNavigationBarItem(
              //     activeIcon: Container(
              //       height: 40.h,
              //       width: 40.w,
              //       decoration: BoxDecoration(
              //         color: AppColor.primaryLight,
              //         shape: BoxShape.circle,
              //       ),
              //       child: Padding(
              //         padding: EdgeInsets.all(8.h),
              //         child: Image.asset(
              //           Assets.iconSProfile,
              //           color: AppColor.primaryColor,
              //         ),
              //       ),
              //     ),
              //     icon: const ImageIcon(AssetImage(Assets.iconProfile)),
              //     label: 'Account',
              //   ),
              // ],
              child: BottomNavigationBarVacaba(
                color: themeController.isDarkMode()
                    ? Colors.transparent
                    : AppColor.grey50,
                activeColor: AppColor.primaryColor,
                items: bottomBarItem,
              ),
              // ),
            ),
          ),
        );
      },
    );
  }
}
