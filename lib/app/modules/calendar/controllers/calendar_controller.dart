import 'package:get/get.dart';

class CalendarController extends GetxController {
  //TODO: Implement CalendarController
  RxString selectedFecha = "Seleccione".obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeselectedFecha(String value) {
    selectedFecha(value);
  }
}
