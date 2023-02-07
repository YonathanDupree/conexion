import 'dart:developer';
import 'dart:io';

import 'package:conexion/app/modules/home/providers/home_provider.dart';
import 'package:conexion/app/modules/home/providers/slid_provider.dart';
import 'package:conexion/app/modules/home/providers/spec_provider.dart';
import 'package:conexion/app/modules/home/spec_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../ui/utils/dialog_util.dart';
import '../../../ui/utils/snackbar_util.dart';
import '../slid_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final HomeProvider provider = HomeProvider();
  final SpecProvider specprovider = SpecProvider();
  final SlidProvider slidprovider = SlidProvider();

  GetStorage box = GetStorage();
  String? nombEmpl = "";
  String? estaUsua;
  String? urlsFoto;
  final _dialog = DialogUtil();

  var specialist = <Spec>[].obs;
  var slider = <Slid>[].obs;
  RxBool isLoading = true.obs;

  @override
  Future<void> onInit() async {
    print("onInit");

    nombEmpl = box.read("nombEmpl");
    urlsFoto = box.read("urlsFoto");
    await getSpec();
    await getSlid();

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
      SnackbarUtil().snackbarSuccess(title, message);
    } catch (error) {
      title = "Error";
      message = error.toString();
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
    } catch (error) {
      title = "Error";
      message = error.toString();
      SnackbarUtil().snackbarError(title, message);
    }
  }

  Future<void> getSlid() async {
    late String title;
    late String message;

    try {
      List<Slid> slider = await slidprovider.getSlid();
      changeSlide(slider);
      inspect(slider);
      changeIsLoading(false);
    } catch (error) {
      title = "Error";
      message = error.toString();
      SnackbarUtil().snackbarError(title, message);
    }
  }

  void changeSpecialist(List<Spec> data) {
    specialist.clear();
    specialist(data);
  }

  void changeSlide(List<Slid> data) {
    slider.clear();
    slider(data);
  }

  List<Spec> getSpecNutri() {
    return specialist.where((item) => item.codiSani == 'N').toList();
  }

  List<Spec> getSpecPsyc() {
    return specialist.where((item) => item.codiSani == 'P').toList();
  }

  List<Slid> getSliderI() {
    return slider.where((item) => item.numeSlid == 'I').toList();
  }

  List<Slid> getSliderII() {
    return slider.where((item) => item.numeSlid == 'II').toList();
  }

  Future<void> showUrl(String url) async {
    Uri _url = Uri.parse(url);
    if (await launchUrl(_url)) {
      //throw Exception('Could not launch $url');
    }
  }

  void changeIsLoading(bool data) {
    isLoading(data);
  }

  void logout() {
    box.remove("isLogin");
    box.remove("numeIden");
    box.remove("nombEmpl");
    box.remove("urlsFoto");
  }
}
