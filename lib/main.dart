import 'package:conexion/app/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/splash/bindings/splash_binding.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  GetStorage box = GetStorage();
  final lang = box.read("lang");
  Locale locale = const Locale('es', 'PE');

  if (lang != null) {
    locale = Locale('es', lang);
  }

  runApp(
    GetMaterialApp(
      locale: locale,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      theme: appThemeLigth,
      defaultTransition: Transition.fade,
      initialBinding: SplashBinding(),
      getPages: AppPages.routes,
    ),
  );
}
