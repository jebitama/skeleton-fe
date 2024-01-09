import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeleton/core/routes/common_method.dart';
import 'package:skeleton/core/routes/route_path.dart';
import 'package:skeleton/core/styles/app_color.dart';
import 'package:skeleton/core/utils/constant/app_string.dart';
import 'package:skeleton/core/widgets/app_button.dart';
import 'package:skeleton/modules/onboarding/controllers/page_view_controller.dart';
import 'package:skeleton/modules/onboarding/models/onboarding_model.dart';
import 'package:skeleton/modules/onboarding/onboarding_screen.dart';
import 'package:skeleton/modules/onboarding/services/onboarding_service.dart';

class OnboardingPageScreen extends StatefulWidget {
  const OnboardingPageScreen({super.key});

  @override
  State<OnboardingPageScreen> createState() => _OnboardingPageScreenState();
}

class _OnboardingPageScreenState extends State<OnboardingPageScreen> {
  PageViewController pageViewController = Get.put(PageViewController());
  final OnboardingService _onboardingService = OnboardingService();

  // @override
  // void dispose() {
  //   pageViewController.pageController.dispose();
  //   super.dispose();
  // }
  PageController? pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    pageController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryLight,
        body: GetBuilder<PageViewController>(
          builder: (controller) {
            return Column(
              children: [
                controller.index < 2
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 20.h, top: 45.h),
                          child: GestureDetector(
                            onTap: () {
                              // PrefData.setIntro(false);
                              _onboardingService.setUserOnboard('false');
                              CommonMethod.pushRemoveUntil(
                                  context, Routes.authLogin);
                            },
                            child: Text(
                              AppText.skip,
                              style: TextStyle(
                                color: AppColor.primaryTextColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ))
                    : Padding(
                        padding: EdgeInsets.only(bottom: 28.h),
                        child: SizedBox(
                          height: 0.h,
                        ),
                      ),
                Expanded(
                  child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: pageController,
                      onPageChanged: (value) {
                        // print("sdsdsd=====================${value}");
                        controller.changeIndex(value);
                      },
                      itemCount: onboardingList.length,
                      itemBuilder: (context, index) {
                        return OnboardingScreen(
                          image: onboardingList[index].image,
                          disc: onboardingList[index].discription,
                          title: onboardingList[index].title,
                        );
                      }),
                ),
                DotsIndicator(
                  dotsCount: onboardingList.length,
                  position: controller.index,
                  decorator: DotsDecorator(
                    size: Size.square(8.0.h),
                    // activeSize: const Size( 9.0),
                    spacing: EdgeInsets.only(right: 8.h),
                    activeColor: AppColor.primaryColor,
                    color: AppColor.grey40,

                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ).marginSymmetric(vertical: 30.h),
                // controller.index == onboardingList.length - 1
                //     ? Padding(
                //         padding: EdgeInsets.symmetric(
                //             horizontal: 20.h, vertical: 20.h),
                //         child: GestureDetector(
                //           onTap: () {
                //             PrefData.setIntro(false);
                //             CommonMethod.sendToNextScreen(
                //                 context, RoutesPath.loginScreen);
                //           },
                //           child: AppButton(
                //             buttonText: AppText.getStarted,
                //             fontSize: 18.sp,
                //             buttonTextColor: AppColor.secondaryTextColor,
                //           ),
                //         ),
                //       )
                //     :
                GestureDetector(
                  onTap: () {
                    if (controller.index == onboardingList.length - 1) {
                      _onboardingService.setUserOnboard('false');
                      CommonMethod.pushRemoveUntil(context, Routes.authLogin);
                    } else {
                      pageController!.nextPage(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.bounceIn);
                    }
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
                    child: AppButton(
                      buttonText: controller.index == onboardingList.length - 1
                          ? AppText.getStarted
                          : AppText.next,
                      fontSize: 18.sp,
                      buttonTextColor: AppColor.secondaryTextColor,
                    ),
                  ),
                )
              ],
            );
          },
          init: PageViewController(),
        )
        // floatingActionButton:
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
  }
}
