import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  double headerHeight = 225;
  double buttonwidth = 200;
  GetStorage box = GetStorage();
  RxString selectedCountry = "".obs;
  RxBool isChecked = true.obs;
  RxString versionName = "".obs;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  List countryList = [
    {
      "name": "Azzorti",
      "icon": "assets/images/azzorti.png",
      "lang": "PE",
    },
    {
      "name": "Livva",
      "icon": "assets/images/livva.png",
      "lang": "LIPE",
    },
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
    print("acas");

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
      /*_dialog.dialogProgress("Validando acceso");
      try {
        UserModel data = await repository.getUser(
            usernameController.text, passwordController.text);
        title = "Notificación";
        message = 'Bienvenido ${data.nombEmpl.toString().capitalizeFirst}';
        _dialog.dialogClose();
        SnackbarUtil().snackbarSuccess(title, message);
        if (isChecked.value) {
          box.write("username", usernameController.text);
          box.write("password", passwordController.text);
        } else {
          box.remove('username');
          box.remove('password');
        }
        box.write("isLogin", data.tipoVinc);
        box.write("codi_usua", usernameController.text);
        if (data.tipoVinc == 'M') {
          Get.toNamed("/massive");
        } else {
          Get.toNamed("/main");
        }
      } catch (error) {
        title = "Error";
        message = error.toString();
        _dialog.dialogClose();
        SnackbarUtil().snackbarError(title, message);
      }*/
    }
  }

  void changeIsChecked(bool data) {
    isChecked(data);
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
