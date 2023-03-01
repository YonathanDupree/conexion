import 'package:get/get.dart';

import '../reserve_model.dart';

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

  Future<Reserve?> getReserve(int id) async {
    final response = await get('reserve/$id');
    return response.body;
  }

  Future<Response<Reserve>> postReserve(Reserve reserve) async =>
      await post('reserve', reserve);
  Future<Response> deleteReserve(int id) async => await delete('reserve/$id');
}
