import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../ui/themes/helper_theme.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Container(
        decoration: HelperTheme().buttonBoxDecoration(),
        child: ElevatedButton(
            style: HelperTheme().buttonStyle(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.login,
                  size: 24.0,
                  color: HelperTheme.darkText,
                ),
                SizedBox(width: 10.0),
                Text(
                  'Cerrar sesión',
                  style: HelperTheme.textButtonBlackXl,
                )
              ],
            ),
            onPressed: () async {
              controller.logout();
              Get.offAndToNamed(Routes.LOGIN);
            }),
      ),
    );
  }
}
