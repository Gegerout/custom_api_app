import 'package:custom_api_app/dummy/data/models/employee_model.dart';
import 'package:custom_api_app/dummy/data/repositories/data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getEmployeesProvider = FutureProvider<List<EmployeeModel>>((ref) async {
  final data = await DataRepository().loadData();
  final model = data.employees;
  return model;
});

final editEmployeeController = ChangeNotifierProvider<EditEmployeeProvider>((ref) => EditEmployeeProvider());

class EditEmployeeProvider extends ChangeNotifier {
  bool isValid = false;

  void checkEmployeeCreate(String name, String salary, String age) {
    if(name != "" && salary != "" && age != "") {
      isValid = true;
    }
    else {
      isValid = false;
    }
    notifyListeners();
  }

  void createEmployee(String name, String salary, String age) async {
    await DataRepository().createEmployee(name, salary, age);
  }
}