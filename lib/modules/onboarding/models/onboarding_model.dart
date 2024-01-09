import 'package:skeleton/core/utils/constant/app_image.dart';
import 'package:skeleton/core/utils/constant/app_string.dart';

class OnboardingModel {
  String? image;
  String? title;
  String? discription;

  int? index;

  OnboardingModel({
    this.image,
    this.title,
    this.discription,
    this.index,
  });
}

final List<OnboardingModel> onboardingList = [
  OnboardingModel(
    image: AppImages.ob1,
    title: AppText.onboardingT1,
    discription: AppText.onboardingD1,
    index: 0,
  ),
  OnboardingModel(
    image: AppImages.ob2,
    title: AppText.onboardingT2,
    discription: AppText.onboardingD2,
    index: 1,
  ),
  OnboardingModel(
    image: AppImages.ob31,
    title: AppText.onboardingT3,
    discription: AppText.onboardingD3,
    index: 2,
  ),
];
