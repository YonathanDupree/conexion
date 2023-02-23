import 'dart:developer';

import 'package:conexion/app/modules/request/providers/request_provider.dart';
import 'package:conexion/app/modules/request/request_model.dart';
import 'package:conexion/app/ui/utils/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../ui/utils/dialog_util.dart';

class RequestController extends GetxController {
  //TODO: Implement RequestController
  final provider = RequestProvider();
  GetStorage box = GetStorage();
  RxBool isLoading = true.obs;
  String numeIden = "";
  var request = <Request>[].obs;
  final anotObseController = TextEditingController();
  final _dialog = DialogUtil();

  @override
  void onInit() {
    numeIden = box.read("numeIden");
    anotObseController.text = '';
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await getRequest();
    super.onReady();
  }

  @override
  void onClose() {
    anotObseController.dispose();
    super.onClose();
  }

  Future<void> getRequest() async {
    late String title;
    late String message;

    try {
      List<Request> request = await provider.getRequest(numeIden);
      changeRequest(request);
      changeIsLoading(false);
    } catch (error) {
      title = "Error";
      message = error.toString();
      changeIsLoading(false);
      SnackbarUtil().snackbarError(title, message);
    }
  }

  void changeRequest(List<Request> data) {
    request.clear();
    request(data);
  }

  void clearRequest() {
    request.clear();
  }

  Future<void> registerRequest(String consRegi, String consCupo,
      String estaSoli, String tipoCupo, String cantCupo) async {
    late String title;
    late String message;
    _dialog.dialogProgress("Espere un momomento...");
    try {
      String message = await provider.registerRequest(consRegi, consCupo,
          estaSoli, numeIden, tipoCupo, anotObseController.text, cantCupo);
      _dialog.dialogClose();
      title = "Notificación";
      SnackbarUtil().snackbarSuccess(title, message);
      clearRequest();
      await 3.delay();
      await getRequest();
    } catch (error) {
      title = "Error";
      message = error.toString();
      SnackbarUtil().snackbarError(title, message);
    }
  }

  void changeIsLoading(bool data) {
    isLoading(data);
  }
}
