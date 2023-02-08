import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FooterDrawerWidget extends StatelessWidget {
  const FooterDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/munecos.svg',
        height: 150.0,
        width: 150.0,
        color: Colors.blueGrey,
        allowDrawingOutsideViewBox: true,
        matchTextDirection: false);
  }
}
