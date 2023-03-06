import 'package:conexion/app/modules/home/views/widgets/main_drawer_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../ui/themes/helper_theme.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: HelperTheme.black),
        backgroundColor: HelperTheme.primary,
        title: const Text("Perfil",
            style: const TextStyle(color: HelperTheme.black)),
      ),
      body: const Center(
        child: Text("Trabajando el perfil"),
      ),
      drawer: MainDrawerWidget(),
    );
  }
}
