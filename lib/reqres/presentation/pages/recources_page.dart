import 'package:custom_api_app/core/extensions/extensions.dart';
import 'package:custom_api_app/reqres/presentation/states/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResourcesPage extends ConsumerWidget {
  const ResourcesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getResourcesProvider).when(
        data: (value) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Resources"),
            ),
            body: ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(value[index].name),
                    subtitle: Text(value[index].year),
                    leading: CircleAvatar(backgroundColor: value[index].color.toColor(),),
                  );
                }
            ),
          );
        },
        error: (error, stacktrace) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Resources"),
            ),
            body: Center(
              child: Text(error.toString()),
            ),
          );
        },
        loading: () => Scaffold(
          appBar: AppBar(
            title: const Text("Resources"),
          ),
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        )
    );
  }
}