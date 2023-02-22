import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

import '../status_model.dart';
import 'package:http/http.dart' as http;

import '../../../data/providers/base_provider.dart';

class StatusProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Status.fromJson(map);
      if (map is List) return map.map((item) => Status.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Status?> getStatus(String numeIden) async {
    Status status = Status();

    try {
      final response = await http
          .post(
        Uri.https(BaseProvider().BASE_URL, '/hmvc/cone/api/cargarStatus'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'nume_iden': numeIden}),
      )
          .timeout(const Duration(seconds: 120), onTimeout: () {
        throw ('Error en tiempo de espera, Por favor intentalo nuevamente!');
      });
      var responseJson = jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          status = Status.fromJson(responseJson["data"]);
          break;
        case 404:
          throw (responseJson["message"]);
      }
    } on SocketException {
      throw ('Error de conexión con el servidor.');
    } on FormatException {
      throw ('Error en el formato del servicio.');
    }

    return status;
  }

  Future<Response<Status>> postStatus(Status status) async =>
      await post('status', status);
  Future<Response> deleteStatus(int id) async => await delete('status/$id');
}
