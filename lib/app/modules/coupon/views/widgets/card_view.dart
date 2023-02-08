import 'package:conexion/app/ui/themes/helper_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CardView extends GetView {
  const CardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
                    margin: const EdgeInsets.only(top: 10),
                    child: ClipRRect(
                      child: Column(
                        children: <Widget>[
                          const FadeInImage(
                              image:
                                  AssetImage('assets/images/ic_cumpleanos.png'),
                              placeholder:
                                  AssetImage('assets/images/loading.gif'),
                              fit: BoxFit.cover,
                              height: 130,
                              width: 145),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: /*url_cump == null
                                ? */
                                  const FadeInImage(
                                      image: NetworkImage(
                                          "https://intranet2per.azzorti.co/desarrollo/libra/public/img/0.png"),
                                      placeholder: AssetImage(
                                          'assets/images/loading.gif'),
                                      fit: BoxFit.cover,
                                      height: 25,
                                      width: 25)
                              /*: FadeInImage(
                                    image: NetworkImage(url_cump),
                                    placeholder: AssetImage(
                                        'assets/images/loading.gif'),
                                    fit: BoxFit.cover,
                                    height: 25,
                                    width: 25),*/
                              )
                        ],
                      ),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  /*if (cupo_mome == "0") {
                    _servermessage.build(
                        context, "No cuenta con cupos disponibles");
                  } else if (cupo_mome == "2") {
                    _solicitarcupones.build(
                        context,
                        cons_cupo,
                        nume_iden,
                        jefe_inme,
                        auto_emp1,
                        auto_emp2,
                        "MI MOMENTO ESPECIAL");
                  } else {
                    _solicitarcupos.build(
                        context,
                        cons_cupo,
                        nume_iden,
                        jefe_inme,
                        auto_emp1,
                        auto_emp2,
                        "MI MOMENTO ESPECIAL",
                        "1");
                  }*/
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 10,
                    margin: EdgeInsets.only(top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Column(
                        children: <Widget>[
                          const FadeInImage(
                              image: AssetImage(
                                  'assets/images/ic_momentoespecial.png'),
                              placeholder:
                                  AssetImage('assets/images/loading.gif'),
                              fit: BoxFit.cover,
                              height: 130,
                              width: 145),
                          Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: /*url_mome == null
                                ? */
                                  const FadeInImage(
                                      image: NetworkImage(
                                          "https://intranet2per.azzorti.co/desarrollo/libra/public/img/0.png"),
                                      placeholder: AssetImage(
                                          'assets/images/loading.gif'),
                                      fit: BoxFit.cover,
                                      height: 25,
                                      width: 25)
                              /*: FadeInImage(
                                    image: NetworkImage(url_mome),
                                    placeholder: AssetImage(
                                        'assets/images/loading.gif'),
                                    fit: BoxFit.cover,
                                    height: 25,
                                    width: 25),*/
                              )
                        ],
                      ),
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  /*if (cupo_cita == "0") {
            _servermessage.build(context, "No cuenta con cupos disponibles");
          } else if (cupo_cita == "2") {
            _solicitarcupones.build(context, cons_cupo, nume_iden, jefe_inme,
                auto_emp1, auto_emp2, "CITA MEDICA");
          } else {
            _solicitarcupos.build(context, cons_cupo, nume_iden, jefe_inme,
                auto_emp1, auto_emp2, "CITA MEDICA", "1");
          }*/
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 10,
                    margin: EdgeInsets.only(top: 10),
                    child: ClipRRect(
                      child: Column(
                        children: <Widget>[
                          const FadeInImage(
                              image:
                                  AssetImage('assets/images/ic_citamedica.png'),
                              placeholder:
                                  AssetImage('assets/images/loading.gif'),
                              fit: BoxFit.cover,
                              height: 130,
                              width: 145),
                          Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: /*url_cita == null
                        ? */
                                  const FadeInImage(
                                      image: NetworkImage(
                                          "https://intranet2per.azzorti.co/desarrollo/libra/public/img/0.png"),
                                      placeholder: AssetImage(
                                          'assets/images/loading.gif'),
                                      fit: BoxFit.cover,
                                      height: 25,
                                      width: 25)
                              /*: FadeInImage(
                            image: NetworkImage(url_cita),
                            placeholder:
                                AssetImage('assets/images/loading.gif'),
                            fit: BoxFit.cover,
                            height: 25,
                            width: 25),*/
                              )
                        ],
                      ),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  /*if (cupo_tram == "0") {
            _servermessage.build(context, "No cuenta con cupos disponibles");
          } else if (cupo_tram == "2") {
            _solicitarcupones.build(context, cons_cupo, nume_iden, jefe_inme,
                auto_emp1, auto_emp2, "MIS TRAMITES");
          } else {
            _solicitarcupos.build(context, cons_cupo, nume_iden, jefe_inme,
                auto_emp1, auto_emp2, "MIS TRAMITES", "1");
          }*/
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 10,
                    margin: EdgeInsets.only(top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Column(
                        children: <Widget>[
                          const FadeInImage(
                              image: AssetImage(
                                  'assets/images/ic_mistramites.png'),
                              placeholder:
                                  AssetImage('assets/images/loading.gif'),
                              fit: BoxFit.cover,
                              height: 130,
                              width: 145),
                          Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: /*url_tram == null
                        ? */
                                  const FadeInImage(
                                      image: NetworkImage(
                                          "https://intranet2per.azzorti.co/desarrollo/libra/public/img/0.png"),
                                      placeholder: AssetImage(
                                          'assets/images/loading.gif'),
                                      fit: BoxFit.cover,
                                      height: 25,
                                      width: 25)
                              /*: FadeInImage(
                            image: NetworkImage(url_tram),
                            placeholder:
                                AssetImage('assets/images/loading.gif'),
                            fit: BoxFit.cover,
                            height: 25,
                            width: 25),*/
                              )
                        ],
                      ),
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  /*if (cupo_ingr == "0") {
            _servermessage.build(context, "No cuenta con cupos disponibles");
          } else {
            _solicitarcupos.build(context, cons_cupo, nume_iden, jefe_inme,
                auto_emp1, auto_emp2, "MI INGRESO", "1");
          }*/
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 10,
                    margin: EdgeInsets.only(top: 10),
                    child: ClipRRect(
                      child: Column(
                        children: <Widget>[
                          const FadeInImage(
                              image: AssetImage('assets/images/ic_ingreso.png'),
                              placeholder:
                                  AssetImage('assets/images/loading.gif'),
                              fit: BoxFit.cover,
                              height: 130,
                              width: 145),
                          Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: /*url_ingr == null
                        ? */
                                  const FadeInImage(
                                      image: NetworkImage(
                                          "https://intranet2per.azzorti.co/desarrollo/libra/public/img/0.png"),
                                      placeholder: AssetImage(
                                          'assets/images/loading.gif'),
                                      fit: BoxFit.cover,
                                      height: 25,
                                      width: 25)
                              /*: FadeInImage(
                            image: NetworkImage(url_ingr),
                            placeholder:
                                AssetImage('assets/images/loading.gif'),
                            fit: BoxFit.cover,
                            height: 25,
                            width: 25),*/
                              )
                        ],
                      ),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  /*if (cupo_sali == "0") {
            _servermessage.build(context, "No cuenta con cupos disponibles");
          } else {
            _solicitarcupos.build(context, cons_cupo, nume_iden, jefe_inme,
                auto_emp1, auto_emp2, "MI SALIDA", "1");
          }*/
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 10,
                    margin: EdgeInsets.only(top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Column(
                        children: <Widget>[
                          const FadeInImage(
                              image: AssetImage('assets/images/ic_salida.png'),
                              placeholder:
                                  AssetImage('assets/images/loading.gif'),
                              fit: BoxFit.cover,
                              height: 130,
                              width: 145),
                          Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: /*url_sali == null
                        ? */
                                  const FadeInImage(
                                      image: NetworkImage(
                                          "https://intranet2per.azzorti.co/desarrollo/libra/public/img/0.png"),
                                      placeholder: AssetImage(
                                          'assets/images/loading.gif'),
                                      fit: BoxFit.cover,
                                      height: 25,
                                      width: 25)
                              /*: FadeInImage(
                            image: NetworkImage(url_sali),
                            placeholder:
                                AssetImage('assets/images/loading.gif'),
                            fit: BoxFit.cover,
                            height: 25,
                            width: 25),*/
                              )
                        ],
                      ),
                    )),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
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
                  children: "tota_usad" == null
                      ? <Widget>[
                          LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width - 50,
                            animation: true,
                            animationDuration: 2000,
                            lineHeight: 35.0,
                            percent: 0,
                            center: const Text('0.0 %',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            progressColor: HelperTheme.primary,
                            barRadius: const Radius.circular(16),
                          ),
                        ]
                      : <Widget>[
                          LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width - 50,
                            animation: true,
                            animationDuration: 2000,
                            lineHeight: 35.0,
                            percent: double.parse("10") / 100,
                            center: Text(
                                double.parse((double.parse("20"))
                                            .toStringAsFixed(1))
                                        .toString() +
                                    " %",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            progressColor: HelperTheme.primary,
                            barRadius: const Radius.circular(16),
                          ),
                        ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
