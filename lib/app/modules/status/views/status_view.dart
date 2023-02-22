import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/status_controller.dart';

class StatusView extends GetView<StatusController> {
  const StatusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: FadeInImage(
      image: AssetImage('assets/images/status.png'),
      placeholder: AssetImage('assets/images/loading.gif'),
      fit: BoxFit.cover,
    ));
  }
}
