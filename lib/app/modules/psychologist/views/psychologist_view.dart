import 'package:conexion/app/modules/psychologist/views/presentation_view.dart';
import 'package:conexion/app/modules/psychologist/views/questions_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../ui/themes/helper_theme.dart';
import '../controllers/psychologist_controller.dart';

class PsychologistView extends GetView<PsychologistController> {
  const PsychologistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HelperTheme.white,
        appBar: AppBar(
          title: Text('specialist_reserve'.tr),
          centerTitle: true,
          backgroundColor: HelperTheme.primary,
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            PresentationView(),
            const SizedBox(
              height: 5.0,
            ),
            QuestionsView(),
          ]),
        ));
  }
}
