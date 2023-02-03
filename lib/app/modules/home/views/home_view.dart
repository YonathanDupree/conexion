import 'package:conexion/app/modules/home/views/header_view.dart';
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
        title: Text('home_name'.tr,
            style: const TextStyle(color: HelperTheme.black)),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(children: const <Widget>[
          HeaderView(),
          //_cardPortadasForm(),
          SizedBox(
            height: 10.0,
          ),
          //_swiperForm(),
          SizedBox(
            height: 10.0,
          ),
          //_swiperIIForm(context),
          SizedBox(
            height: 10.0,
          ),
        ])),
      ),
      drawer: const MainDrawerWidget(),
    );
  }
}
