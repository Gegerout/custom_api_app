import 'dart:convert';
import 'dart:io';
import 'package:custom_api_app/auth/data/data_sources/remote_storage.dart';
import 'package:custom_api_app/auth/domain/repositories/repository_impl.dart';
import 'package:custom_api_app/auth/domain/usecases/auth_usecase.dart';
import 'package:path_provider/path_provider.dart';

class DataRepository extends Repository {
  @override
  Future<AuthUseCase> loginUser(String email, String password) async {
    var dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/userToken.json");
    final data = await RemoteData().loginUser(email, password);
    if(data.token != null) {
      file.writeAsStringSync(json.encode(data), flush: true, mode: FileMode.write);
      return AuthUseCase(token: data.token);
    }
    return AuthUseCase(token: null);
  }
}