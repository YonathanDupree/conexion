import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class FooterView extends GetView<HomeController> {
  const FooterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Container(
                color: Colors.white,
                width: double.infinity,
                height: 200.0,
                child: controller.slider.isEmpty
                    ? null
                    : Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            controller.getSliderI()[index].urlsSlid.toString(),
                            fit: BoxFit.fill,
                          );
                        },
                        itemCount: controller.getSliderI().length,
                        viewportFraction: 0.8,
                        scale: 0.9,
                        onTap: (index) {
                          var url = controller
                              .getSliderI()[index]
                              .urlsAcce
                              .toString();
                          controller.showUrl(url);
                        },
                      )),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              margin: const EdgeInsets.all(2),
              height: 200.0,
              child: controller.slider.isEmpty
                  ? null
                  : FadeInImage(
                      image: NetworkImage(
                          controller.getSliderII()[0].urlsSlid.toString()),
                      placeholder:
                          const AssetImage('assets/images/loading.gif'),
                      fit: BoxFit.cover,
                      height: 185,
                      width: MediaQuery.of(context).size.width - 10,
                    ),
            )
          ],
        ));
  }
}
