import 'package:custom_api_app/dummy/presentation/states/employees_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmployeesPage extends ConsumerWidget {
  const EmployeesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getEmployeesProvider).when(
        data: (value) {
          return ListView.builder(
            itemCount: value.length,
              itemBuilder: (context, index) {
            return ListTile(
              title: Text(value[index].name),
              subtitle: Text(value[index].salary.toString()),
            );
          });
        },
        error: (error, stacktrace) {
      return Center(
        child: Text(error.toString()),
      );
    }, loading: () => const Center(child: CircularProgressIndicator(),));
  }
}
