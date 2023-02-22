import 'package:conexion/app/modules/calendar/providers/calendar_provider.dart';
import 'package:conexion/app/modules/coupon/controllers/coupon_controller.dart';
import 'package:get/get.dart';

import '../../../ui/utils/snackbar_util.dart';

class CalendarController extends GetxController {
  //TODO: Implement CalendarController
  final CalendarProvider provider = CalendarProvider();
  RxString fechSoli = "Seleccione".obs;
  final couponController = Get.find<CouponController>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeselectedFecha(String value) {
    fechSoli(value);
  }

  Future<void> registerCoupon(int cantSoli) async {
    late String title;
    late String message;
    if (fechSoli.value == 'Seleccione') {
      title = "Error";
      message = "Dato fecha obligatorio.";
      SnackbarUtil().snackbarError(title, message);
    } else if (cantSoli > couponController.cantCupo.value) {
      title = "Error";
      message = "Cantidad solicitada no disponible.";
      SnackbarUtil().snackbarError(title, message);
    } else {
      try {
        String message = await provider.registerCoupon(
            couponController.consCupo.value,
            couponController.numeIden,
            couponController.jefeInme.value,
            couponController.autoEmp1.value,
            couponController.autoEmp2.value,
            couponController.tipoCupo.value,
            fechSoli.value,
            'PENDIENTE',
            cantSoli.toString());

        title = "Notificación";
        SnackbarUtil().snackbarInfo(title, message);
      } catch (error) {
        title = "Error";
        message = error.toString();
        SnackbarUtil().snackbarError(title, message);
      }
    }
  }
}
