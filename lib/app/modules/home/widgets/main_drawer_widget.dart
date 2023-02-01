import 'package:conexion/app/modules/home/controllers/home_controller.dart';
import 'package:conexion/app/modules/home/widgets/header_drawer_widget.dart';
import 'package:conexion/app/ui/themes/helper_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class MainDrawerWidget extends StatelessWidget {
  const MainDrawerWidget({super.key});

  //final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(child: HeaderDrawerWidget()),
          ListTile(
            title: Text('Inicio'),
            tileColor:
                Get.currentRoute == Routes.HOME ? HelperTheme.primary : null,
            onTap: () {
              Get.back();
              Get.offNamed(Routes.HOME);
            },
          ),
          ListTile(
            title: Text('Mi perfil'),
            tileColor:
                Get.currentRoute == Routes.PROFILE ? HelperTheme.primary : null,
            onTap: () {
              Get.back();
              Get.offNamed(Routes.PROFILE);
            },
          ),
          ListTile(
            title: Text('Mi cuponera'),
            tileColor:
                Get.currentRoute == Routes.COUPON ? HelperTheme.primary : null,
            onTap: () {
              Get.back();
              Get.offNamed(Routes.COUPON);
            },
          ),
          ListTile(
            title: Text('Contáctanos'),
            tileColor:
                Get.currentRoute == Routes.CONTACT ? HelperTheme.primary : null,
            onTap: () {
              Get.back();
              Get.offNamed(Routes.CONTACT);
            },
          ),
          ListTile(
            title: Text('Salir'),
            onTap: () {
              Get.lazyPut<HomeController>(
                () => HomeController(),
              );
              Get.find<HomeController>().logout();
              Get.offAndToNamed(Routes.LOGIN);
            },
          ),
        ],
      ),
    );
  }
}
