import 'package:custom_api_app/reqres/data/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/data_repository.dart';

final getUsersProvider = FutureProvider<List<UserModel>>((ref) async {
  final data = await DataRepository().loadData();
  final model = data.users;
  return model;
});