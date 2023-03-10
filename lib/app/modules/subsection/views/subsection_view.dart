import 'package:conexion/app/ui/themes/helper_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/subsection_controller.dart';

class SubsectionView extends GetView<SubsectionController> {
  const SubsectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HelperTheme.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: HelperTheme.black),
          title: Text(controller.sureController.nombSecc.value.toString(),
              style: HelperTheme.titleBlackMd),
          backgroundColor: HelperTheme.primary,
        ),
        body: SingleChildScrollView(
            child: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: 255,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/${controller.sureController.drawPort.toString()}'),
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
                          width: 220,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: HelperTheme.primary,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(0),
                              right: Radius.circular(15),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              controller.sureController.nombSecc.value
                                  .toString(),
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
                        child: ListView.builder(
                          itemCount: controller.subsection.length,
                          itemBuilder: (context, index) => Card(
                            color: HelperTheme.greylayout,
                            elevation: 4,
                            margin: const EdgeInsets.all(4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                                title: Text(
                                  controller.subsection[index].nombSubs
                                      .toString(),
                                  style: HelperTheme.labelBlackLg,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                ),
                                trailing: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: AssetImage(
                                        'assets/icons/${controller.subsection[index].drawIcon.toString()}')),
                                onTap: () async {
                                  controller.openFile(
                                      controller.subsection[index].urlsSubs
                                          .toString(),
                                      controller.subsection[index].exteSubs
                                          .toString());
                                }),
                          ),
                        ),
                      )),
                    ]))));
  }
}
