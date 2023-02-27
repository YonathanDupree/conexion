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

    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await getSpec();
    await getSlid();
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

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<void> showUrl(String url) async {
    Uri _url = Uri.parse(url);
    if (await launchUrl(_url)) {
      //throw Exception('Could not launch $url');
    }
  }

  Future<void> sendMail(int $i) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: specialist[$i].mailSani.toString(),
      query: encodeQueryParameters(<String, String>{
        'subject': 'Reservar cita&body=Buen día deseo reservar una cita!',
      }),
    );

    launchUrl(params);
  }

  Future<void> callCelu(int $i) async {
    await launch('tel:' + specialist[0].celuSani.toString());
  }

  Future<void> sendWhatsapp(int $i) async {
    if (await canLaunch(
        "https://wa.me/+51" + specialist[0].celuSani.toString())) {
      await launch("https://wa.me/+51" + specialist[0].celuSani.toString());
    }
  }

  Future<void> answer(String questions) async {
    late String answer;

    switch (questions) {
      case "1":
        answer =
            "Es importante porque el nutricionista es el profesional encargado de evaluar y dar un diagnóstico nutricional de acuerdo con las necesidades y requerimientos de cada persona, para dar un buen manejo a su alimentación y asegurar su bienestar y buena salud.";
        break;
      case "2":
        answer =
            "Tener una correcta hidratación diaria es muy importante porque ayuda a eliminar toxinas, mejorar el metabolismo, mejorar la digestión y ayuda a nivelar la temperatura corporal. La cantidad adecuada es aproximadamente de 8 a 10 vasos de agua, dependiendo de la actividad física y el peso corporal de la persona.";
        break;
      case "3":
        answer =
            "Las frutas y verduras son importantes porque cumplen la función de regular el organismo, nos aportan vitaminas y minerales, antioxidantes y fibra soluble que el cuerpo necesita para mejorar el metabolismo, la digestión, previene el estreñimiento y además tener buenas defensas que el cuerpo necesita.";
        break;
      case "4":
        answer =
            "Dejar de comer no ayuda a bajar de peso, puesto que el cuerpo necesita cubrir sus necesidades nutricionales para que funcione adecuadamente. Es por lo que se recomienda comer 5 veces al día cada 3 horas para ayudar a la digestión. Si en todo caso; el objetivo es bajar de peso, es necesario asesorarse con un nutricionista para que le haga un plan de nutrición adecuado en cantidad y calidad de alimentos.";
        break;
      case "5":
        answer =
            "El tener una adecuada alimentación es la clave para tener una buena salud y un peso adecuado, pero no solo ello es lo único que se debe hacer, lo recomendable es hidratarse diariamente, realizar actividad física de 30 a 40 minutos y descansar de 6 a 7 horas para que el cuerpo se reponga y realice sus actividades de una manera sana.";
        break;
      default:
        answer = "";
    }

    _dialog.dialogAnswer(answer);
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
