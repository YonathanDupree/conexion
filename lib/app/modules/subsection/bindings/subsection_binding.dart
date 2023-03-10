import 'package:get/get.dart';

import '../controllers/subsection_controller.dart';

class SubsectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubsectionController>(
      () => SubsectionController(),
    );
  }
}
