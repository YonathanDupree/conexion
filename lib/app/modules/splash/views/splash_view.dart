import 'package:conexion/app/ui/themes/helper_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HelperTheme.primary,
        body: Container(
          width: double.infinity,
          color: Colors.transparent,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(300.0),
              child: const Image(
                  image: AssetImage('assets/images/conexion.jpg'),
                  width: 250,
                  height: 250),
            ),
          ),
        ),
      ),
    );
  }
}
