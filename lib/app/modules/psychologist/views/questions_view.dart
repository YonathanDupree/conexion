// ignore_for_file: sort_child_properties_last

import 'package:conexion/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../ui/themes/helper_theme.dart';

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
                        "¿Razones para ir Psicólogo?",
                        style: HelperTheme.labelBackMd,
                      ),
                      onTap: () {
                        controller.answer("1", "P");
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
                        "¿Qué me voy a encontrar cuando llegue a la consulta?",
                        style: HelperTheme.labelBackMd,
                      ),
                      onTap: () {
                        controller.answer("2", "P");
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
                        "¿Una terapia es como ir a clase?",
                        style: HelperTheme.labelBackMd,
                      ),
                      onTap: () {
                        controller.answer("3", "P");
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
                        "¿Cuándo es necesario ir a un psicólogo?",
                        style: HelperTheme.labelBackMd,
                      ),
                      onTap: () {
                        controller.answer("4", "P");
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
                        "¿Y si me da vergüenza hablar de un tema?",
                        style: HelperTheme.labelBackMd,
                      ),
                      onTap: () {
                        controller.answer("5", "P");
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
                        "¿Si voy a ver a un psicólogo es porque estoy «enfermo», «perturbado» o “loco”?",
                        style: HelperTheme.labelBackMd,
                      ),
                      onTap: () {
                        controller.answer("6", "P");
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
                        "¿Cómo me preparo para mi primera sesión?",
                        style: HelperTheme.labelBackMd,
                      ),
                      onTap: () {
                        controller.answer("7", "P");
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
                        "¿Qué es el principio de la confidencialidad?",
                        style: HelperTheme.labelBackMd,
                      ),
                      onTap: () {
                        controller.answer("8", "P");
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
