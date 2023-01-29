import 'package:get/get.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../data/providers/base_provider.dart';
import '../user_model.dart';

class UserProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return User.fromJson(map);
      if (map is List) return map.map((item) => User.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  /*Future<User?> getUser(int id) async {
    final response = await get('user/$id');
    return response.body;
  }*/

  Future<User?> getUser(String codiUsua, String clavUsua) async {
    User user = User();

    final response = await http
        .post(
      Uri.https(BaseProvider().BASE_URL, '/hmvc/cone/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'codi_usua': codiUsua, 'clav_usua': clavUsua}),
    )
        .timeout(const Duration(seconds: 120), onTimeout: () {
      throw ('Error en tiempo de espera, Por favor intentalo nuevamente!');
    });

    var responseJson = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        user = User.fromJson(responseJson["data"]);
        break;
      case 404:
        throw (responseJson["message"]);
    }
    return user;
  }

  Future<Response<User>> postUser(User user) async => await post('user', user);
  Future<Response> deleteUser(int id) async => await delete('user/$id');
}
