import 'package:custom_api_app/auth/data/data_sources/local_storage.dart';
import 'package:custom_api_app/auth/data/data_sources/remote_storage.dart';
import 'package:custom_api_app/auth/domain/repositories/repository_impl.dart';
import 'package:custom_api_app/auth/domain/usecases/auth_usecase.dart';

class DataRepository extends Repository {
  @override
  Future<AuthUseCase> loginUser(String email, String password) async {
    final data = await RemoteData().loginUser(email, password);
    if(data.token != null) {
      await LocalStorage().loginUser(data.token!);
      return AuthUseCase(token: data.token);
    }
    return AuthUseCase(token: null);
  }

  @override
  Future<AuthUseCase> getToken() async {
    final model = await LocalStorage().loadToken();
    return AuthUseCase(token: model.token);
  }

  @override
  Future<AuthUseCase> signupUser(String email, String password) async {
    final data = await RemoteData().loginUser(email, password);
    if(data.token != null) {
      await LocalStorage().loginUser(data.token!);
      return AuthUseCase(token: data.token);
    }
    return AuthUseCase(token: null);
  }
}