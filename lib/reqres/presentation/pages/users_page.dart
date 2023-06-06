import 'package:custom_api_app/reqres/presentation/states/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersPage extends ConsumerWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getUsersProvider).when(
        data: (value) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Users"),
            ),
            body: ListView.builder(
              itemCount: value.length,
                itemBuilder: (context, index) {
                return ListTile(
                  title: Text(value[index].firstName),
                  subtitle: Text(value[index].lastName),
                  leading: CircleAvatar(backgroundImage: NetworkImage(value[index].avatar),),
                );
                }
            ),
          );
        },
        error: (error, stacktrace) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Users"),
            ),
            body: Center(
              child: Text(error.toString()),
            ),
          );
        },
        loading: () => Scaffold(
          appBar: AppBar(
            title: const Text("Users"),
          ),
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        )
    );
  }
}
