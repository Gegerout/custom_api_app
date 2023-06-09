import '../usecases/auth_usecase.dart';

abstract class Repository {
  Future<AuthUseCase> loginUser(String email, String password);
  Future<AuthUseCase> signupUser(String email, String password);
  Future<AuthUseCase> getToken();
}