import 'dart:developer';

import 'package:get/get.dart';

import '../models/food_model_model.dart';

class FoodModelProvider extends GetConnect {
  String currentUrl = 'https://apigenerator.dronahq.com/api/g7s7P925/TestAlan/';

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) {
        log("Data = ${map.toString()}", name: "jjj");
        return FoodModel.fromJson(map);
      }
      if (map is List) {
        return map.map((item) {
          // log(item ?? "ko", name: "jjj");
          return FoodModel.fromJson(item);
        }).toList();
      }
    };

    httpClient.baseUrl = currentUrl;
    log(httpClient.baseUrl.toString(), name: "kkk");
  }

  Future<FoodModel?> getFoodModelById(int id) async {
    final response = await get('$id');
    log(response.bodyString ?? "ko");
    return response.body;
  }

  Future<Response> getFoodModel() async {
    final response = await get("");
    log(response.bodyString ?? "ko", name: "jjj");
    return response;
  }

  Future<Response<dynamic>> postFoodModel(
      Map<String, dynamic> foodmodel) async {
    final response = await post('', foodmodel);
    return response;
  }

  Future<Response<dynamic>> patchFoodModel(
          int id, Map<String, dynamic> foodmodel) async =>
      await patch('$id', foodmodel);

  Future<Response> deleteFoodModel(int id) async => await delete('$id');
}
