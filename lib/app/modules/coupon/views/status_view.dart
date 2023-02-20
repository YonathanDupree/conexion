import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/coupon_controller.dart';

class StatusView extends GetView<CouponController> {
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
