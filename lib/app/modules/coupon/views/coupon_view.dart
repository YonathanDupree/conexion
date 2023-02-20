import 'package:conexion/app/modules/coupon/views/card_view.dart';
import 'package:conexion/app/modules/coupon/views/request_view.dart';
import 'package:conexion/app/modules/coupon/views/status_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../ui/themes/helper_theme.dart';
import '../../home/views/widgets/main_drawer_widget.dart';
import '../controllers/coupon_controller.dart';

class CouponView extends GetView<CouponController> {
  const CouponView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screens = [
      CardView(),
      StatusView(),
      RequestView(),
    ];

    return Obx(() => Scaffold(
        appBar: AppBar(
          backgroundColor: HelperTheme.primary,
          title: const Text("Mi cuponera",
              style: TextStyle(color: HelperTheme.black)),
        ),
        body: screens[controller.tabIndex.value],
        backgroundColor: HelperTheme.white,
        drawer: MainDrawerWidget(),
        bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex.value,
            elevation: 5,
            type: BottomNavigationBarType.fixed,
            backgroundColor: HelperTheme.primary,
            selectedItemColor: HelperTheme.black,
            unselectedItemColor: HelperTheme.secondary,
            iconSize: 25,
            selectedFontSize: 16,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.credit_card), label: 'Cupones'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.query_stats), label: 'Status'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.view_list), label: 'Solicitudes'),
            ])));
  }
}
