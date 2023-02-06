import 'dart:io';

import 'package:conexion/app/modules/home/providers/home_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../ui/utils/dialog_util.dart';
import '../../../ui/utils/snackbar_util.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final HomeProvider provider = HomeProvider();

  GetStorage box = GetStorage();
  String? nombEmpl = "";
  String? estaUsua;
  String? urlsFoto;
  final _dialog = DialogUtil();

  List<String> listSliderI = [];
  List<String> listSliderII = [];

  @override
  void onInit() {
    print("onInit");
    nombEmpl = box.read("nombEmpl");
    urlsFoto = box.read("urlsFoto");

    listSliderI.add(
        "https://pedidos.dupree.pe/archivos/imagenes_app/COL/portada_C03.jpg");
    listSliderI.add(
        "https://pedidos.dupree.pe/archivos/imagenes_app/COL/portada_C04.jpg");

    listSliderII.add(
        "https://pedidos.dupree.pe/archivos/imagenes_app/COL/portada_C03.jpg");
    listSliderII.add(
        "https://pedidos.dupree.pe/archivos/imagenes_app/COL/portada_C04.jpg");

    super.onInit();
  }

  @override
  void onReady() {
    print("onReady");
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

  Future<void> saveEmotion() async {
    box.read("numeIden");
    print(box.read("numeIden"));
    late String title;
    late String message;

    try {
      print(estaUsua);
      message = await provider.saveEmotion(box.read("numeIden"), estaUsua!);

      title = "Notificación";
      _dialog.dialogClose();
      SnackbarUtil().snackbarSuccess(title, message);
    } catch (error) {
      title = "Error";
      message = error.toString();
      _dialog.dialogClose();
      SnackbarUtil().snackbarError(title, message);
    }
  }

  void logout() {
    print("Cierra sesión");
    box.remove("isLogin");
    box.remove("numeIden");
    box.remove("nombEmpl");
    box.remove("urlsFoto");
  }
}
