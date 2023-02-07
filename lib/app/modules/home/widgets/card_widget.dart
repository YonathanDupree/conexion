import 'package:conexion/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      InkWell(
        child: Obx(() => Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Colors.transparent,
            margin: const EdgeInsets.fromLTRB(10, 0, 2.5, 0),
            elevation: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: controller.specialist.isEmpty
                  ? Container(
                      width: 150,
                      height: 140,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/loading.gif'),
                        fit: BoxFit.cover,
                      )))
                  : FadeInImage(
                      image: NetworkImage(
                          controller.getSpecNutri()[0].imagPort.toString()),
                      placeholder:
                          const AssetImage('assets/images/loading.gif'),
                      fit: BoxFit.fill,
                      height: 140,
                      width: 150),
            ))),
        onTap: () async {
          print(controller.specialist[0].imagPort.toString());
          print(controller.getSliderI().length);
        },
      ),
      InkWell(
          child: Obx(() => Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Colors.transparent,
              margin: const EdgeInsets.fromLTRB(2.5, 0, 10, 0),
              elevation: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: controller.specialist.isEmpty
                    ? Container(
                        width: 150,
                        height: 140,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/images/loading.gif'),
                          fit: BoxFit.cover,
                        )))
                    : FadeInImage(
                        image: NetworkImage(
                            controller.getSpecPsyc()[0].imagPort.toString()),
                        placeholder:
                            const AssetImage('assets/images/loading.gif'),
                        fit: BoxFit.fill,
                        height: 140,
                        width: 150),
              ))),
          onTap: () async {
            print(controller.specialist[1].imagPort.toString());
          }),
    ]);
  }
}
