import 'package:conexion/app/modules/request/controllers/request_controller.dart';
import 'package:get/get.dart';

import '../../status/controllers/status_controller.dart';
import '../controllers/coupon_controller.dart';

class CouponBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CouponController>(
      () => CouponController(),
    );
    Get.lazyPut<StatusController>(
      () => StatusController(),
    );
    Get.lazyPut<RequestController>(
      () => RequestController(),
    );
  }
}
