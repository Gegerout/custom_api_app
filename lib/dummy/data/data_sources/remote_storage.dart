import 'package:dio/dio.dart';

class RemoteData {
  Future<dynamic> getData() async {
    const String apiUrl = "https://dummy.restapiexample.com/api/v1/employees";
    final Dio dio = Dio();
    final response = await dio.get(apiUrl, options: Options(
      validateStatus: (status) {
        if(status == 429 || status == 200) {
          return true;
        }
        else {
          return false;
        }
      }
    ));
    if(response.statusCode == 200) {
      return response.data;
    }
    else {
      return "Plese wait a bit";
    }
  }

  Future<void> createEmployee(String name, String salary, String age) async {
    const String apiUrl = "https://dummy.restapiexample.com/api/v1/create";
    final Dio dio = Dio();
    final response = await dio.post(apiUrl, queryParameters: {
      "name": name,
      "salary": salary,
      "age": age
    }, options: Options(
        validateStatus: (status) {
          if(status == 429 || status == 200) {
            return true;
          }
          else {
            return false;
          }
        }
    ));
  }
}