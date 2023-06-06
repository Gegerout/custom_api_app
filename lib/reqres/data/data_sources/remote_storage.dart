import 'package:dio/dio.dart';

class RemoteData {
  Future<dynamic> getData() async {
    const String apiUrl = "https://reqres.in/api/users";
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