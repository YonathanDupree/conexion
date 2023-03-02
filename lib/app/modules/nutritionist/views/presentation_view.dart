import 'package:conexion/app/ui/themes/helper_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';

class PresentationView extends GetView<HomeController> {
  PresentationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: Card(
            color: HelperTheme.nearlyWhite,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: FadeInImage(
                          image: NetworkImage(
                              controller.specialist[0].imagPers.toString()),
                          placeholder:
                              const AssetImage('assets/images/loading.gif'),
                          fit: BoxFit.cover,
                          height: 150,
                          width: 100),
                    ),
                  ),
                  Column(
                    children: [
                      Text(controller.specialist[0].nombSani.toString(),
                          style: HelperTheme.titleBlackSM),
                      Text(
                        'specialist_nutritionist'.tr,
                        style: HelperTheme.subTitleBlack,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: 135,
                        height: 40,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: HelperTheme
                                  .primary, //background color of button
                              side: const BorderSide(
                                  width: 0.1,
                                  color: HelperTheme
                                      .secondary), //border width and color
                              elevation: 5, //elevation of button
                              shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.all(
                                  5) //content padding inside button
                              ),
                          onPressed: () async {
                            Get.toNamed(Routes.RESERVE);
                          },
                          icon: const Icon(Icons.calendar_month,
                              color: HelperTheme.secondary),
                          label: Text(
                            'specialist_reserve'.tr,
                            style:
                                const TextStyle(color: HelperTheme.secondary),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        width: 150,
                        alignment: Alignment.center,
                        child: Text(
                          'specialist_press'.tr,
                          style: HelperTheme.labelBlackXS,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
          child: Card(
            color: HelperTheme.nearlyWhite,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Text('specialist_about'.tr,
                        style: HelperTheme.titleBlackSM)),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Text(controller.specialist[0].perfSani.toString(),
                        style: HelperTheme.labelBackMd,
                        textAlign: TextAlign.justify)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
