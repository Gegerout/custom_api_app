import 'dart:convert';
import 'dart:io';

import 'package:custom_api_app/auth/data/models/auth_model.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorage {
  Future<AuthModel> loadUserToken() async {
    var dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/userToken.json");
    final model = AuthModel(token: json.decode(file.readAsStringSync())["token"]);
    return model;
  }
}