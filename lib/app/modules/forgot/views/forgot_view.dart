import 'package:conexion/app/modules/forgot/views/widgets/form_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../ui/themes/helper_theme.dart';
import '../controllers/forgot_controller.dart';

class ForgotView extends GetView<ForgotController> {
  const ForgotView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HelperTheme.white,
      appBar: AppBar(
        title: Text('forgot_title'.tr),
        centerTitle: true,
        backgroundColor: HelperTheme.primary,
      ),
      body: Center(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: const FormWidget(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
