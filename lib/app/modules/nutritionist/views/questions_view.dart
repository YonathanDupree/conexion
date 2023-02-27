// ignore_for_file: sort_child_properties_last

import 'package:conexion/app/modules/home/controllers/home_controller.dart';
import 'package:conexion/app/ui/themes/helper_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class QuestionsView extends GetView<HomeController> {
  const QuestionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Card(
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                child: const Text("- Preguntas frecuentes -",
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
                          /*_respuestapregunta.build(context,
                                "Es importante porque el nutricionista es el profesional encargado de evaluar y dar un diagnóstico nutricional de acuerdo con las necesidades y requerimientos de cada persona, para dar un buen manejo a su alimentación y asegurar su bienestar y buena salud.");*/
                        }),
                    padding: const EdgeInsets.fromLTRB(0, 5, 10, 5)),
              ],
            ),
            const SizedBox(
              height: 2.5,
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
                        /*_respuestapregunta.build(context,
                              "Tener una correcta hidratación diaria es muy importante porque ayuda a eliminar toxinas, mejorar el metabolismo, mejorar la digestión y ayuda a nivelar la temperatura corporal. La cantidad adecuada es aproximadamente de 8 a 10 vasos de agua, dependiendo de la actividad física y el peso corporal de la persona.");*/
                      }),
                ),
              ],
            ),
            const SizedBox(
              height: 2.5,
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
                        /*_respuestapregunta.build(context,
                              "Las frutas y verduras son importantes porque cumplen la función de regular el organismo, nos aportan vitaminas y minerales, antioxidantes y fibra soluble que el cuerpo necesita para mejorar el metabolismo, la digestión, previene el estreñimiento y además tener buenas defensas que el cuerpo necesita.");*/
                      }),
                ),
              ],
            ),
            const SizedBox(
              height: 2.5,
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
                        /*_respuestapregunta.build(context,
                              "Dejar de comer no ayuda a bajar de peso, puesto que el cuerpo necesita cubrir sus necesidades nutricionales para que funcione adecuadamente. Es por lo que se recomienda comer 5 veces al día cada 3 horas para ayudar a la digestión. Si en todo caso; el objetivo es bajar de peso, es necesario asesorarse con un nutricionista para que le haga un plan de nutrición adecuado en cantidad y calidad de alimentos.");*/
                      }),
                ),
              ],
            ),
            const SizedBox(
              height: 2.5,
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
                        /*_respuestapregunta.build(context,
                              "El tener una adecuada alimentación es la clave para tener una buena salud y un peso adecuado, pero no solo ello es lo único que se debe hacer, lo recomendable es hidratarse diariamente, realizar actividad física de 30 a 40 minutos y descansar de 6 a 7 horas para que el cuerpo se reponga y realice sus actividades de una manera sana.");*/
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
                      onTap: () async {
                        await launch('tel:' +
                            controller.specialist[0].celuSani.toString());
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
                        final Uri params = Uri(
                          scheme: 'mailto',
                          path: controller.specialist[0].mailSani.toString(),
                          query:
                              'subject=Reservar cita&body=Buen día deseo reservar una cita', //add subject and body here
                        );
                        var url = params.toString();

                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
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
                        if (await canLaunch("https://wa.me/+51" +
                            controller.specialist[0].celuSani.toString())) {
                          await launch("https://wa.me/+51" + "966105060");
                        }
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
                    child: const Text(
                      "Para una consulta rápida me puede contactar por una llamada, correo o vía whatsapp",
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
