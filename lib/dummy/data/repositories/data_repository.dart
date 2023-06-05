import 'dart:convert';
import 'dart:io';
import 'package:custom_api_app/dummy/data/data_sources/local_storage.dart';
import 'package:custom_api_app/dummy/data/data_sources/remote_storage.dart';
import 'package:custom_api_app/dummy/data/models/employee_model.dart';
import 'package:custom_api_app/dummy/domain/repositories/repository_impl.dart';
import 'package:custom_api_app/dummy/domain/usecases/employee_usecase.dart';
import 'package:path_provider/path_provider.dart';

class DataRepository extends Repository {
  @override
  Future<EmployeeUseCase> loadData() async {
    var dir = await getTemporaryDirectory();
    File file = File("${dir.path}/employeeData.json");
    if(file.existsSync()) {
      final data = await LocalStorage().loadData();
      final employees = (data["data"] as List).map((value) => EmployeeModel.fromJson(value)).toList();
      final usecase = EmployeeUseCase(employees);
      return usecase;
    }
    else {
      final data = await RemoteData().getData();
      final employees = (data["data"] as List).map((value) => EmployeeModel.fromJson(value)).toList();
      file.writeAsStringSync(json.encode(data), flush: true, mode: FileMode.write);
      final usecase = EmployeeUseCase(employees);
      return usecase;
    }
  }

  @override
  Future<void> createEmployee(String name, String salary, String age) async {
    await RemoteData().createEmployee(name, salary, age);
    var dir = await getTemporaryDirectory();
    File file = File("${dir.path}/employeeData.json");
    file.deleteSync();
  }

  @override
  Future<void> updateEmployee(String name, String salary, String age, String id) async {
    await RemoteData().updateEmployee(name, salary, age, id);
    var dir = await getTemporaryDirectory();
    File file = File("${dir.path}/employeeData.json");
    file.deleteSync();
  }
}