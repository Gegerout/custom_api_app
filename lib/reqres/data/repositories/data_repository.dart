import 'dart:convert';
import 'dart:io';

import 'package:custom_api_app/reqres/data/models/user_model.dart';
import 'package:custom_api_app/reqres/domain/usecases/user_usecase.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/repositories/repository_impl.dart';
import '../data_sources/local_storage.dart';
import '../data_sources/remote_storage.dart';

class DataRepository extends Repository {
  @override
  Future<UserUseCase> loadData() async {
    var dir = await getTemporaryDirectory();
    File file = File("${dir.path}/usersData.json");
    if(file.existsSync()) {
      final data = await LocalStorage().loadData();
      final employees = (data["data"] as List).map((value) => UserModel.fromJson(value)).toList();
      final usecase = UserUseCase(employees);
      return usecase;
    }
    else {
      final data = await RemoteData().getData();
      final employees = (data["data"] as List).map((value) => UserModel.fromJson(value)).toList();
      file.writeAsStringSync(json.encode(data), flush: true, mode: FileMode.write);
      final usecase = UserUseCase(employees);
      return usecase;
    }
  }
}