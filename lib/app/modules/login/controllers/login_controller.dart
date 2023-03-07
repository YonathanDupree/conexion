import 'package:conexion/app/modules/login/providers/user_provider.dart';
import 'package:conexion/app/modules/login/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../../../ui/utils/dialog_util.dart';
import '../../../ui/utils/snackbar_util.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final UserProvider provider = UserProvider();

  double headerHeight = 225;
  double buttonwidth = 200;
  GetStorage box = GetStorage();
  RxString selectedCountry = "".obs;
  RxBool isChecked = false.obs;
  RxString versionName = "".obs;
  final _dialog = DialogUtil();

  final codiUsuaController = TextEditingController();
  final clavUsuaController = TextEditingController();

  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  List countryList = [
    {
      "name": "Azzorti",
      "icon": "assets/images/azzorti.png",
      "lang": "PE",
    },
    /*{
      "name": "Livva",
      "icon": "assets/images/livva.png",
      "lang": "LIPE",
    },*/
  ];

  void updateCountry(String country, String lang) {
    selectedCountry.value = country;
    box.write("country", country);
    box.write("lang", lang);
  }

  String? validatorUsername(String value) {
    if (value.isEmpty) {
      return 'login_validator_username'.tr;
    }
    return null;
  }

  String? validatorPassword(String value) {
    if (value.isEmpty) {
      return 'login_validator_password'.tr;
    }
    return null;
  }

  String? validatorCountry(String value) {
    if (value == "null" || value == '') {
      return 'login_validator_country'.tr;
    }
    return null;
  }

  Future<void> login(loginFormKey) async {
    bool validation = loginFormKey.currentState!.validate();
    late String title;
    late String message;
    usernameFocusNode.unfocus();
    passwordFocusNode.unfocus();

    if (validation) {
      _dialog.dialogProgress("Validando acceso");
      try {
        User? data = await provider.getUser(
            codiUsuaController.text, clavUsuaController.text);
        title = "Notificación";
        message = 'Bienvenido ${data?.nombEmpl.toString().capitalizeFirst}';
        _dialog.dialogClose();
        SnackbarUtil().snackbarSuccess(title, message);
        if (isChecked.value) {
          box.write("codiUsua", codiUsuaController.text);
          box.write("clavUsua", clavUsuaController.text);
          box.write("isChecked", true);
        } else {
          box.remove('codiUsua');
          box.remove('clavUsua');
          box.write("isChecked", false);
        }
        box.write("isLogin", "S");
        box.write("numeIden", data?.numeIden.toString());
        box.write("nombEmpl", data?.nombEmpl.toString());
        box.write("urlsFoto", data?.urlsFoto.toString());
        //Get.offAndToNamed(Routes.HOME);
        Get.offAllNamed(Routes.HOME);
      } catch (error) {
        title = "Error";
        message = error.toString();
        _dialog.dialogCloseError();
        SnackbarUtil().snackbarError(title, message);
      }
    }
  }

  void changeIsChecked(bool data) {
    isChecked(data);
  }

  @override
  void onInit() {
    selectedCountry.value = box.read("country") ?? '';
    codiUsuaController.text = box.read("codiUsua") ?? '';
    clavUsuaController.text = box.read("clavUsua") ?? '';
    isChecked.value = box.read("isChecked") ?? false;
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
