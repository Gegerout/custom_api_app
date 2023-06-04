import 'package:custom_api_app/dummy/data/models/employee_model.dart';
import 'package:custom_api_app/dummy/data/repositories/data_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getEmployeesProvider = FutureProvider<List<EmployeeModel>>((ref) async {
  final data = await DataRepository().loadData();
  final model = data.employees;
  return model;
});