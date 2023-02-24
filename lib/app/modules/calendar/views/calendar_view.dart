import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../ui/themes/helper_theme.dart';
import '../controllers/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(
              controller.couponController.tipoCupo.value,
              style: HelperTheme.titleBlackMd,
            ),
            centerTitle: true,
            backgroundColor: HelperTheme.primary,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.transparent,
                child: const Center(
                  child: Image(
                      image: AssetImage('assets/images/restricciones.png')),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 10,
                  margin: const EdgeInsets.fromLTRB(55, 10, 55, 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: HelperTheme.info),
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day + 2),
                                  firstDate: DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day + 2),
                                  lastDate: DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day + 30),
                                  helpText: 'calendar_seleccionar'.tr,
                                  cancelText: 'calendar_close'.tr,
                                  confirmText: 'calendar_ok'.tr,
                                  fieldLabelText: 'calendar_ingrese'.tr,
                                  errorFormatText: 'calendar_formato'.tr,
                                  builder: (context, child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                          primaryColor: HelperTheme.primary,
                                          colorScheme: const ColorScheme.light(
                                              primary: HelperTheme.primary,
                                              onPrimary: Colors.black),
                                          buttonTheme: const ButtonThemeData(
                                            textTheme: ButtonTextTheme.primary,
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              foregroundColor: Colors
                                                  .black, // button text color
                                            ),
                                          )), // This will change to light theme.
                                      child: SizedBox(child: child),
                                    );
                                  },
                                ).then((value) async {
                                  try {
                                    String fechSoli =
                                        DateFormat('MM/dd/yyyy').format(value!);
                                    controller.changeselectedFecha(fechSoli);
                                  } catch (e) {
                                    debugPrint("Error cerrar");
                                  }
                                });
                              },
                              icon: const Icon(Icons
                                  .calendar_month), //icon data for elevated button
                              label:
                                  Text(controller.fechSoli.value) //label text
                              ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: "btn1",
                            child: Icon(Icons.filter_1),
                            elevation: 5.0,
                            backgroundColor: HelperTheme.success,
                            foregroundColor: HelperTheme.primary,
                            onPressed: () {
                              controller.registerCoupon(1);
                            },
                          ),
                          (controller.couponController.tipoCupo.value ==
                                          'coupon_momento_especial'.tr ||
                                      controller.couponController.tipoCupo
                                              .value ==
                                          'coupon_cita_medica'.tr ||
                                      controller.couponController.tipoCupo
                                              .value ==
                                          'coupon_tramites'.tr) &&
                                  controller.couponController.cantCupo.value > 1
                              ? Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: FloatingActionButton(
                                    heroTag: "btn2",
                                    child: Icon(Icons.filter_2),
                                    elevation: 5.0,
                                    backgroundColor: HelperTheme.danger,
                                    foregroundColor: HelperTheme.primary,
                                    onPressed: () {
                                      controller.registerCoupon(2);
                                    },
                                  ),
                                )
                              : Visibility(
                                  visible: false,
                                  maintainSize: false,
                                  child: Container()),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  )),
            ],
          ),
        ));
  }
}
