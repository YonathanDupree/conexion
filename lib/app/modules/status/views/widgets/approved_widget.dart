import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../ui/themes/helper_theme.dart';

class ApprovedWidget extends StatelessWidget {
  final String tipoCupo;
  final String estaSoli;
  final String horaSoli;
  final String fechSoli;
  final String nombEmpl;
  final String cargEmpl;
  final String horaApro;

  const ApprovedWidget(
      {Key? key,
      required this.tipoCupo,
      required this.estaSoli,
      required this.horaSoli,
      required this.fechSoli,
      required this.nombEmpl,
      required this.cargEmpl,
      required this.horaApro})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: SizedBox(
        height: 375.0,
        width: MediaQuery.of(context).size.width - 20,
        child: Card(
          color: Colors.green[50],
          shadowColor: Colors.blueGrey,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.credit_card,
                    color: Colors.green, size: 45),
                title: Text(
                  tipoCupo,
                  style: HelperTheme.titleBlackSM,
                ),
                subtitle: Text(
                  estaSoli,
                  style: HelperTheme.subTitleBlackSMApproved,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  thickness: 1.4,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Text('status_approved_fecha'.tr,
                    style: HelperTheme.labelBlackLg),
              ),
              Text(horaSoli, style: HelperTheme.labelBlackLg),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Text('status_approved_usar'.tr,
                    style: HelperTheme.labelBlackLg),
              ),
              Text(fechSoli, style: HelperTheme.labelBlackLg),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Text('status_approved_aprobado'.tr,
                    style: HelperTheme.labelBlackLg),
              ),
              Text(nombEmpl, style: HelperTheme.labelBlackLg),
              Text(cargEmpl, style: HelperTheme.labelBlackLg),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Text(horaApro, style: HelperTheme.labelBlackLg),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
