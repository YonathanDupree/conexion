import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  GetStorage box = GetStorage();
  String nombEmpl = "";
  String? selectedFace;
  File? urlsFoto;

  List<String> listSliderI = [];
  List<String> listSliderII = [];

  @override
  void onInit() {
    nombEmpl = box.read("nombEmpl");
    urlsFoto = box.read("urlsFoto") != '' ? File(box.read("urlsFoto")) : null;

    listSliderI.add(
        "https://pedidos.dupree.pe/archivos/imagenes_app/COL/portada_C03.jpg");
    listSliderI.add(
        "https://pedidos.dupree.pe/archivos/imagenes_app/COL/portada_C04.jpg");

    listSliderII.add(
        "https://pedidos.dupree.pe/archivos/imagenes_app/COL/portada_C03.jpg");
    listSliderII.add(
        "https://pedidos.dupree.pe/archivos/imagenes_app/COL/portada_C04.jpg");

    print(box.read("urlsFoto"));
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

  List faceItems = [
    {"name": "Ansioso", "icon": "assets/images/ansioso.png"},
    {"name": "Cansado", "icon": "assets/images/cansado.png"},
    {"name": "Con energia", "icon": "assets/images/conenergia.png"},
    {"name": "Felíz", "icon": "assets/images/feliz.png"},
    {"name": "Motivado", "icon": "assets/images/motivado.png"},
    {"name": "Triste", "icon": "assets/images/triste.png"},
  ];

  Future<void> login() async {
    box.read("numeIden");

    /*bool validation = loginFormKey.currentState!.validate();
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
        } else {
          box.remove('codiUsua');
          box.remove('clavUsua');
        }
        box.write("isLogin", "S");
        box.write("numeIden", data?.numeIden.toString());

        Get.offAndToNamed(Routes.HOME);
      } catch (error) {
        title = "Error";
        message = error.toString();
        _dialog.dialogClose();
        SnackbarUtil().snackbarError(title, message);
      }
    }*/
  }

  void logout() {
    box.remove("isLogin");
    box.remove("numeIden");
    box.remove("nombEmpl");
  }
}
