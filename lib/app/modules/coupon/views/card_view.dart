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
    return Scaffold(
        body: Stack(
      children: [
        Obx(() {
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
                        controller.registerCoupun(controller.cupoCump.value);

                        /*showDatePicker(
                          context: context,
                          initialDate: DateTime(DateTime.now().year,
                              DateTime.now().month, DateTime.now().day + 2),
                          firstDate: DateTime(DateTime.now().year,
                              DateTime.now().month, DateTime.now().day + 2),
                          lastDate: DateTime(DateTime.now().year,
                              DateTime.now().month, DateTime.now().day + 30),
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
                                      foregroundColor:
                                          Colors.black, // button text color
                                    ),
                                  )), // This will change to light theme.
                              child: SizedBox(child: child),
                            );
                          },
                        ).then((value) async {
                          try {
                            String fech_soli =
                                DateFormat('MM/dd/yyyy').format(value!);
                            controller.registerCoupun(
                                controller.cupoCump.value, fech_soli);
                          } catch (e) {
                            debugPrint("Error cerrar");
                          }
                        });*/
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
                                              color: HelperTheme.black,
                                              width: 3),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(
                                                  15.0) //                 <--- border radius here
                                              )),
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
                        /*if (cupo_cump == "0") {
                    _servermessage.build(
                        context, "No cuenta con cupos disponibles");
                  } else {
                    _solicitarcupos.build(
                        context,
                        cons_cupo,
                        nume_iden,
                        jefe_inme,
                        auto_emp1,
                        auto_emp2,
                        "MI CUMPLEAÑOS",
                        "1");
                  }*/
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
                                              color: HelperTheme.black,
                                              width: 3),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(
                                                  15.0) //                 <--- border radius here
                                              )),
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
                        /*if (cupo_cump == "0") {
                    _servermessage.build(
                        context, "No cuenta con cupos disponibles");
                  } else {
                    _solicitarcupos.build(
                        context,
                        cons_cupo,
                        nume_iden,
                        jefe_inme,
                        auto_emp1,
                        auto_emp2,
                        "MI CUMPLEAÑOS",
                        "1");
                  }*/
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
                                              color: HelperTheme.black,
                                              width: 3),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(
                                                  15.0) //                 <--- border radius here
                                              )),
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
                        /*if (cupo_cump == "0") {
                    _servermessage.build(
                        context, "No cuenta con cupos disponibles");
                  } else {
                    _solicitarcupos.build(
                        context,
                        cons_cupo,
                        nume_iden,
                        jefe_inme,
                        auto_emp1,
                        auto_emp2,
                        "MI CUMPLEAÑOS",
                        "1");
                  }*/
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
                                              color: HelperTheme.black,
                                              width: 3),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(
                                                  15.0) //                 <--- border radius here
                                              )),
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
                        /*if (cupo_cump == "0") {
                    _servermessage.build(
                        context, "No cuenta con cupos disponibles");
                  } else {
                    _solicitarcupos.build(
                        context,
                        cons_cupo,
                        nume_iden,
                        jefe_inme,
                        auto_emp1,
                        auto_emp2,
                        "MI CUMPLEAÑOS",
                        "1");
                  }*/
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
                                        'assets/images/ic_ingreso.png'),
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
                                              color: HelperTheme.black,
                                              width: 3),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(
                                                  15.0) //                 <--- border radius here
                                              )),
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
                        /*if (cupo_cump == "0") {
                    _servermessage.build(
                        context, "No cuenta con cupos disponibles");
                  } else {
                    _solicitarcupos.build(
                        context,
                        cons_cupo,
                        nume_iden,
                        jefe_inme,
                        auto_emp1,
                        auto_emp2,
                        "MI CUMPLEAÑOS",
                        "1");
                  }*/
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
                                        'assets/images/ic_salida.png'),
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
                                              color: HelperTheme.black,
                                              width: 3),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(
                                                  15.0) //                 <--- border radius here
                                              )),
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
                          children: const <Widget>[
                            Text("Cupos usados",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: HelperTheme.danger)),
                            Text("Cupos disponibles",
                                style: TextStyle(
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
                            lineHeight: 35.0,
                            percent: double.parse("10") / 100,
                            center: Text(
                                "${double.parse((double.parse(controller.totaUsad.value)).toStringAsFixed(1))} %",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
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
        }),
      ],
    ));
  }
}
