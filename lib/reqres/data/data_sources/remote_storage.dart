import 'package:dio/dio.dart';

class RemoteData {
  Future<dynamic> getUserData() async {
    const String apiUrl = "https://reqres.in/api/users?page=2";
    final Dio dio = Dio();
    final response = await dio.get(apiUrl);
    if(response.statusCode == 200) {
      return response.data;
    }
    else {
      return "Please wait a bit";
    }
  }

  Future<dynamic> getResourceData() async {
    const String apiUrl = "https://reqres.in/api/unknown";
    final Dio dio = Dio();
    final response = await dio.get(apiUrl);
    if(response.statusCode == 200) {
      return response.data;
    }
    else {
      return "Please wait a bit";
    }
  }
}