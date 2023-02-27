import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/helper_theme.dart';

class DialogUtil {
  void dialogProgress(String message) {
    Get.dialog(
        barrierDismissible: false,
        Material(
          type: MaterialType.transparency,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                      backgroundColor: HelperTheme.secondary,
                      color: HelperTheme.primary,
                      strokeWidth: 5,
                    )),
                const SizedBox(height: 10),
                Text(message,
                    style: const TextStyle(color: HelperTheme.primary)),
              ],
            ),
          ),
        ));
  }

  void dialogCupo() {
    Get.dialog(
        barrierDismissible: true,
        Material(
          type: MaterialType.transparency,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  height: 400,
                  margin: const EdgeInsets.all(15.0),
                  color: Colors.transparent,
                  child: const Center(
                    child: Image(
                        image: AssetImage('assets/images/ic_headercupo.png')),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void dialogAnswer(String menssage) {
    Get.dialog(
        barrierDismissible: true,
        Material(
            type: MaterialType.transparency,
            child: AlertDialog(
              title: Image.asset(
                'assets/images/conexion.jpg',
                width: 100.0,
                height: 75.0,
                scale: 1.0,
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Text(menssage,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            style: HelperTheme.subTitleLigh,
                            maxLines: 20))
                  ],
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child:
                      const Text('Ok', style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    Get.back();
                  },
                ),
              ],
            )));
  }

  void dialogClose() {
    Get.back(closeOverlays: true);
  }

  void dialogCloseError() {
    Get.back();
  }
}
