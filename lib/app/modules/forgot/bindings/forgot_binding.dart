import 'package:get/get.dart';

import '../controllers/forgot_controller.dart';
import '../providers/forgot_provider.dart';

class ForgotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotController>(
      () => ForgotController(),
    );
  }
}
