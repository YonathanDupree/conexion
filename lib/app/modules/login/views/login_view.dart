import 'package:conexion/app/modules/login/views/widgets/layer_one_widget.dart';
import 'package:conexion/app/modules/login/views/widgets/layer_three_widget.dart';
import 'package:conexion/app/modules/login/views/widgets/layer_two_widget.dart';
import 'package:conexion/app/ui/themes/helper_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HelperTheme.primary,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 59,
            child: Container(
              color: Colors.transparent,
              child: const Center(
                child: Image(
                    image: AssetImage('assets/images/logo_texto.png'),
                    width: 200,
                    height: 200),
              ),
            ),
          ),
          Positioned(top: 140, right: 0, bottom: 0, child: LayerOneWidget()),
          Positioned(top: 170, right: 0, bottom: 28, child: LayerTwoWidget()),
          const Positioned(
              top: 90, right: 0, bottom: 0, child: LayerThreeWidget()),
        ],
      ),
    );
  }
}
