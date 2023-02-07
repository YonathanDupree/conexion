import 'dart:developer';
import 'dart:io';

import 'package:conexion/app/modules/home/providers/home_provider.dart';
import 'package:conexion/app/modules/home/providers/spec_provider.dart';
import 'package:conexion/app/modules/home/spec_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../ui/utils/dialog_util.dart';
import '../../../ui/utils/snackbar_util.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final HomeProvider provider = HomeProvider();
  final SpecProvider specprovider = SpecProvider();

  GetStorage box = GetStorage();
  String? nombEmpl = "";
  String? estaUsua;
  String? urlsFoto;
  final _dialog = DialogUtil();

  List<String> listSliderI = [];
  List<String> listSliderII = [];

  var specialist = <Spec>[].obs;

  @override
  Future<void> onInit() async {
    print("onInit");
    nombEmpl = box.read("nombEmpl");
    urlsFoto = box.read("urlsFoto");
    await getSpec();
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
  Future<void> onReady() async {
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
    late String title;
    late String message;

    try {
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

  Future<void> getSpec() async {
    late String title;
    late String message;

    try {
      List<Spec> specialist = await specprovider.getSpec();
      changeSpecialist(specialist);
      inspect(specialist);

      print(specialist[0].codiSani);
    } catch (error) {
      title = "Error";
      message = error.toString();
      _dialog.dialogClose();
      SnackbarUtil().snackbarError(title, message);
    }
  }

  void changeSpecialist(List<Spec> data) {
    specialist.clear();
    specialist(data);
  }

  List<Spec> getSpecNutri() {
    return specialist.where((item) => item.codiSani == 'N').toList();
  }

  /*List<Spec> getSpecPsyc() {
    return specialist.where((item) => item.codiSani == 'P').toList();
  }*/

  void logout() {
    box.remove("isLogin");
    box.remove("numeIden");
    box.remove("nombEmpl");
    box.remove("urlsFoto");
  }
}
