// ignore_for_file: sort_child_properties_last

import 'package:conexion/app/modules/home/controllers/home_controller.dart';
import 'package:conexion/app/ui/themes/helper_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class QuestionsView extends GetView<HomeController> {
  QuestionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Card(
        color: HelperTheme.nearlyWhite,
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                child: Text('specialist_questions'.tr,
                    style: HelperTheme.titleBlackSM),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0)),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Container(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset(
                      'assets/images/pregunta.png',
                      width: 20.0,
                      height: 20.0,
                      scale: 1.0,
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 5, 10, 5)),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: InkWell(
                      child: const Text(
                        "¿Por qué es importante ir a un nutricionista?",
                        style: HelperTheme.labelBackMd,
                      ),
                      onTap: () {
                        controller.answer("1");
                      }),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Container(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset(
                      'assets/images/pregunta.png',
                      width: 20.0,
                      height: 20.0,
                      scale: 1.0,
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 5, 10, 5)),
                Expanded(
                  child: InkWell(
                      child: const Text(
                        "¿Por qué es importante tomar agua, y cuánto debe tomar al día?",
                        style: HelperTheme.labelBackMd,
                      ),
                      onTap: () {
                        controller.answer("2");
                      }),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Container(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset(
                      'assets/images/pregunta.png',
                      width: 20.0,
                      height: 20.0,
                      scale: 1.0,
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 5, 10, 5)),
                Expanded(
                  child: InkWell(
                      child: const Text(
                        "¿Por qué son importantes consumir frutas y verduras?",
                        style: HelperTheme.labelBackMd,
                      ),
                      onTap: () {
                        controller.answer("3");
                      }),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset(
                      'assets/images/pregunta.png',
                      width: 20.0,
                      height: 20.0,
                      scale: 1.0,
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 5, 10, 5)),
                Expanded(
                  child: InkWell(
                      child: const Text(
                        "¿Para bajar de peso es necesario dejar de comer en las noches?",
                        style: HelperTheme.labelBackMd,
                      ),
                      onTap: () {
                        controller.answer("4");
                      }),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Container(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset(
                      'assets/images/pregunta.png',
                      width: 20.0,
                      height: 20.0,
                      scale: 1.0,
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 5, 10, 5)),
                Expanded(
                  child: InkWell(
                      child: const Text(
                        "¿Con solo comer sano es suficiente para mantener un peso adecuado?",
                        style: HelperTheme.labelBackMd,
                      ),
                      onTap: () {
                        controller.answer("5");
                      }),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                      child: Image.asset('assets/images/llamada.png',
                          width: 50.0,
                          height: 50.0,
                          scale: 1.0,
                          alignment: Alignment.topRight),
                      onTap: () {
                        controller.callCelu(0);
                      }),
                ),
                Expanded(
                  child: InkWell(
                      child: Image.asset(
                        'assets/images/correo.png',
                        width: 50.0,
                        height: 50.0,
                        scale: 1.0,
                      ),
                      onTap: () async {
                        controller.sendMail(0);
                      }),
                ),
                Expanded(
                  child: InkWell(
                      child: Image.asset('assets/images/whatsapp.png',
                          width: 50.0,
                          height: 50.0,
                          scale: 1.0,
                          alignment: Alignment.topLeft),
                      onTap: () async {
                        controller.sendWhatsapp(0);
                      }),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    width: 300,
                    child: Text(
                      'specialist_consultation'.tr,
                      style: HelperTheme.labelBlackXS,
                      textAlign: TextAlign.center,
                    ),
                    padding: const EdgeInsets.fromLTRB(0, 5, 10, 5)),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
