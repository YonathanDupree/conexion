import 'dart:developer';

import 'package:conexion/app/modules/coupon/coupon_model.dart';
import 'package:conexion/app/modules/coupon/providers/coupon_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../../../ui/utils/dialog_util.dart';
import '../../../ui/utils/snackbar_util.dart';

class CouponController extends GetxController {
  //TODO: Implement CouponController
  final CouponProvider couponprovider = CouponProvider();

  var tabIndex = 0.obs;
  final _dialog = DialogUtil();
  GetStorage box = GetStorage();
  RxBool isLoading = true.obs;

  String numeIden = "";
  RxString consCupo = "0".obs;
  RxString fechNaci = "".obs;
  RxString numeDias = "0".obs;
  RxInt min = 0.obs;
  RxInt max = 0.obs;
  RxString jefeInme = "0".obs;
  RxString autoEmp1 = "0".obs;
  RxString autoEmp2 = "0".obs;
  RxString totaUsad = "0".obs;
  RxString cupoCump = "0".obs;
  RxString cupoMome = "0".obs;
  RxString cupoTram = "0".obs;
  RxString cupoCita = "0".obs;
  RxString cupoIngr = "0".obs;
  RxString cupoSali = "0".obs;

  RxString urlCump =
      "https://intranet2per.azzorti.co/desarrollo/libra/public/img/0.png".obs;
  RxString urlMome =
      "https://intranet2per.azzorti.co/desarrollo/libra/public/img/0.png".obs;
  RxString urlTram =
      "https://intranet2per.azzorti.co/desarrollo/libra/public/img/0.png".obs;
  RxString urlCita =
      "https://intranet2per.azzorti.co/desarrollo/libra/public/img/0.png".obs;
  RxString urlIngr =
      "https://intranet2per.azzorti.co/desarrollo/libra/public/img/0.png".obs;
  RxString urlSali =
      "https://intranet2per.azzorti.co/desarrollo/libra/public/img/0.png".obs;

  RxString tipoCupo = "".obs;
  RxInt cantCupo = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  Future<void> onInit() async {
    numeIden = box.read("numeIden");
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await getCoupon(numeIden);
    _dialog.dialogCupo();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getCoupon(String numeIden) async {
    late String title;
    late String message;

    try {
      Coupon? data = await couponprovider.getCoupon(numeIden);
      consCupo.value = data!.consCupo.toString();
      fechNaci.value = data.fechNaci.toString();
      numeDias.value = data.numeDias.toString();
      jefeInme.value = data.jefeInme.toString();
      autoEmp1.value = data.autoEmp1.toString();
      autoEmp2.value = data.autoEmp2.toString();
      totaUsad.value = data.totaUsad.toString();
      cupoCump.value = data.cupoCump.toString();
      cupoMome.value = data.cupoMome.toString();
      cupoTram.value = data.cupoTram.toString();
      cupoCita.value = data.cupoCita.toString();
      cupoIngr.value = data.cupoIngr.toString();
      cupoSali.value = data.cupoSali.toString();
      urlCump.value = data.urlCump.toString();
      urlMome.value = data.urlMome.toString();
      urlTram.value = data.urlTram.toString();
      urlCita.value = data.urlCita.toString();
      urlIngr.value = data.urlIngr.toString();
      urlSali.value = data.urlSali.toString();
      await changePosi(numeDias.value);
      changeIsLoading(false);
    } catch (error) {
      changeIsLoading(false);
      title = "Error";
      message = error.toString();
      SnackbarUtil().snackbarError(title, message);
    }
  }

  Future<void> openCalendar(String cantCupo, String tipoCupo) async {
    late String title;
    late String message;

    if (int.parse(cantCupo) > 0) {
      changeCantCupo(int.parse(cantCupo));
      changeTipoCupo(tipoCupo);
      Get.toNamed(Routes.CALENDAR);
    } else {
      title = "Error";
      message = "No cuenta con cupos disponibles";
      SnackbarUtil().snackbarError(title, message);
    }
  }

  void changeIsLoading(bool data) {
    isLoading(data);
  }

  void changeTipoCupo(String data) {
    tipoCupo(data);
  }

  void changeCantCupo(int data) {
    cantCupo(data);
  }

  Future<void> changePosi(String numeDias) async {
    min.value = int.parse(numeDias) - 1;
    max.value = 7 - min.value;
    if (int.parse(numeDias) == 0) {
      min.value = 6;
      max.value = 1;
    }
  }

  DateTime getDate(String fecha, String t) {
    DateTime dateTime = DateTime(DateTime.now().year,
        DateTime.parse(fecha).month, DateTime.parse(fecha).day);

    switch (t) {
      case 'I':
        dateTime = dateTime;
        break;
      case 'F':
        dateTime = dateTime.subtract(Duration(days: min.value));
        break;
      case 'L':
        dateTime = dateTime.add(Duration(days: max.value));
        break;
    }
    return dateTime;
  }
}
