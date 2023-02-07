import 'dart:io';

import 'package:get/get.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../data/providers/base_provider.dart';

import '../spec_model.dart';

class SpecProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Spec.fromJson(map);
      if (map is List) return map.map((item) => Spec.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<Spec>> getSpec() async {
    List<Spec> specialist = [];

    try {
      final response = await http.post(
        Uri.https(BaseProvider().BASE_URL, '/hmvc/cone/api/especialistas'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        /*body: jsonEncode(
            <String, String>{'codi_usua': codiUsua, 'clav_usua': clavUsua}),*/
      ).timeout(const Duration(seconds: 120), onTimeout: () {
        throw ('Error en tiempo de espera, Por favor intentalo nuevamente!');
      });

      var responseJson = jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          Iterable list = responseJson["data"];
          specialist = list.map((model) => Spec.fromJson(model)).toList();
          break;
        case 404:
          throw (responseJson["message"]);
      }
    } on SocketException {
      throw ('Error de conexión con el servidor.');
    } on FormatException {
      throw ('Error en el formato del servicio.');
    }

    return specialist;
  }

  Future<Response<Spec>> postSpec(Spec spec) async => await post('spec', spec);
  Future<Response> deleteSpec(int id) async => await delete('spec/$id');
}
