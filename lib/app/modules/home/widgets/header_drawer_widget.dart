import 'package:flutter/material.dart';

class HeaderDrawerWidget extends StatelessWidget {
  const HeaderDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        children: const [
          Expanded(
              child: Image(
            image: AssetImage('assets/images/azzorti_gif.gif'),
            height: 140,
          ))
        ],
      ),
    );
  }
}
