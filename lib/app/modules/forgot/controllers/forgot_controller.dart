import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ui/utils/dialog_util.dart';
import '../../../ui/utils/snackbar_util.dart';

class ForgotController extends GetxController {
  //TODO: Implement ForgotController

  final numeIdenController = TextEditingController();
  final clavUsuaController = TextEditingController();
  final repeClavController = TextEditingController();

  FocusNode numeidenFocusNode = FocusNode();
  FocusNode clavusuaFocusNode = FocusNode();
  FocusNode repeclavFocusNode = FocusNode();

  final _dialog = DialogUtil();

  Future<void> forgot(forgotFormKey) async {
    bool validation = forgotFormKey.currentState!.validate();
    late String title;
    late String message;
    numeidenFocusNode.unfocus();
    clavusuaFocusNode.unfocus();
    repeclavFocusNode.unfocus();

    if (validation) {
      _dialog.dialogProgress("Generando la nueva contraseña.");
      try {
        /*User? data = await provider.getUser(
            codiUsuaController.text, clavUsuaController.text);*/
        title = "Notificación";
        message = 'forgot_confirm_forgot'.tr;
        _dialog.dialogClose();
        SnackbarUtil().snackbarInfo(title, message);
      } catch (error) {
        title = "Error";
        message = error.toString();
        _dialog.dialogClose();
        SnackbarUtil().snackbarError(title, message);
      }
    }
  }

  String? validatornumeIden(String value) {
    if (value.isEmpty) {
      return 'forgot_validator_identity'.tr;
    }
    if (!value.isNum) {
      return 'forgot_validator_number_identity'.tr;
    }
    return null;
  }

  String? validatorclavUsua(String value) {
    if (value.isEmpty) {
      return 'forgot_validator_password'.tr;
    }
    return null;
  }

  String? validatorrepeClav(String value) {
    if (value.isEmpty) {
      return 'forgot_validator_confirm_password'.tr;
    }
    return null;
  }

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
}
