import 'package:get/get.dart';

import '../../../ui/utils/dialog_util.dart';

class CouponController extends GetxController {
  //TODO: Implement CouponController

  var tabIndex = 0.obs;
  final _dialog = DialogUtil();

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    _dialog.dialogCupo();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
