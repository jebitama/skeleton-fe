import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeleton/core/di/dependencies.dart';
import 'package:skeleton/core/generated/assets.dart';
// import 'package:skeleton/core/routes/common_method.dart';
import 'package:skeleton/core/styles/app_color.dart';
import 'package:skeleton/core/styles/theme/app_theme.dart';
import 'package:skeleton/core/styles/theme/theme_controller/theme_controller.dart';
import 'package:skeleton/core/utils/constant/app_string.dart';
import 'package:skeleton/core/widgets/app_custom_text.dart';
import 'package:skeleton/core/widgets/app_sizebox.dart';
import 'package:skeleton/modules/bottom_nav/controllers/bottom_bar_controller.dart';
import 'package:skeleton/modules/homepage/controllers/home_controller.dart';
import 'package:skeleton/modules/homepage/models/special_offer_model.dart';
import 'package:skeleton/modules/homepage/screens/widgets/special_offer_details_container.dart';
import 'package:skeleton/modules/homepage/screens/tab/flight_booking.dart';
import 'package:skeleton/modules/homepage/screens/tab/hotel_booking.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomepageScreen>
    with SingleTickerProviderStateMixin {
  PageController pageController = PageController();
  HomepageController homeController = Get.find();
  BottomNavController bottomBarController = Get.find();
  ThemeController themeController = Get.find();
  int currentIndex = 0;
  List tabClass = [
    const FlightBooking(),
    const HotelBooking(),
  ];

  @override
  void initState() {
    homeController;
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  late TabController _tabController;

  @override
  void dispose() {
    homeController;
    homeController.fromController.text;
    homeController.toController.text;
    homeController.passengerController.text;
    homeController.dateInput;
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomepageController>(
      init: HomepageController(),
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          appBar(),
          AppSpace(
            height: 16.h,
          ),
          Expanded(
              child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              tabBar(),
              tabClass[controller.currentPage],
              Padding(
                padding: EdgeInsets.only(left: 20.h, right: 20.h, top: 12.h),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: AppText.specialOffer,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        textColor: AppTheme.getColorsTheme(context)
                            .textTheme
                            .titleMedium!
                            .color,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // CommonMethod.sendToNextScreen(
                        //     context, Routes.specialOfferScreen);
                      },
                      child: CustomText(
                        text: AppText.viewAll,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        textColor: themeController.isDarkMode()
                            ? AppColor.secondaryTextColor
                            : AppColor.grey50,
                      ),
                    )
                  ],
                ),
              ),
              hotelSpecialOffer(),
              AppSpace(
                height: 24.h,
              ),
              banner(),
              AppSpace(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.h, right: 20.h, top: 12.h),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: AppText.blog,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        textColor: AppTheme.getColorsTheme(context)
                            .textTheme
                            .titleMedium!
                            .color,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // CommonMethod.sendToNextScreen(
                        //     context, Routes.blogScreen);
                      },
                      child: CustomText(
                        text: AppText.viewAll,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        textColor: themeController.isDarkMode()
                            ? AppColor.secondaryTextColor
                            : AppColor.grey50,
                      ),
                    ),
                  ],
                ),
              ),
              // blogList(),
            ],
          ))
        ],
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, left: 20.h, right: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 245.h,
            child: CustomText(
              text: AppText.appMotive,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.start,
              textColor:
                  AppTheme.getColorsTheme(context).textTheme.titleMedium!.color,
            ),
          ),
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    // CommonMethod.sendToNextScreen(
                    //     context, Routes.searchScreen);
                  },
                  child: Image.asset(
                    Assets.iconSearch,
                    height: 24.h,
                    color: AppTheme.getColorsTheme(context)
                        .textTheme
                        .titleMedium!
                        .color,
                  )),
              AppSpace(
                width: 16.h,
              ),
              GestureDetector(
                  onTap: () {
                    // CommonMethod.sendToNextScreen(
                    //     context, Routes.notificationScreen);
                  },
                  child: Image.asset(
                    Assets.iconNotification,
                    height: 24.h,
                    color: AppTheme.getColorsTheme(context)
                        .textTheme
                        .titleMedium!
                        .color,
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget tabBar() {
    return GetBuilder<HomepageController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Container(
            decoration: BoxDecoration(
                color: themeController.isDarkMode()
                    ? AppColor.lightContainer
                    : AppColor.lightGrey,
                borderRadius: BorderRadius.circular(18.r)),
            child: TabBar(
              controller: _tabController,
              onTap: (value) {
                controller.setCurrentPageIndex(value);
                homeController.isPressed = !homeController.isPressed;
                // print('Tab bar is clicked ${homeController.isPressed}');
              },
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: AppColor.primaryColor,
              ),
              unselectedLabelColor: AppColor.grey50,
              labelColor: AppColor.primaryColor,
              indicatorPadding: EdgeInsets.all(
                5.h,
              ),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r), // Creates border
                color: themeController.isDarkMode()
                    ? AppColor.lightContainer
                    : AppColor.secondaryTextColor,
              ),
              tabs: [
                Tab(
                  child: Text(
                    AppText.flightBooking,
                    style: TextStyle(
                      // color: AppColor.primaryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Tab(
                  child: Text(
                    AppText.hotelBooking,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        );
      },
      init: HomepageController(),
    );
  }

  Widget hotelSpecialOffer() {
    return SizedBox(
      height: 261.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // CommonMethod.sendToNextScreen(
              //     context, Routes.hotelDetailsScreen,
              //     arg: specialOffer[index]);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 20.h, top: 16.h),
              child: SpecialOfferDetailsContainer(
                model: specialOffer[index],
                image: specialOffer[index].image,
                offer: specialOffer[index].offer,
                price: specialOffer[index].price,
                place: specialOffer[index].place,
                placeLocation: specialOffer[index].placeLocation,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget banner() {
    return GestureDetector(
        onTap: () {
          currentIndex = 1;
          bottomBarController.update();
        },
        child: Image.asset(Assets.imagesAppbanner));
  }

  Widget blogList() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: SizedBox(
        height: 275.h,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.only(left: 20.h, top: 0.h),
                child: GestureDetector(
                  onTap: () {
                    // CommonMethod.sendToNextScreen(
                    //   context,
                    //   Routes.blogDetailsScreen,
                    //   arg: blogData[index],
                    // );
                  },
                  // child: BlogContentContainer(
                  //   image: blogData[index].image,
                  //   blogTitle: blogData[index].title,
                  //   blogDiscription: blogData[index].discription,
                  //   date: blogData[index].date,
                  // ),
                ));
          },
        ),
      ),
    );
  }
}
