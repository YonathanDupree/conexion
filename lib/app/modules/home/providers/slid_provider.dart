import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import '../../../data/providers/base_provider.dart';

import '../slid_model.dart';

class SlidProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Slid.fromJson(map);
      if (map is List) return map.map((item) => Slid.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<Slid>> getSlid() async {
    List<Slid> slider = [];

    try {
      final response = await http.post(
        Uri.https(BaseProvider().BASE_URL, '/hmvc/cone/api/slider'),
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
          slider = list.map((model) => Slid.fromJson(model)).toList();
          break;
        case 404:
          throw (responseJson["message"]);
      }
    } on SocketException {
      throw ('Error de conexión con el servidor.');
    } on FormatException {
      throw ('Error en el formato del servicio.');
    }

    return slider;
  }

  Future<Response<Slid>> postSlid(Slid slid) async => await post('slid', slid);
  Future<Response> deleteSlid(int id) async => await delete('slid/$id');
}
