import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class LocalStorage {
  Future<dynamic> loadUserData() async {
    var dir = await getTemporaryDirectory();
    File file = File("${dir.path}/usersData.json");
    var jsonData = json.decode(file.readAsStringSync());
    return jsonData;
  }

  Future<dynamic> loadResourceData() async {
    var dir = await getTemporaryDirectory();
    File file = File("${dir.path}/resourcesData.json");
    var jsonData = json.decode(file.readAsStringSync());
    return jsonData;
  }
}