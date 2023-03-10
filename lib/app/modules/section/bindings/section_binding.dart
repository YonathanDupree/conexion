import 'package:get/get.dart';

import '../controllers/section_controller.dart';

class SectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SectionController>(
      () => SectionController(),
    );
  }
}
