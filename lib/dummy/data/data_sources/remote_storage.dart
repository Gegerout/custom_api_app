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
      return "Please wait a bit";
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

  Future<void> updateEmployee(String name, String salary, String age, String id) async {
    const String apiUrl = "https://dummy.restapiexample.com/api/v1/update";
    final Dio dio = Dio();
    final response = await dio.put("$apiUrl/$id", queryParameters: {
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
    print(response);
  }
}