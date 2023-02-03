import 'package:conexion/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    final controller = Get.find<HomeController>();

    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      InkWell(
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Colors.transparent,
            margin: const EdgeInsets.fromLTRB(10, 0, 2.5, 0),
            elevation: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: const FadeInImage(
                  image: NetworkImage('https://i.imgur.com/Urn8eMx.png'),
                  placeholder: AssetImage('assets/images/loading.gif'),
                  fit: BoxFit.fill,
                  height: 140,
                  width: 150),
            )),
        onTap: () async {
          /*_loading.build(context);
              HttpOverrides.global = MyHttpOverrides();
              final response = await _cargarsanitario.getCargarSanitario("N");
              if (response.length > 0) {
                Navigator.of(context, rootNavigator: true).pop('dialog');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Nutricionista(
                      response[0].nomb_sani!,
                      response[0].perf_sani!,
                      response[0].imag_pers!,
                      response[0].celu_sani!,
                      response[0].mail_sani!,
                    ),
                  ),
                );
              }*/
        },
      ),
      InkWell(
          child: /*Text(
              "bbb") */
              Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Colors.transparent,
            margin: const EdgeInsets.fromLTRB(2.5, 0, 10, 0),
            elevation: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: const FadeInImage(
                  image: NetworkImage('https://i.imgur.com/Dtq8J6v.png'),
                  placeholder: AssetImage('assets/images/loading.gif'),
                  fit: BoxFit.fill,
                  height: 140,
                  width: 150),
            ),
          ),
          onTap: () async {
            /*_loading.build(context);
                HttpOverrides.global = MyHttpOverrides();
                final response = await _cargarsanitario.getCargarSanitario("P");
                if (response.length > 0) {
                  Navigator.of(context, rootNavigator: true).pop('dialog');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => Psicologo(
                        response[0].nomb_sani!,
                        response[0].perf_sani!,
                        response[0].imag_pers!,
                        response[0].celu_sani!,
                        response[0].mail_sani!,
                      ),
                    ),
                  );
                }*/
          }),
    ]);
  }
}
