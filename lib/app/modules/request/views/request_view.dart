import 'package:conexion/app/ui/themes/helper_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../ui/widgets/loading_widget.dart';
import '../controllers/request_controller.dart';

class RequestView extends GetView<RequestController> {
  const RequestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const LoadingWidget();
      }

      return Center(
        child: SingleChildScrollView(
          child: controller.request.isNotEmpty
              ? Center(
                  child: SafeArea(
                      child: SizedBox(
                          height: 500.0,
                          width: MediaQuery.of(context).size.width - 20,
                          child: ListView.builder(
                            itemCount: controller.request.length,
                            itemBuilder: (context, index) => Card(
                              elevation: 6,
                              color: Colors.green[50],
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: const Icon(Icons.credit_card,
                                        color: HelperTheme.warning, size: 45),
                                    title: Text(
                                      controller.request[index].nombEmpl!,
                                      style: HelperTheme.titleBlackSM,
                                    ),
                                    subtitle: controller
                                                .request[index].cantCupo ==
                                            "1"
                                        ? Text(
                                            "${controller.request[index].tipoCupo} (${controller.request[index].cantCupo} cupón)",
                                            style: HelperTheme.subTitleBlackSM,
                                          )
                                        : Text(
                                            "${controller.request[index].tipoCupo} (${controller.request[index].cantCupo} cupones)",
                                            style: HelperTheme.subTitleBlackSM,
                                          ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Divider(
                                      thickness: 1.4,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: const Text('Fecha de solicitud :',
                                        style: HelperTheme.labelBlackLg),
                                  ),
                                  Text(controller.request[index].horaSoli!,
                                      style: HelperTheme.labelBlackLg),
                                  const SizedBox(height: 15),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: const Text('Fecha que aplica :',
                                        style: HelperTheme.labelBlackLg),
                                  ),
                                  Text(controller.request[index].fechSoli!,
                                      style: HelperTheme.labelBlackLg),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton.icon(
                                        label: const Text("Aprobar",
                                            style: HelperTheme.labelWhiteLg),
                                        icon: const Icon(Icons.check),
                                        style: HelperTheme().buttonStyleApro(),
                                        onPressed: () async {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Image.asset(
                                                    'assets/images/logo_texto.png',
                                                    width: 100.0,
                                                    height: 50.0,
                                                    scale: 1.0,
                                                  ),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: ListBody(
                                                      children: <Widget>[
                                                        Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        5,
                                                                    vertical:
                                                                        5),
                                                            child: const Text(
                                                              "¿Esta seguro que desea aprobar solicitud ?",
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: HelperTheme
                                                                  .labelBackMd,
                                                              maxLines: 3,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.green),
                                                      child: const Text('Si',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                      onPressed: () async {
                                                        await controller
                                                            .registerRequest(
                                                                controller
                                                                    .request[
                                                                        index]
                                                                    .consRegi
                                                                    .toString(),
                                                                controller
                                                                    .request[
                                                                        index]
                                                                    .consCupo
                                                                    .toString(),
                                                                "APROBADO",
                                                                controller
                                                                    .request[
                                                                        index]
                                                                    .tipoCupo
                                                                    .toString(),
                                                                controller
                                                                    .request[
                                                                        index]
                                                                    .cantCupo
                                                                    .toString());
                                                      },
                                                    ),
                                                  ],
                                                );
                                              }).then((value) {});
                                        },
                                      ),
                                      ElevatedButton.icon(
                                        label: const Text("Observar",
                                            style: HelperTheme.labelWhiteLg),
                                        icon: const Icon(Icons.remove_red_eye),
                                        style: HelperTheme().buttonStyleObse(),
                                        onPressed: () async {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Image.asset(
                                                    'assets/images/logo_texto.png',
                                                    width: 100.0,
                                                    height: 50.0,
                                                    scale: 1.0,
                                                  ),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: ListBody(
                                                      children: <Widget>[
                                                        Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        5,
                                                                    vertical:
                                                                        5),
                                                            child: Column(
                                                              children: [
                                                                const Text(
                                                                  "¿ Esta seguro de observar la solicitud?",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .justify,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: HelperTheme
                                                                      .labelBackMd,
                                                                  maxLines: 3,
                                                                ),
                                                                const SizedBox(
                                                                    height: 10),
                                                                TextFormField(
                                                                    controller:
                                                                        controller
                                                                            .anotObseController,
                                                                    textCapitalization:
                                                                        TextCapitalization
                                                                            .none,
                                                                    cursorColor:
                                                                        HelperTheme
                                                                            .secondary,
                                                                    decoration:
                                                                        const InputDecoration(
                                                                      border:
                                                                          UnderlineInputBorder(),
                                                                      focusedBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(color: HelperTheme.primary),
                                                                      ),
                                                                      enabledBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(color: HelperTheme.secondary),
                                                                      ),
                                                                      labelText:
                                                                          'Registre observación',
                                                                      labelStyle:
                                                                          HelperTheme
                                                                              .labelBackMd,
                                                                    ),
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .multiline),
                                                              ],
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.green),
                                                      child: const Text('Si',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                      onPressed: () async {
                                                        await controller
                                                            .registerRequest(
                                                                controller
                                                                    .request[
                                                                        index]
                                                                    .consRegi
                                                                    .toString(),
                                                                controller
                                                                    .request[
                                                                        index]
                                                                    .consCupo
                                                                    .toString(),
                                                                "OBSERVADO",
                                                                controller
                                                                    .request[
                                                                        index]
                                                                    .tipoCupo
                                                                    .toString(),
                                                                controller
                                                                    .request[
                                                                        index]
                                                                    .cantCupo
                                                                    .toString());
                                                      },
                                                    ),
                                                  ],
                                                );
                                              }).then((value) {});
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ))),
                )
              : const Center(
                  child: FadeInImage(
                  image: AssetImage('assets/images/solicitudes.png'),
                  placeholder: AssetImage('assets/images/loading.gif'),
                  fit: BoxFit.cover,
                )),
        ),
      );
    });
  }
}
