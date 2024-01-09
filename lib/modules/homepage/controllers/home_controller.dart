import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController departureController = TextEditingController();
  TextEditingController departureFromController = TextEditingController();
  TextEditingController departureToController = TextEditingController();
  TextEditingController passengerController = TextEditingController();
  TextEditingController homeHotelFromController = TextEditingController();

  TextEditingController dateInput = TextEditingController();
  TextEditingController dateInputFrom = TextEditingController();
  TextEditingController dateInputTo = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isPressed = true;
  bool personSelect = false;
  int rooms = 1;
  int adults = 0;
  int children = 0;
  DateTime? startTime;
  DateTime? lastTime;
  int currentPage = 0;
  // String person = '';

  selectDate() {
    departureController.text = dateInput.text;
  }

  void swapValues() {
    var temp = fromController.text.toString();

    fromController.text = toController.text.toString();
    toController.text = temp;
    update();
  }

  @override
  void onInit() {
    swapValues();
    super.onInit();
    update();
  }

  void setCurrentPageIndex(int value) {
    currentPage = value;
    update();
  }
}
