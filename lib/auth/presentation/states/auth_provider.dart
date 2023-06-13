import 'package:custom_api_app/auth/data/repositories/data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tokenProvider = FutureProvider((ref) async {
  final data = await DataRepository().getToken();
  return data;
});

final authProvider = ChangeNotifierProvider((ref) => AuthNotifier());

class AuthNotifier extends ChangeNotifier {
  String? token;

  Future<void> loginUser(String email, String password) async {
    final data = await DataRepository().loginUser(email, password);
    token = data.token;
    notifyListeners();
  }

  Future<void> signupUser(String email, String password) async {
    final data = await DataRepository().signupUser(email, password);
    token = data.token;
    notifyListeners();
  }
}