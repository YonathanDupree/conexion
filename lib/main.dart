import 'dart:io';

import 'package:conexion/app/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/splash/bindings/splash_binding.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  await GetStorage.init();
  GetStorage box = GetStorage();
  final lang = box.read("lang");
  Locale locale = const Locale('es', 'PE');

  if (lang != null) {
    locale = Locale('es', lang);
  }
  HttpOverrides.global = PostHttpOverrides();

  runApp(
    GetMaterialApp(
      translationsKeys: AppTranslation.translations,
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
