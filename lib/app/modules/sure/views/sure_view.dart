import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../ui/themes/helper_theme.dart';
import '../../home/views/widgets/main_drawer_widget.dart';
import '../controllers/sure_controller.dart';

class SureView extends GetView<SureController> {
  const SureView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HelperTheme.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: HelperTheme.black),
        title: const Text('Seguros', style: HelperTheme.titleBlackMd),
        backgroundColor: HelperTheme.primary,
      ),
      body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            Container(
              height: 255,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/fondoseguro.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 2.5,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 2.5, 0, 0),
                alignment: Alignment.bottomLeft,
                width: 100,
                height: 40,
                decoration: const BoxDecoration(
                  color: HelperTheme.primary,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(0),
                    right: Radius.circular(15),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Seguros",
                    style: HelperTheme.labelBlackLg,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 2.5,
            ),
            SafeArea(
                child: Container(
              height: MediaQuery.of(context).size.height - 400,
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 1.0, 20, 1.0),
              child: Obx(() => ListView.builder(
                    itemCount: controller.section.length,
                    itemBuilder: (context, index) => Card(
                      color: HelperTheme.greylayout,
                      elevation: 4,
                      margin: const EdgeInsets.all(4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                          title: Text(
                            controller.section[index].nombSecc.toString(),
                            style: HelperTheme.labelBlackLg,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                          ),
                          trailing: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage(
                                  'assets/icons/${controller.section[index].drawIcon.toString()}')),
                          onTap: () async {
                            controller.goToSure(
                                controller.section[index].nombSecc.toString(),
                                controller.section[index].drawPort.toString());
                          }),
                    ),
                  )),
            )),
          ])),
      drawer: const MainDrawerWidget(),
    );
  }
}
