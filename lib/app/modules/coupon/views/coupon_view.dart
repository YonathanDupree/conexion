import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../ui/themes/helper_theme.dart';
import '../../home/widgets/main_drawer_widget.dart';
import '../controllers/coupon_controller.dart';

class CouponView extends GetView<CouponController> {
  const CouponView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HelperTheme.primary,
        title: const Text("Cuponera",
            style: const TextStyle(color: HelperTheme.black)),
      ),
      body: const Center(
        child: Text("Trabajando el cuponera"),
      ),
      drawer: MainDrawerWidget(),
    );
  }
}