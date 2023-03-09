import 'dart:developer';

import 'package:conexion/app/modules/sure/providers/sure_provider.dart';
import 'package:conexion/app/modules/sure/sure_model.dart';
import 'package:get/get.dart';

import '../../../ui/utils/snackbar_util.dart';

class SureController extends GetxController {
  //TODO: Implement SureController
  final provider = SureProvider();
  var section = <Sure>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await getSure();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getSure() async {
    late String title;
    late String message;

    try {
      List<Sure> section = await provider.getSure("SEGUROS");
      changeSection(section);
      inspect(section);
    } catch (error) {
      title = "Error";
      message = error.toString();
      SnackbarUtil().snackbarError(title, message);
    }
  }

  void changeSection(List<Sure> data) {
    section.clear();
    section(data);
  }
}
