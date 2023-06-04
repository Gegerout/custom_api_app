import 'package:dio/dio.dart';

class RemoteData {
  Future<dynamic> getData() async {
    const String apiUrl = "https://dummy.restapiexample.com/api/v1/employees";
    final Dio dio = Dio();
    final response = await dio.get(apiUrl);
    if(response.statusCode == 200) {
      return response.data;
    }
  }
}