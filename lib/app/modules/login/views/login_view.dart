import 'package:conexion/app/ui/themes/helper_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../widgets/form_widget.dart';
import '../widgets/header_widget.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HelperTheme.primary,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: controller.headerHeight,
                  child: const HeaderWidget(),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    children: const [
                      FormWidget(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
