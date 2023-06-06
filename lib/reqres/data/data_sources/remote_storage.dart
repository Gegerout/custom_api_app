import 'package:dio/dio.dart';

class RemoteData {
  Future<List<dynamic>> getUserData() async {
    const String apiUrl = "https://reqres.in/api/users";
    const String apiUrl2 = "https://reqres.in/api/users?page=2";
    final Dio dio = Dio();
    final response = await dio.get(apiUrl);
    if(response.statusCode == 200) {
      final response2 = await dio.get(apiUrl2);
      final data = [response.data, response2.data];
      return data;
    }
    else {
      return ["Please wait a bit"];
    }
  }

  Future<List<dynamic>> getResourceData() async {
    const String apiUrl = "https://reqres.in/api/unknown";
    const String apiUrl2 = "https://reqres.in/api/unknown?page=2";
    final Dio dio = Dio();
    final response = await dio.get(apiUrl);
    if(response.statusCode == 200) {
      final response2 = await dio.get(apiUrl2);
      final data = [response.data, response2.data];
      return data;
    }
    else {
      return ["Please wait a bit"];
    }
  }
}