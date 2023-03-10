import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/section_controller.dart';

class SectionView extends GetView<SectionController> {
  const SectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SectionView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SectionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
