import 'dart:convert';
import 'dart:io';

import 'package:custom_api_app/reqres/data/models/resource_model.dart';
import 'package:custom_api_app/reqres/data/models/user_model.dart';
import 'package:custom_api_app/reqres/domain/usecases/resources_usecase.dart';
import 'package:custom_api_app/reqres/domain/usecases/user_usecase.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/repositories/repository_impl.dart';
import '../data_sources/local_storage.dart';
import '../data_sources/remote_storage.dart';

class DataRepository extends Repository {
  @override
  Future<UserUseCase> loadUserData() async {
    var dir = await getTemporaryDirectory();
    File file = File("${dir.path}/usersData.json");
    if(file.existsSync()) {
      final data = await LocalStorage().loadUserData();
      final users = (data[0]["data"] as List).map((value) => UserModel.fromJson(value)).toList();
      for(Map<String, dynamic> element in data[1]["data"] as List) {
        users.add(UserModel.fromJson(element));
      }
      final usecase = UserUseCase(users);
      return usecase;
    }
    else {
      final data = await RemoteData().getUserData();
      final users = (data[0]["data"] as List).map((value) => UserModel.fromJson(value)).toList();
      for(Map<String, dynamic> element in data[1]["data"] as List) {
        users.add(UserModel.fromJson(element));
      }
      file.writeAsStringSync(json.encode(data), flush: true, mode: FileMode.write);
      final usecase = UserUseCase(users);
      return usecase;
    }
  }

  @override
  Future<ResourcesUseCase> loadResourceData() async {
    var dir = await getTemporaryDirectory();
    File file = File("${dir.path}/resourcesData.json");
    if(file.existsSync()) {
      final data = await LocalStorage().loadResourceData();
      final resources = (data[0]["data"] as List).map((value) => ResourceModel.fromJson(value)).toList();
      for(Map<String, dynamic> element in data[1]["data"] as List) {
        resources.add(ResourceModel.fromJson(element));
      }
      final usecase = ResourcesUseCase(resources);
      return usecase;
    }
    else {
      final data = await RemoteData().getResourceData();
      final resources = (data[0]["data"] as List).map((value) => ResourceModel.fromJson(value)).toList();
      for(Map<String, dynamic> element in data[1]["data"] as List) {
        resources.add(ResourceModel.fromJson(element));
      }
      file.writeAsStringSync(json.encode(data), flush: true, mode: FileMode.write);
      final usecase = ResourcesUseCase(resources);
      return usecase;
    }
  }
}