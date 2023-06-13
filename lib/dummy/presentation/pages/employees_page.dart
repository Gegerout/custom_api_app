import 'package:custom_api_app/dummy/presentation/states/employees_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmployeesPage extends ConsumerStatefulWidget {
  const EmployeesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends ConsumerState<EmployeesPage> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(getEmployeesProvider).when(
        data: (value) {
          void updateTiles(int oldIndex, int newIndex) {
            setState(() {
              if(oldIndex < newIndex) {
                newIndex--;
              }
              final tile = value.removeAt(oldIndex);
              value.insert(newIndex, tile);
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text("Employees"),
            ),
            body: ReorderableListView(
                 onReorder: (int oldIndex, int newIndex) { updateTiles(oldIndex, newIndex); },
                 children: value.map((element) => ListTile(
                   key: ValueKey(element),
              title: Text(element.name),
              subtitle: Text(element.salary.toString()),
            )).toList(),),
          );
        },
        error: (error, stacktrace) {
          if(error is DioError) {
            ref.refresh(getEmployeesProvider).value;
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text("Employees"),
            ),
            body: Center(
              child: Text(error.toString()),
            ),
          );
        },
        loading: () => Scaffold(
            appBar: AppBar(
              title: const Text("Employees"),
            ),
                body: const Center(
              child: CircularProgressIndicator(),
            ),
        ),
    );
  }
}
