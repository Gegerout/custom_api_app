import '../usecases/resources_usecase.dart';
import '../usecases/user_usecase.dart';

abstract class Repository {
  Future<UserUseCase> loadUserData();
  Future<ResourcesUseCase> loadResourceData();
}