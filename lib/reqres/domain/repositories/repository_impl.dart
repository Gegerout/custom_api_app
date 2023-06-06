import '../usecases/user_usecase.dart';

abstract class Repository {
  Future<UserUseCase> loadData();
}