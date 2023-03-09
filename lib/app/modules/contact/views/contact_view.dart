import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../ui/themes/helper_theme.dart';
import '../../home/views/widgets/main_drawer_widget.dart';
import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: HelperTheme.black),
        backgroundColor: HelperTheme.primary,
        title: const Text("Contactanos", style: HelperTheme.titleBlackMd),
      ),
      body: const Center(
        child: Text("Trabajando el contactanos"),
      ),
      drawer: const MainDrawerWidget(),
    );
  }
}
