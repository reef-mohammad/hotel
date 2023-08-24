import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:hotel_database/constant/extensions.dart';
import 'package:hotel_database/constant/spaces.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    log('Token: ${supabase.auth.currentSession?.accessToken}');
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
            ),
            Space.spaceH8,
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                  labelText: 'Password', border: OutlineInputBorder()),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                if ((emailController.text.isNotEmpty &&
                        emailController.text.isValidEmail) &&
                    passwordController.text.isNotEmpty) {
                  // Signing up ...
                  await supabase.auth.signUp(
                    email: emailController.text,
                    password: passwordController.text,
                  );

                  // Pop after signing up
                  if (context.mounted) {
                    context.pop;
                  }
                }
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
