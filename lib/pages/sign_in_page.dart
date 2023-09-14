import 'package:firebase_todo/bloc/sign/sign_bloc.dart';
import 'package:firebase_todo/pages/home_page.dart';
import 'package:firebase_todo/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() {
    var email = emailController.text;
    var password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      debugPrint("Empty values");
      return;
    }
    BlocProvider.of<SignBloc>(context).add(
      SignIn(email: email, password: password),
    );
    if (BlocProvider.of<SignBloc>(context).state.user != null) {
      goToHome();
    }
  }

  void goToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  void goToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Sign In",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 20,
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "Email",
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 20,
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: signIn,
                  child: const Text("Sign In"),
                ),
              ),
              TextButton(
                onPressed: goToSignUp,
                child: const Text("Don't have an account? Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
