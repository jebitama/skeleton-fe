import 'package:skeleton/core/generated/assets.dart';
import 'package:skeleton/core/utils/constant/app_string.dart';

class SpecialOfferModel {
  int? id;
  String? image;
  String? offer;
  String? price;
  String? place;
  String? placeLocation;

  SpecialOfferModel({
    this.id,
    this.image,
    this.offer,
    this.price,
    this.place,
    this.placeLocation,
  });
  SpecialOfferModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    offer = json['offer'];
    price = json['price'];
    place = json['place'];
    placeLocation = json['placeLocation'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['offer'] = offer;
    data['price'] = price;
    data['place'] = place;
    data['placeLocation'] = placeLocation;
    data['id'] = id;

    return data;
  }
}

List<SpecialOfferModel> specialOffer = [
  SpecialOfferModel(
      id: 0,
      placeLocation: AppText.spL1,
      image: Assets.imagesSpone,
      offer: '20%Off',
      place: AppText.sp1,
      price: '\$200.00'),
  SpecialOfferModel(
      id: 1,
      placeLocation: AppText.spL2,
      image: Assets.imagesSpTwo393,
      offer: '50%Off',
      place: AppText.sp2,
      price: '\$400.00'),
  SpecialOfferModel(
      id: 2,
      placeLocation: AppText.spL3,
      image: Assets.imagesSpThreen,
      offer: '60%Off',
      place: AppText.sp3,
      price: '\$200.00'),
  SpecialOfferModel(
      id: 3,
      placeLocation: AppText.spL4,
      image: Assets.imagesSpone,
      offer: '20%Off',
      place: AppText.sp4,
      price: '\$200.00'),
  SpecialOfferModel(
      id: 4,
      placeLocation: AppText.spL5,
      image: Assets.imagesSpThreen,
      offer: '60%Off',
      place: AppText.sp5,
      price: '\$200.00'),
  SpecialOfferModel(
      id: 5,
      placeLocation: AppText.spL6,
      image: Assets.imagesSpTwo393,
      offer: '50%Off',
      place: AppText.sp6,
      price: '\$400.00'),
  SpecialOfferModel(
    id: 6,
    image: Assets.imagesHotel1,
    placeLocation: AppText.spL7,
    place: AppText.sp7,
    price: '\$200.00',
  ),
  SpecialOfferModel(
    id: 7,
    image: Assets.imagesHotel2,
    placeLocation: AppText.spL8,
    place: AppText.sp8,
    price: '\$446.00',
  ),
  SpecialOfferModel(
    id: 8,
    image: Assets.imagesHotel3,
    placeLocation: AppText.spL9,
    place: AppText.sp9,
    price: '\$500.00',
  ),
  SpecialOfferModel(
    id: 9,
    image: Assets.imagesHotel4,
    placeLocation: AppText.spL10,
    place: AppText.sp10,
    price: '\$445.00',
  ),
  SpecialOfferModel(
    id: 10,
    image: Assets.imagesHotel5,
    placeLocation: AppText.spL11,
    place: AppText.sp11,
    price: '\$200.00',
  ),
  SpecialOfferModel(
    id: 11,
    image: Assets.imagesHotel6,
    placeLocation: AppText.spL12,
    place: AppText.sp12,
    price: '\$446.61',
  ),
  SpecialOfferModel(
    id: 12,
    image: Assets.imagesHotel3,
    placeLocation: AppText.spL13,
    place: AppText.sp13,
    price: '\$450.50',
  ),
  SpecialOfferModel(
    id: 13,
    image: Assets.imagesHotel1,
    placeLocation: AppText.spL14,
    place: AppText.sp14,
    price: '\$200.00',
  ),
  SpecialOfferModel(
    id: 14,
    image: Assets.imagesHotel5,
    placeLocation: AppText.spL15,
    place: AppText.sp15,
    price: '\$350.00',
  ),
];
