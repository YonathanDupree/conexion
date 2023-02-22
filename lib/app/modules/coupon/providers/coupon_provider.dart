import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/providers/base_provider.dart';
import '../coupon_model.dart';

class CouponProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Coupon.fromJson(map);
      if (map is List) return map.map((item) => Coupon.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Coupon?> getCoupon(String numeIden) async {
    Coupon coupon = Coupon();

    try {
      final response = await http
          .post(
        Uri.https(BaseProvider().BASE_URL, '/hmvc/cone/api/cupones'),
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
          coupon = Coupon.fromJson(responseJson["data"]);
          break;
        case 404:
          throw (responseJson["message"]);
      }
    } on SocketException {
      throw ('Error de conexión con el servidor.');
    } on FormatException {
      throw ('Error en el formato del servicio.');
    }

    return coupon;
  }

  Future<Response<Coupon>> postCoupon(Coupon coupon) async =>
      await post('coupon', coupon);
  Future<Response> deleteCoupon(int id) async => await delete('coupon/$id');
}
