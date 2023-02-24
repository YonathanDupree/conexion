import 'package:conexion/app/ui/themes/helper_theme.dart';
import 'package:flutter/material.dart';

class LayerTwoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 399,
      height: 200,
      decoration: const BoxDecoration(
        color: HelperTheme.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60.0),
          bottomRight: Radius.circular(60.0),
          bottomLeft: Radius.circular(60.0),
        ),
      ),
    );
  }
}
