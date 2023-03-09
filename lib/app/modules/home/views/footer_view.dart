import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
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
                color: Colors.transparent,
                width: double.infinity,
                height: 200.0,
                child: controller.slider.isEmpty
                    ? Container(
                        width: 150,
                        height: 140,
                        decoration: const BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              image: AssetImage('assets/images/loading.gif'),
                              fit: BoxFit.cover,
                            )))
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
              color: Colors.transparent,
              width: double.infinity,
              margin: const EdgeInsets.all(2),
              height: 200.0,
              child: controller.slider.isEmpty
                  ? Container(
                      width: 150,
                      height: 140,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/loading.gif'),
                        fit: BoxFit.cover,
                      )))
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
