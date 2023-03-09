import 'package:get/get.dart';

import '../controllers/sure_controller.dart';

class SureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SureController>(
      () => SureController(),
    );
  }
}
