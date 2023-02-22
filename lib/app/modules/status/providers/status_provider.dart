import 'package:get/get.dart';

import '../status_model.dart';

class StatusProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Status.fromJson(map);
      if (map is List) return map.map((item) => Status.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Status?> getStatus(int id) async {
    final response = await get('status/$id');
    return response.body;
  }

  Future<Response<Status>> postStatus(Status status) async =>
      await post('status', status);
  Future<Response> deleteStatus(int id) async => await delete('status/$id');
}
