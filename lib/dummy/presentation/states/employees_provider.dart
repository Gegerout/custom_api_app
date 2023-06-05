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
  bool isEmployee = true;

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

  void checkEmployeeId(String id) async {
    final data = await DataRepository().loadData();
    final model = data.employees;
    for (var element in model) {
      if(element.id == id) {
        isEmployee = true;
        break;
      }
      else {
        isEmployee = false;
      }
      notifyListeners();
    }
  }

  void updateEmployee(String name, String salary, String age, String id) async {
    await DataRepository().updateEmployee(name, salary, age, id);
  }
}