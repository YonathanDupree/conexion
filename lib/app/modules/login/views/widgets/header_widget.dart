import 'package:flutter/material.dart';

import '../../../../ui/themes/helper_theme.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HelperTheme.primary,
        body: Container(
          width: double.infinity,
          color: Colors.transparent,
          child: const Center(
            child: Image(
                image: AssetImage('assets/images/logo_texto.png'),
                width: 250,
                height: 250),
          ),
        ),
      ),
    );
  }
}
