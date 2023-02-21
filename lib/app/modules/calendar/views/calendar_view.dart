import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../ui/themes/helper_theme.dart';
import '../controllers/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child:
                  Image(image: AssetImage('assets/images/restricciones.png')),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: HelperTheme.primary),
            child: const Text('Seleccionar fecha',
                style: TextStyle(color: HelperTheme.black)),
            onPressed: () async {
              showDatePicker(
                context: context,
                initialDate: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day + 2),
                firstDate: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day + 2),
                lastDate: DateTime(DateTime.now().year, DateTime.now().month,
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
                            foregroundColor: Colors.black, // button text color
                          ),
                        )), // This will change to light theme.
                    child: SizedBox(child: child),
                  );
                },
              ).then((value) async {
                try {
                  String fech_soli = DateFormat('MM/dd/yyyy').format(value!);
                  print(fech_soli);
                  //controller.registerCoupun(controller.cupoCump.value, fech_soli);
                } catch (e) {
                  debugPrint("Error cerrar");
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
