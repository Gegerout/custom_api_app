import 'package:custom_api_app/auth/presentation/pages/signup_page.dart';
import 'package:custom_api_app/auth/presentation/states/auth_provider.dart';
import 'package:custom_api_app/core/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
                        Image.network("https://lh3.googleusercontent.com/S9WBkyJV8zvZEpvfIIN4FCtAtfyjVJjbedtfhCr6q4WoYhWL33xKXcc-FGz9pXZMKEM_gccOcTS0TKDg8A8E4jSx6lO00XK7offqqTI8LRHr=s0"),
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
                          obscureText: true,
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
                              ref.read(authProvider).loginUser(emailCont.text, passwordCont.text).then((value) {
                                if(ref.watch(authProvider).token != null) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                                }
                              });
                            }
                          }, child: const Text("Login")),
                        ),
                        const Spacer(),
                        const Text("Don't have an account", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
                        TextButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                        }, child: const Text("Signup", style: TextStyle(fontSize: 16),))
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
