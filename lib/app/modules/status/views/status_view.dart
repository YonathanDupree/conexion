import 'package:conexion/app/modules/status/views/widgets/anulado_widget.dart';
import 'package:conexion/app/modules/status/views/widgets/aprobado_widget.dart';
import 'package:conexion/app/modules/status/views/widgets/observado_widget.dart';
import 'package:conexion/app/modules/status/views/widgets/pendiente_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/status_controller.dart';

class StatusView extends GetView<StatusController> {
  const StatusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
          child: Center(
            child: Container(
                child: controller.estaSoli.value == "Pendiente"
                    ? PendienteWidget(
                        tipoCupo: controller.tipoCupo.value,
                        estaSoli: controller.estaSoli.value,
                        horaSoli: controller.horaSoli.value,
                        fechSoli: controller.fechSoli.value)
                    : controller.estaSoli.value == "Aprobado"
                        ? AprobadoWidget(
                            tipoCupo: controller.tipoCupo.value,
                            estaSoli: controller.estaSoli.value,
                            horaSoli: controller.horaSoli.value,
                            fechSoli: controller.fechSoli.value,
                            nombEmpl: controller.nombEmpl.value,
                            cargEmpl: controller.cargEmpl.value,
                            horaApro: controller.horaApro.value,
                          )
                        : controller.estaSoli.value == "Observado"
                            ? ObservadoWidget(
                                tipoCupo: controller.tipoCupo.value,
                                estaSoli: controller.estaSoli.value,
                                horaSoli: controller.horaSoli.value,
                                fechSoli: controller.fechSoli.value,
                                nombEmpl: controller.nombEmpl.value,
                                cargEmpl: controller.cargEmpl.value,
                                horaApro: controller.horaApro.value,
                                anotObse: controller.anotObse.value,
                              )
                            : controller.estaSoli.value == "Anulado"
                                ? AnuladoWidget(
                                    tipoCupo: controller.tipoCupo.value,
                                    estaSoli: controller.estaSoli.value,
                                    horaSoli: controller.horaSoli.value,
                                    fechSoli: controller.fechSoli.value,
                                    nombEmpl: controller.nombEmpl.value,
                                    cargEmpl: controller.cargEmpl.value,
                                    horaApro: controller.horaApro.value,
                                    anotObse: controller.anotObse.value,
                                  )
                                : const Center(
                                    child: FadeInImage(
                                    image:
                                        AssetImage('assets/images/status.png'),
                                    placeholder:
                                        AssetImage('assets/images/loading.gif'),
                                    fit: BoxFit.cover,
                                  ))),
          ),
        ));
  }
}
