import 'package:conexion/app/modules/home/views/footer_view.dart';
import 'package:conexion/app/modules/home/views/header_view.dart';
import 'package:conexion/app/modules/home/views/widgets/main_drawer_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../ui/themes/helper_theme.dart';
import '../../../ui/widgets/loading_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: HelperTheme.black),
        backgroundColor: HelperTheme.primary,
        title: Text('home_name'.tr,
            style: const TextStyle(color: HelperTheme.black)),
      ),
      body: Stack(
        children: [
          Obx(() {
            if (controller.isLoading.value) {
              return const LoadingWidget();
            }
            return SingleChildScrollView(
              child: Column(children: const <Widget>[
                HeaderView(),
                FooterView(),
                SizedBox(
                  height: 10.0,
                ),
              ]),
            );
          })
        ],
      ),
      drawer: const MainDrawerWidget(),
    );
  }
}
