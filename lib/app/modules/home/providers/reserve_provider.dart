import 'dart:convert';
import 'dart:io';

import 'package:conexion/app/modules/home/reserve_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../data/providers/base_provider.dart';

class ReserveProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Reserve.fromJson(map);
      if (map is List)
        return map.map((item) => Reserve.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<Reserve>> getReserve(String codiSani) async {
    List<Reserve> reserve = [];

    try {
      final response = await http
          .post(
        Uri.https(BaseProvider().BASE_URL, '/hmvc/cone/api/cargarCitas'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'codi_sani': codiSani}),
      )
          .timeout(const Duration(seconds: 120), onTimeout: () {
        throw ('Error en tiempo de espera, Por favor intentalo nuevamente!');
      });

      var responseJson = jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          Iterable list = responseJson["data"];
          reserve = list.map((model) => Reserve.fromJson(model)).toList();
          break;
        case 404:
          throw (responseJson["message"]);
      }
    } on SocketException {
      throw ('Error de conexión con el servidor.');
    } on FormatException {
      throw ('Error en el formato del servicio.');
    }

    return reserve;
  }

  Future registrerReserve(String fechCita, String horaCita, String codiSani,
      String numeIden, String descModa) async {
    String message = "";
    try {
      final response = await http
          .post(
        Uri.https(BaseProvider().BASE_URL, '/hmvc/cone/api/reservarCita'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'fech_cita': fechCita,
          'hora_cita': horaCita,
          'codi_sani': codiSani,
          'nume_iden': numeIden,
          'desc_moda': descModa
        }),
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

  Future<Response<Reserve>> postReserve(Reserve reserve) async =>
      await post('reserve', reserve);
  Future<Response> deleteReserve(int id) async => await delete('reserve/$id');
}
