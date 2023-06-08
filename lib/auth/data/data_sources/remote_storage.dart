import 'package:custom_api_app/auth/data/models/auth_model.dart';
import 'package:dio/dio.dart';

class RemoteData {
  Future<AuthModel> loginUser(String email, String password) async {
    const String apiUrl = "https://reqres.in/api/login";
    final Dio dio = Dio();
    final response = await dio.post(apiUrl, data: {
      "email": email,
      "password": password
    }, options: Options(
        validateStatus: (status) {
          if(status == 400 || status == 200) {
            return true;
          }
          else {
            return false;
          }
        }
    ));
    if(response.statusCode == 200) {
      final model = AuthModel(token: response.data["token"]);
      return model;
    }
    else if(response.statusCode == 400) {
      final model = AuthModel(error: response.data["error"]);
      return model;
    }
    return AuthModel();
  }
}