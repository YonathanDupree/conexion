import 'dart:developer';
import 'dart:io';

import 'package:conexion/app/modules/home/providers/home_provider.dart';
import 'package:conexion/app/modules/home/providers/reserve_provider.dart';
import 'package:conexion/app/modules/home/providers/slid_provider.dart';
import 'package:conexion/app/modules/home/providers/spec_provider.dart';
import 'package:conexion/app/modules/home/reserve_model.dart';
import 'package:conexion/app/modules/home/spec_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../ui/utils/dialog_util.dart';
import '../../../ui/utils/snackbar_util.dart';
import '../slid_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final provider = HomeProvider();
  final specprovider = SpecProvider();
  final slidprovider = SlidProvider();
  final reserveprovider = ReserveProvider();

  var reserve = <Reserve>[].obs;
  Map<DateTime, List> eventsList = {};

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  GetStorage box = GetStorage();
  String? nombEmpl = "";
  String? numeIden = "";
  String? estaUsua;
  String? urlsFoto;
  String? codiSani = "";
  final _dialog = DialogUtil();

  var specialist = <Spec>[].obs;
  var slider = <Slid>[].obs;
  RxBool isLoading = true.obs;

  @override
  Future<void> onInit() async {
    numeIden = box.read("numeIden");
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
    late String title;
    late String message;

    try {
      message = await provider.saveEmotion(numeIden!, estaUsua!);
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

  Future<void> answer(String questions, String specialist) async {
    late String answer;

    if (specialist == "N") {
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
    }

    if (specialist == "P") {
      switch (questions) {
        case "1":
          answer = "- Tener un espacio solo para ti.\n"
              "- Comprender realmente qué te sucede.\n"
              "- Ser escuchado sin que te juzguen.\n"
              "- Obtener un punto de vista más global y objetivo.\n"
              "- Conocerte mejor y comprender a las personas.\n"
              "- Aprender a gestionar tus emociones, pensamientos y comportamientos.\n"
              "- Desarrollar habilidades de solución de conflictos.";
          break;
        case "2":
          answer =
              "Se realizan las primeras preguntas para entender el problema, los síntomas y los objetivos que quieres alcanzar por medio de nuestro ayuda.\n " +
                  "Lo más importante de la primera entrevista es darle forma a los malestares y  plantear las primeras hipótesis de trabajo. Tu psicólogo te informará de cómo trabaja, de la metodología, horarios y precios de las consultas..";
          break;
        case "3":
          answer =
              "Cualquier aprendizaje requiere una evolución. Aprender habilidades psicológicas para hacer frente a nuestros malestares requiere, probablemente, aún más tiempo que otras habilidades. No son tangibles, no se puede coger con las manos como se hace con una raqueta o una pelota al aprender a jugar al tenis. Por tanto la evolución de la terapia tendría una forma almenada y escalonada. Pocas veces, o ninguna, el cambio será lineal hacia el bienestar.";
          break;
        case "4":
          answer = "Estos son algunos aspectos a tener en cuenta:\n"
              "- Cambios bruscos de humor y conflictos más frecuentes que en etapas anteriores.\n"
              "- Sentimientos de ansiedad emocional y física mantenidos a lo largo de los días.\n"
              "- Llanto continuado y dificultad para afrontar las rutinas.\n"
              "- Dificultad para decidirse a salir de casa. Aislamiento social.\n"
              "- Incapacidad o dificultad seria para trabajar o estudiar, según sea el caso.\n"
              "- Haber vivido experiencias traumáticas.\n"
              "- Higiene básica descuidada, exponerse en riegos innecesarios con frecuencia: como peleas, abuso de drogas y alcohol.\n"
              "- Desorientación, ver u oír cosas que nadie más lo hace, olvidar hechos importantes.";
          break;
        case "5":
          answer =
              "Esto es comprensible porque eres un ser humano con diferentes emociones y sentimientos. Recuerda que el Psicólogo  está preparado y  que tiene como juramento el pacto de confidencialidad.";
          break;
        case "6":
          answer =
              "Desde luego que no. Pensar que uno tiene que estar «loco» para ver a un psicólogo es un mito. Las personas acuden al psicólogo por una gran variedad de razones, que incluyen aprender a manejar mejor el estrés, aliviar los síntomas emocionales angustiosos, superar una fobia, mejorar sus relaciones con los demás… Algunas personas buscan la ayuda de un psicólogo clínico porque están afrontando una crisis específica en la que necesitan ayuda, mientras que otras buscan mejorar su vida.";
          break;
        case "7":
          answer =
              "No es necesario que prepares nada como tal. Lo importante es que estés presente en la sesión con la intención de ser abierto y honesto contigo mismo. Otro aspecto muy importante es que vengas con un compromiso firme, tanto contigo mismo, como con el proceso de la consulta que vas a iniciar. Corroboro que las personas que se comprometen con las sesiones firmemente obtienen mejores y más rápidos resultados.";
          break;
        case "8":
          answer =
              "Todo lo que hables con tu psicólogo es confidencial. Es un espacio de legítima verdad y sinceridad de ambas.";
          break;
        default:
          answer = "";
      }
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

  Future<void> getReserve(String codiSani) async {
    late String title;
    late String message;

    try {
      List<Reserve> reserve = await reserveprovider.getReserve(codiSani);
      changeReserve(reserve);
      changeSani(codiSani);

      eventsList.clear();
      for (var i = 0; i < reserve.length; i++) {
        DateTime dateTime = DateTime.parse(reserve[i].fechCita.toString());

        if (eventsList.containsKey(
            DateTime.utc(dateTime.year, dateTime.month, dateTime.day))) {
          eventsList[DateTime.utc(dateTime.year, dateTime.month, dateTime.day)]
              ?.add(
                  'Modalidad ${reserve[i].modaCita} Hora: ${reserve[i].horaCita}');
        } else {
          eventsList[
              DateTime.utc(dateTime.year, dateTime.month, dateTime.day)] = [
            'Modalidad ${reserve[i].modaCita} Hora: ${reserve[i].horaCita}'
          ];
        }
      }
    } catch (error) {
      title = "Error";
      message = error.toString();
      SnackbarUtil().snackbarError(title, message);
    }
  }

  Future<void> registrerReserve(DateTime? fecha, String event) async {
    late String title;
    late String message;

    String fechCita =
        "${fecha?.month.toString().padLeft(2, '0')}/${fecha?.day.toString().padLeft(2, '0')}/${fecha?.year}";

    List<String> partes = event.split(" ");
    String horaCita = partes[3];

    try {
      message = await reserveprovider.registrerReserve(
          fechCita, horaCita, codiSani!, numeIden!);
      title = "Notificación";
      SnackbarUtil().snackbarSuccess(title, message);
    } catch (error) {
      title = "Error";
      message = error.toString();
      SnackbarUtil().snackbarError(title, message);
    }
  }

  void changeSani(String data) {
    codiSani = data;
  }

  void changeReserve(List<Reserve> data) {
    reserve.clear();
    reserve(data);
  }

  void clearReserve() {
    reserve.clear();
  }
}
