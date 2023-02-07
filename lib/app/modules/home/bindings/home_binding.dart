import 'package:conexion/app/modules/home/providers/spec_provider.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    /*Get.lazyPut<HomeController>(
      () => HomeController(),
    );*/
    Get.put(HomeController());
    Get.lazyPut<SpecProvider>(
      () => SpecProvider(),
    );
  }
}
