import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class FooterView extends GetView<HomeController> {
  const FooterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            color: Colors.white,
            width: double.infinity,
            height: 200.0,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  controller.listSliderI[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount: controller.listSliderI.length,
              viewportFraction: 0.8,
              scale: 0.9,
            )),
        const SizedBox(
          height: 5.0,
        ),
        Container(
            color: Colors.white,
            width: double.infinity,
            height: 200.0,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  controller.listSliderII[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount: controller.listSliderII.length,
              viewportFraction: 0.8,
              scale: 0.9,
            ))
      ],
    );
  }
}
