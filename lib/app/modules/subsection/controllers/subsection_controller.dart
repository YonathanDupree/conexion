import 'package:conexion/app/modules/subsection/providers/subsection_provider.dart';
import 'package:conexion/app/modules/subsection/subsection_model.dart';
import 'package:conexion/app/modules/sure/controllers/sure_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../ui/utils/snackbar_util.dart';

class SubsectionController extends GetxController {
  //TODO: Implement SubsectionController
  final sureController = Get.find<SureController>();
  final provider = SubsectionProvider();
  var subsection = <Subsection>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await getSubsection();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getSubsection() async {
    late String title;
    late String message;

    try {
      List<Subsection> subsection = await provider
          .getSubsection(sureController.nombSecc.value.toString());
      changeSubsection(subsection);
    } catch (error) {
      title = "Error";
      message = error.toString();
      SnackbarUtil().snackbarError(title, message);
    }
  }

  void changeSubsection(List<Subsection> data) {
    subsection.clear();
    subsection(data);
  }

  Future<void> openFile(String urlsSubs, String exteSubs) async {
    switch (exteSubs) {
      case 'JPG':
        launchUrl(urlsSubs);
        break;
      case 'PNG':
        launchUrl(urlsSubs);
        break;
      case 'TEL':
        await callCelu(urlsSubs);
        break;
      case 'WEB':
        launchUrl(urlsSubs);
        break;
      case 'MP3':
        launchUrl(urlsSubs);
        break;
      case 'MP4':
        launchUrl(urlsSubs);
        break;
      case 'PDF':
        launchUrl(urlsSubs);
        break;
    }
  }

  Future<void> launchUrl(String urlsSubs) async {
    if (!await canLaunch(urlsSubs)) {
      await launch(urlsSubs);
    }
  }

  Future<void> callCelu(String urlsSubs) async {
    await launch('tel:' + urlsSubs);
  }
}
