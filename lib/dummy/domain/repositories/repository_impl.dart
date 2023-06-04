import '../usecases/employee_usecase.dart';

abstract class Repository {
  Future<EmployeeUseCase> loadData();
}