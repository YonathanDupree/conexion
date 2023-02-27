import 'package:get/get.dart';

import '../controllers/nutritionist_controller.dart';

class NutritionistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NutritionistController>(
      () => NutritionistController(),
    );
  }
}
