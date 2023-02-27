import 'package:conexion/app/modules/home/controllers/home_controller.dart';
import 'package:conexion/app/modules/home/views/camera_view.dart';
import 'package:conexion/app/modules/home/views/facestate_view.dart';
import 'package:conexion/app/modules/home/views/specialist_view.dart';
import 'package:conexion/app/ui/themes/helper_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HeaderView extends GetView<HomeController> {
  const HeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        style: HelperTheme.titleBlackMd,
                        textAlign: TextAlign.left),
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
                            children: [
                              Text("home_feel".tr,
                                  style: HelperTheme.subTitleBlack,
                                  textAlign: TextAlign.left),
                              const SizedBox(
                                height: 5.0,
                              ),
                              const FacestateView(),
                            ],
                          ),
                          const CameraView()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const SpecialistView()
                  ])),
        ]);
  }
}
