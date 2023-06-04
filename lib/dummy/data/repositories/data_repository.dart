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
      print("Local data");
      final data = await LocalStorage().loadData();
      final employees = (data["data"] as List).map((value) => EmployeeModel.fromJson(value)).toList();
      final usecase = EmployeeUseCase(employees);
      return usecase;
    }
    else {
      print("Remote data");
      final data = await RemoteData().getData();
      final employees = (data["data"] as List).map((value) => EmployeeModel.fromJson(value)).toList();
      file.writeAsStringSync(json.encode(data), flush: true, mode: FileMode.write);
      final usecase = EmployeeUseCase(employees);
      return usecase;
    }
  }
}