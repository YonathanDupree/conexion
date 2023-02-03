import 'package:conexion/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../providers/user_provider.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<UserProvider>(
      () => UserProvider(),
    );
    //No puede ser put(no debe arranacar oninit consume recursos) porque la baseurl podria ser diferene url para el login
    //Get.put(UserProvider());
  }
}
