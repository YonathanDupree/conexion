import 'package:conexion/app/ui/themes/helper_theme.dart';
import 'package:flutter/material.dart';

class LayerOneWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 654,
      decoration: const BoxDecoration(
        color: HelperTheme.greylayout,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60.0), bottomRight: Radius.circular(60.0)),
      ),
    );
  }
}
