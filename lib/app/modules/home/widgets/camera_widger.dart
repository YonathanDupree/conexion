import 'package:conexion/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraWidget extends StatelessWidget {
  const CameraWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    final controller = Get.find<HomeController>();

    return GestureDetector(
      onTap: () {},
      child: controller.urlsFoto == null
          ? Container(
              width: 140,
              height: 140,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/camara.png'),
                fit: BoxFit.cover,
              )))
          : ClipRRect(
              borderRadius: BorderRadius.circular(80.0),
              child: Image.file(
                controller.urlsFoto!,
                width: 140,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
