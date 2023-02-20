import 'dart:developer';

import 'package:conexion/app/modules/coupon/coupon_model.dart';
import 'package:conexion/app/modules/coupon/providers/coupon_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
  RxString urlCump =
      "https://intranet.dupree.pe/desarrollo/libra/public/img/0.png".obs;
  RxString urlMome =
      "https://intranet.dupree.pe/desarrollo/libra/public/img/0.png".obs;
  RxString urlTram =
      "https://intranet.dupree.pe/desarrollo/libra/public/img/0.png".obs;
  RxString urlCita =
      "https://intranet.dupree.pe/desarrollo/libra/public/img/0.png".obs;
  RxString urlIngr =
      "https://intranet.dupree.pe/desarrollo/libra/public/img/0.png".obs;
  RxString urlSali =
      "https://intranet.dupree.pe/desarrollo/libra/public/img/0.png".obs;

  RxString totaUsad = "0".obs;

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
    print(numeIden);
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
      urlCump.value = data!.urlCump.toString();
      urlMome.value = data.urlMome.toString();
      urlTram.value = data.urlTram.toString();
      urlCita.value = data.urlCita.toString();
      urlIngr.value = data.urlIngr.toString();
      urlSali.value = data.urlSali.toString();
      totaUsad.value = data.totaUsad.toString();
      changeIsLoading(false);
    } catch (error) {
      title = "Error";
      message = error.toString();
      SnackbarUtil().snackbarError(title, message);
    }
  }

  void changeIsLoading(bool data) {
    isLoading(data);
  }
}
