import 'package:conexion/app/modules/home/controllers/home_controller.dart';
import 'package:conexion/app/modules/home/widgets/camera_widger.dart';
import 'package:conexion/app/modules/home/widgets/card_widget.dart';
import 'package:conexion/app/modules/home/widgets/dropdownbutton_widget.dart';
import 'package:conexion/app/ui/themes/helper_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HeaderView extends GetView {
  const HeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    final controller = Get.find<HomeController>();

    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/superior.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text('Hola ${controller.nombEmpl}!',
                        style: HelperTheme.titleBlackMd),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: const [
                              Text('¿Como te sientes hoy?',
                                  style: HelperTheme.subTitleBlack,
                                  textAlign: TextAlign.left),
                              SizedBox(
                                height: 5.0,
                              ),
                              DropDownWidget(),
                            ],
                          ),
                          const CameraWidget()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const CardWidget()
                  ])),
        ]);
  }
}
