import 'package:conexion/app/modules/home/controllers/home_controller.dart';
import 'package:conexion/app/modules/home/views/widgets/footer_drawer_widget.dart';
import 'package:conexion/app/modules/home/views/widgets/header_drawer_widget.dart';
import 'package:conexion/app/ui/themes/helper_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class MainDrawerWidget extends StatelessWidget {
  const MainDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
              color: Colors.black,
              height: 200,
              child: const DrawerHeader(child: HeaderDrawerWidget())),
          ListTile(
            title: Text('home_home'.tr, style: HelperTheme.subTitleLigh),
            leading:
                const Icon(Icons.home, size: 25, color: HelperTheme.secondary),
            tileColor:
                Get.currentRoute == Routes.HOME ? HelperTheme.primary : null,
            onTap: () {
              Get.back();
              Get.offNamed(Routes.HOME);
            },
          ),
          /*ListTile(
            title: Text('profile_profile'.tr, style: HelperTheme.subTitleLigh),
            leading: const Icon(Icons.person,
                size: 25, color: HelperTheme.secondary),
            tileColor:
                Get.currentRoute == Routes.PROFILE ? HelperTheme.primary : null,
            onTap: () {
              Get.back();
              Get.offNamed(Routes.PROFILE);
            },
          ),*/
          ListTile(
            title: Text('coupon_coupon'.tr, style: HelperTheme.subTitleLigh),
            leading: const Icon(Icons.credit_card,
                size: 25, color: HelperTheme.secondary),
            tileColor:
                Get.currentRoute == Routes.COUPON ? HelperTheme.primary : null,
            onTap: () {
              Get.back();
              Get.offNamed(Routes.COUPON);
            },
          ),
          /*ListTile(
            title: Text('contact_contact'.tr, style: HelperTheme.subTitleLigh),
            leading: const Icon(Icons.contact_phone_sharp,
                size: 25, color: HelperTheme.secondary),
            tileColor:
                Get.currentRoute == Routes.CONTACT ? HelperTheme.primary : null,
            onTap: () {
              Get.back();
              Get.offNamed(Routes.CONTACT);
            },
          ),*/
          ListTile(
            title: Text('exit_exit'.tr, style: HelperTheme.subTitleLigh),
            leading: const Icon(Icons.exit_to_app_outlined,
                size: 25, color: HelperTheme.secondary),
            onTap: () async {
              Get.lazyPut<HomeController>(
                () => HomeController(),
              );
              Get.find<HomeController>().logout();
              Get.offAllNamed(Routes.LOGIN);
            },
          ),
          /*Container(
              child: const Align(
                  alignment: FractionalOffset.bottomRight,
                  child: FooterDrawerWidget())),*/
        ],
      ),
    );
  }
}
