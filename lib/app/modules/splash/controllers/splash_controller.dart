import 'package:conexion/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  onReady() async {
    final isLogin = box.read("isLogin");
    await 4.delay();
    print("entro");
    print(isLogin);
    print("paso");
    if (isLogin == null) {
      Get.offAndToNamed(Routes.LOGIN);
    } else {
      Get.offAndToNamed(Routes.HOME);
    }
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
