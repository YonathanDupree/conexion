import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RequestView extends GetView {
  const RequestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: FadeInImage(
      image: AssetImage('assets/images/solicitudes.png'),
      placeholder: AssetImage('assets/images/loading.gif'),
      fit: BoxFit.cover,
    ));
  }
}
