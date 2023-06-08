import 'package:custom_api_app/auth/presentation/states/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            ref.read(authProvider).loginUser("eve.holt@reqres.in", "cityslicka");
          }, child: Text("ss")),
          Consumer(builder: (context, watch, child) {
            if(ref.watch(authProvider).token == null) {
              return const Text("null");
    }
            else {
              return Text(ref.watch(authProvider).token!);
            }
          })
        ],
      ),
    );
  }
}
