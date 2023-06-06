import 'package:custom_api_app/reqres/data/models/resource_model.dart';
import 'package:custom_api_app/reqres/data/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/data_repository.dart';

final getUsersProvider = FutureProvider<List<UserModel>>((ref) async {
  final data = await DataRepository().loadUserData();
  final model = data.users;
  return model;
});

final getResourcesProvider = FutureProvider<List<ResourceModel>>((ref) async {
  final data = await DataRepository().loadResourceData();
  final model = data.resources;
  return model;
});