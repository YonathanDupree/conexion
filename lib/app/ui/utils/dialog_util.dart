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
                  margin: EdgeInsets.all(15.0),
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

  void dialogClose() {
    Get.back(closeOverlays: true);
  }

  void dialogCloseError() {
    Get.back();
  }
}
