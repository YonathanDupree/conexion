import 'package:conexion/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../login/controllers/login_controller.dart';

class CameraWidget extends StatelessWidget {
  const CameraWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return GestureDetector(
      onTap: () {},
      child: controller.urlsFoto != ""
          ? ClipRRect(
              borderRadius: BorderRadius.circular(80.0),
              child: FadeInImage(
                  image: NetworkImage(controller.urlsFoto.toString()),
                  placeholder: const AssetImage('assets/images/loading.gif'),
                  fit: BoxFit.cover,
                  height: 140,
                  width: 140))
          : Container(
              width: 140,
              height: 140,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/camara.png'),
                fit: BoxFit.cover,
              ))),
    );
  }
}
