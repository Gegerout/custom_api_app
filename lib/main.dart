import 'package:custom_api_app/auth/presentation/pages/login_page.dart';
import 'package:custom_api_app/auth/presentation/states/auth_provider.dart';
import 'package:custom_api_app/core/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ref.watch(tokenProvider).when(
            data: (value) {
              if (value.token != null) {
                return const Scaffold(
                    resizeToAvoidBottomInset: false, body: HomePage());
              }
              return Scaffold(
                  resizeToAvoidBottomInset: false, body: LoginPage());
            },
            error: (error, stacktrace) {
              return Scaffold(body: Center(child: Text(error.toString())));
            },
            loading: () => const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )));
  }
}
