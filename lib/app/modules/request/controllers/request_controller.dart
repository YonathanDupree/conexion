import 'dart:developer';

import 'package:conexion/app/modules/request/providers/request_provider.dart';
import 'package:conexion/app/modules/request/request_model.dart';
import 'package:conexion/app/ui/utils/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RequestController extends GetxController {
  //TODO: Implement RequestController
  final provider = RequestProvider();
  GetStorage box = GetStorage();
  String numeIden = "";
  var request = <Request>[].obs;
  final anotObseController = TextEditingController();

  @override
  void onInit() {
    numeIden = box.read("numeIden");
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    print("onReady Request");
    await getRequest();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getRequest() async {
    late String title;
    late String message;

    try {
      List<Request> request = await provider.getRequest(numeIden);
      changeRequest(request);
    } catch (error) {
      title = "Error";
      message = error.toString();
      SnackbarUtil().snackbarError(title, message);
    }
  }

  void changeRequest(List<Request> data) {
    request.clear();
    request(data);
  }

  Future<void> registerRequest() async {
    late String title;
    late String message;

    try {
      await provider.registerRequest("consCupo", "consRegi");
      title = "Notificación";
      message = 'forgot_confirm_forgot'.tr;
      SnackbarUtil().snackbarInfo(title, message);
    } catch (error) {
      title = "Error";
      message = error.toString();
      SnackbarUtil().snackbarError(title, message);
    }
  }
}
