import 'package:custom_api_app/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/ui/home_page.dart';
import '../states/auth_provider.dart';

class SignupPage extends ConsumerWidget {
  SignupPage({Key? key}) : super(key: key);

  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                    children: [
                      Image.network("https://lh3.googleusercontent.com/q88EBZbgu7lTffRRfgJmCXT9WCK_HzM23PlqBYQXMHolDawHK6WuD7gEGTzpoX1zDUoxr8lTrBdYAzZeB2mbwh6KkMlQTNZh7wIR6kKYMsE=s0"),
                      const SizedBox(height: 40,),
                      TextFormField(
                        controller: emailCont,
                        validator: (value) {
                          if(value == null || value.isEmpty || !RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value)) {
                            return "Please enter correct email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        controller: passwordCont,
                        validator: (value) {
                          if(value == null || value.isEmpty || value.length < 6) {
                            return "Please enter correct password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      SizedBox(
                        width: 230,
                        height: 50,
                        child: FilledButton.tonal(onPressed: () {
                          if(formKey.currentState!.validate()) {
                            ref.read(authProvider).signupUser(emailCont.text, passwordCont.text).then((value) {
                              if(ref.watch(authProvider).token != null) {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                              }
                            });
                          }
                        }, child: const Text("Signup")),
                      ),
                      const Spacer(),
                      const Text("Already have an account", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      }, child: const Text("Login", style: TextStyle(fontSize: 16),))
                    ],
                  ),
              ),
            ],
          ),
          ),
        ),
    );
  }
}
