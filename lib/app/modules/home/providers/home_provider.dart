import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/providers/base_provider.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future saveEmotion(String numeIden, String estaUsua) async {
    String message = "";
    try {
      final response = await http
          .post(
        Uri.https(BaseProvider().BASE_URL, '/hmvc/cone/api/emotion'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'nume_iden': numeIden, 'esta_usua': estaUsua}),
      )
          .timeout(const Duration(seconds: 120), onTimeout: () {
        throw ('Error en tiempo de espera, Por favor intentalo nuevamente!');
      });

      var responseJson = jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          message = responseJson["message"];
          break;
        case 404:
          throw (responseJson["message"]);
      }
    } on SocketException {
      throw ('Error de conexión con el servidor.');
    } on FormatException {
      throw ('Error en el formato del servicio.');
    }

    return message;
  }
}
