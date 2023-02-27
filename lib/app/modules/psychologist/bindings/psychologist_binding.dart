import 'package:get/get.dart';

import '../controllers/psychologist_controller.dart';

class PsychologistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PsychologistController>(
      () => PsychologistController(),
    );
  }
}
