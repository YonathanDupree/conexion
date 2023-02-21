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
            title: const Text('Mi cumpleaños'),
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
                  margin: EdgeInsets.fromLTRB(55, 10, 55, 10),
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
                                  helpText: 'Seleccione fecha',
                                  cancelText: 'Cerrar',
                                  confirmText: 'Ok',
                                  fieldLabelText: 'Ingrese fecha',
                                  errorFormatText: 'Formato invalido',
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
                                    String fech_soli =
                                        DateFormat('MM/dd/yyyy').format(value!);
                                    controller.changeselectedFecha(fech_soli);
                                  } catch (e) {
                                    debugPrint("Error cerrar");
                                  }
                                });
                              },
                              icon: const Icon(Icons
                                  .calendar_month), //icon data for elevated button
                              label: Text(
                                  controller.selectedFecha.value) //label text
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
                            onPressed: () {},
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          FloatingActionButton(
                            heroTag: "btn2",
                            child: Icon(Icons.filter_2),
                            elevation: 5.0,
                            backgroundColor: HelperTheme.danger,
                            foregroundColor: HelperTheme.primary,
                            onPressed: () {},
                          ),
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
