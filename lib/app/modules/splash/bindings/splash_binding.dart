import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    //lazyPut no comienza a ejecutar los metodos del ciclo de vida por eso no realiza la logica en el controlador (onReady) hasta que realmente uses el controlador
    /*Get.lazyPut<SplashController>(
      () => SplashController(),
    );*/

    //Comenzara a ejecutarse inmediatamente cuando se inyecte es decir con eso sus metodos de ciclo de vidad onInit() y onReady()
    Get.put(SplashController());
  }
}
