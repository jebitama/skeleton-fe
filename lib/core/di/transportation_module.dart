import 'package:get/get.dart';
import 'package:skeleton/modules/transportation_ticket/controllers/transport_ticket_controller.dart';
import 'package:skeleton/modules/transportation_ticket/services/transport_ticket_service.dart';
import 'package:skeleton/modules/transportation_ticket/transport_ticket_screen.dart';

class TransportationModule extends Bindings {
  @override
  void dependencies() {
    // transportation
    Get.lazyPut(() => TransportTicketController());
    Get.lazyPut(() => TransportationTicketService());

    // screen
    Get.lazyPut(() => const TransportationScreen());
  }
}
