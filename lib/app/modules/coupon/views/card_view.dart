import 'package:conexion/app/ui/themes/helper_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../ui/widgets/loading_widget.dart';
import '../controllers/coupon_controller.dart';

class CardView extends GetView<CouponController> {
  const CardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const LoadingWidget();
      }
      return SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.openCalendar(
                        controller.cupoCump.value, 'coupon_cumpleanos'.tr);
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 10,
                      child: ClipRRect(
                        child: Stack(
                          children: <Widget>[
                            const FadeInImage(
                                image: AssetImage(
                                    'assets/images/ic_cumpleanos.png'),
                                placeholder:
                                    AssetImage('assets/images/loading.gif'),
                                fit: BoxFit.cover,
                                height: 140),
                            Positioned(
                              top: 105,
                              left: 5,
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: HelperTheme.white, width: 1),
                                  ),
                                  child: FadeInImage(
                                      image: NetworkImage(
                                          controller.urlCump.toString()),
                                      placeholder: const AssetImage(
                                          'assets/images/loading.gif'),
                                      fit: BoxFit.cover,
                                      width: 25)),
                            )
                          ],
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    controller.openCalendar(controller.cupoMome.value,
                        'coupon_momento_especial'.tr);
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 10,
                      child: ClipRRect(
                        child: Stack(
                          children: <Widget>[
                            const FadeInImage(
                                image: AssetImage(
                                    'assets/images/ic_momentoespecial.png'),
                                placeholder:
                                    AssetImage('assets/images/loading.gif'),
                                fit: BoxFit.cover,
                                height: 140),
                            Positioned(
                              top: 105,
                              left: 5,
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: HelperTheme.white, width: 1),
                                  ),
                                  child: FadeInImage(
                                      image: NetworkImage(
                                          controller.urlMome.toString()),
                                      placeholder: const AssetImage(
                                          'assets/images/loading.gif'),
                                      fit: BoxFit.cover,
                                      width: 25)),
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.openCalendar(
                        controller.cupoCita.value, 'coupon_cita_medica'.tr);
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 10,
                      child: ClipRRect(
                        child: Stack(
                          children: <Widget>[
                            const FadeInImage(
                                image: AssetImage(
                                    'assets/images/ic_citamedica.png'),
                                placeholder:
                                    AssetImage('assets/images/loading.gif'),
                                fit: BoxFit.cover,
                                height: 140),
                            Positioned(
                              top: 105,
                              left: 5,
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: HelperTheme.white, width: 1),
                                  ),
                                  child: FadeInImage(
                                      image: NetworkImage(
                                          controller.urlCita.toString()),
                                      placeholder: const AssetImage(
                                          'assets/images/loading.gif'),
                                      fit: BoxFit.cover,
                                      width: 25)),
                            )
                          ],
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    controller.openCalendar(
                        controller.cupoTram.value, 'coupon_tramites'.tr);
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 10,
                      child: ClipRRect(
                        child: Stack(
                          children: <Widget>[
                            const FadeInImage(
                                image: AssetImage(
                                    'assets/images/ic_mistramites.png'),
                                placeholder:
                                    AssetImage('assets/images/loading.gif'),
                                fit: BoxFit.cover,
                                height: 140),
                            Positioned(
                              top: 105,
                              left: 5,
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: HelperTheme.white, width: 1),
                                  ),
                                  child: FadeInImage(
                                      image: NetworkImage(
                                          controller.urlTram.toString()),
                                      placeholder: const AssetImage(
                                          'assets/images/loading.gif'),
                                      fit: BoxFit.cover,
                                      width: 25)),
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.openCalendar(
                        controller.cupoIngr.value, 'coupon_ingreso'.tr);
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 10,
                      child: ClipRRect(
                        child: Stack(
                          children: <Widget>[
                            const FadeInImage(
                                image:
                                    AssetImage('assets/images/ic_ingreso.png'),
                                placeholder:
                                    AssetImage('assets/images/loading.gif'),
                                fit: BoxFit.cover,
                                height: 140),
                            Positioned(
                              top: 105,
                              left: 5,
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: HelperTheme.white, width: 1),
                                  ),
                                  child: FadeInImage(
                                      image: NetworkImage(
                                          controller.urlIngr.toString()),
                                      placeholder: const AssetImage(
                                          'assets/images/loading.gif'),
                                      fit: BoxFit.cover,
                                      width: 25)),
                            )
                          ],
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    controller.openCalendar(
                        controller.cupoSali.value, 'coupon_salida'.tr);
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 10,
                      child: ClipRRect(
                        child: Stack(
                          children: <Widget>[
                            const FadeInImage(
                                image:
                                    AssetImage('assets/images/ic_salida.png'),
                                placeholder:
                                    AssetImage('assets/images/loading.gif'),
                                fit: BoxFit.cover,
                                height: 140),
                            Positioned(
                              top: 105,
                              left: 5,
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: HelperTheme.white, width: 1)),
                                  child: FadeInImage(
                                      image: NetworkImage(
                                          controller.urlSali.value),
                                      placeholder: const AssetImage(
                                          'assets/images/loading.gif'),
                                      fit: BoxFit.cover,
                                      width: 25)),
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('coupon_usados'.tr,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: HelperTheme.danger)),
                        Text('coupon_disponible'.tr,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: HelperTheme.danger)),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width - 50,
                        animation: true,
                        animationDuration: 2000,
                        lineHeight: 30.0,
                        percent: double.parse(controller.totaUsad.value) / 100,
                        center: Text(
                            "${double.parse((double.parse(controller.totaUsad.value)).toStringAsFixed(1))} %",
                            style: HelperTheme.labelBlackLg),
                        progressColor: HelperTheme.primary,
                        barRadius: const Radius.circular(16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
