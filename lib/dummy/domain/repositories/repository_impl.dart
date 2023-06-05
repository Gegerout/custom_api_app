import '../usecases/employee_usecase.dart';

abstract class Repository {
  Future<EmployeeUseCase> loadData();
  Future<void> createEmployee(String name, String salary, String age);
  Future<void> updateEmployee(String name, String salary, String age, String id);
  Future<void> deleteEmployee(String id);
}