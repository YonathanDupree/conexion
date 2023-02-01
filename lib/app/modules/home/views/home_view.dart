import 'package:conexion/app/modules/home/widgets/main_drawer_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../ui/themes/helper_theme.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HelperTheme.primary,
        title: const Text("Conexión",
            style: const TextStyle(color: HelperTheme.black)),
      ),
      body: const Center(
        child: Text('Home'),
      ),
      drawer: MainDrawerWidget(),
    );
  }
}

/*controller.logout();
Get.offAndToNamed(Routes.LOGIN);*/
