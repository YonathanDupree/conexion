import 'dart:convert';
import 'dart:io';

import 'package:conexion/app/data/providers/base_provider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../subsection_model.dart';

class SubsectionProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Subsection.fromJson(map);
      if (map is List)
        return map.map((item) => Subsection.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<Subsection>> getSubsection(String nombSecc) async {
    List<Subsection> subsection = [];

    try {
      final response = await http
          .post(
        Uri.https(BaseProvider().BASE_URL, '/hmvc/cone/api/cargarSubsecciones'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'nomb_secc': nombSecc}),
      )
          .timeout(const Duration(seconds: 120), onTimeout: () {
        throw ('Error en tiempo de espera, Por favor intentalo nuevamente!');
      });

      var responseJson = jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          Iterable list = responseJson["data"];
          subsection = list.map((model) => Subsection.fromJson(model)).toList();
          break;
        case 404:
          throw (responseJson["message"]);
      }
    } on SocketException {
      throw ('Error de conexión con el servidor.');
    } on FormatException {
      throw ('Error en el formato del servicio.');
    }

    return subsection;
  }

  Future<Response<Subsection>> postSubsection(Subsection subsection) async =>
      await post('subsection', subsection);
  Future<Response> deleteSubsection(int id) async =>
      await delete('subsection/$id');
}
