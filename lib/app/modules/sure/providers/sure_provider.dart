import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import '../../../data/providers/base_provider.dart';
import '../sure_model.dart';

class SureProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Sure.fromJson(map);
      if (map is List) return map.map((item) => Sure.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<Sure>> getSure(String nombCate) async {
    List<Sure> section = [];

    try {
      final response = await http
          .post(
        Uri.https(BaseProvider().BASE_URL, '/hmvc/cone/api/cargarSecciones'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'nomb_cate': nombCate}),
      )
          .timeout(const Duration(seconds: 120), onTimeout: () {
        throw ('Error en tiempo de espera, Por favor intentalo nuevamente!');
      });

      var responseJson = jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          Iterable list = responseJson["data"];
          section = list.map((model) => Sure.fromJson(model)).toList();
          break;
        case 404:
          throw (responseJson["message"]);
      }
    } on SocketException {
      throw ('Error de conexión con el servidor.');
    } on FormatException {
      throw ('Error en el formato del servicio.');
    }

    return section;
  }

  Future<Response<Sure>> postSure(Sure sure) async => await post('sure', sure);
  Future<Response> deleteSure(int id) async => await delete('sure/$id');
}
