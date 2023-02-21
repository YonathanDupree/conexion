import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../data/providers/base_provider.dart';

class CalendarProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future registerCoupon(
      String consCupo,
      String numeIden,
      String jefeInme,
      String autoEmp1,
      String autoEmp2,
      String tipoCupo,
      String fechSoli,
      String estaSoli,
      String cantCupo) async {
    try {
      final response = await http
          .post(
        Uri.https(BaseProvider().BASE_URL, '/hmvc/cone/api/registrarCupones'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'cons_cupo': consCupo,
          'nume_iden': numeIden,
          'jefe_inme': jefeInme,
          'auto_emp1': autoEmp1,
          'auto_emp2': autoEmp2,
          'tipo_cupo': tipoCupo,
          'fech_soli': fechSoli,
          'esta_soli': estaSoli,
          'cant_cupo': cantCupo
        }),
      )
          .timeout(const Duration(seconds: 120), onTimeout: () {
        throw ('Error en tiempo de espera, Por favor intentalo nuevamente!');
      });

      var responseJson = jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          return responseJson["message"];
        case 404:
          throw (responseJson["message"]);
      }
    } on SocketException {
      throw ('Error de conexión con el servidor.');
    } on FormatException {
      throw ('Error en el formato del servicio.');
    }
  }
}
