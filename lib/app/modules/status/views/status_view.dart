import 'package:conexion/app/modules/status/views/widgets/canceled_widget.dart';
import 'package:conexion/app/modules/status/views/widgets/approved_widget.dart';
import 'package:conexion/app/modules/status/views/widgets/observed_widget.dart';
import 'package:conexion/app/modules/status/views/widgets/earring_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../ui/widgets/loading_widget.dart';
import '../controllers/status_controller.dart';

class StatusView extends GetView<StatusController> {
  const StatusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const LoadingWidget();
      }
      return Center(
        child: SingleChildScrollView(
          child: Container(
              child: controller.estaSoli.value == 'status_earring'.tr
                  ? EarringWidget(
                      tipoCupo: controller.tipoCupo.value,
                      estaSoli: controller.estaSoli.value,
                      horaSoli: controller.horaSoli.value,
                      fechSoli: controller.fechSoli.value)
                  : controller.estaSoli.value == 'status_approved'.tr
                      ? ApprovedWidget(
                          tipoCupo: controller.tipoCupo.value,
                          estaSoli: controller.estaSoli.value,
                          horaSoli: controller.horaSoli.value,
                          fechSoli: controller.fechSoli.value,
                          nombEmpl: controller.nombEmpl.value,
                          cargEmpl: controller.cargEmpl.value,
                          horaApro: controller.horaApro.value,
                        )
                      : controller.estaSoli.value == 'status_Observed'.tr
                          ? ObservedWidget(
                              tipoCupo: controller.tipoCupo.value,
                              estaSoli: controller.estaSoli.value,
                              horaSoli: controller.horaSoli.value,
                              fechSoli: controller.fechSoli.value,
                              nombEmpl: controller.nombEmpl.value,
                              cargEmpl: controller.cargEmpl.value,
                              horaApro: controller.horaApro.value,
                              anotObse: controller.anotObse.value,
                            )
                          : controller.estaSoli.value == 'status_canceled'.tr
                              ? CanceledWidget(
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
                                  image: AssetImage('assets/images/status.png'),
                                  placeholder:
                                      AssetImage('assets/images/loading.gif'),
                                  fit: BoxFit.cover,
                                ))),
        ),
      );
    });
  }
}
