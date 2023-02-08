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
        backgroundColor: HelperTheme.primary,
        title: const Text("Contactanos",
            style: const TextStyle(color: HelperTheme.black)),
      ),
      body: const Center(
        child: Text("Trabajando el contactanos"),
      ),
      drawer: MainDrawerWidget(),
    );
  }
}
