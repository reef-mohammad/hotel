import 'package:flutter/material.dart';
import 'package:hotel_database/components/color.dart';
import 'package:hotel_database/constant/extensions.dart';
import 'package:hotel_database/constant/spaces.dart';
import 'package:hotel_database/screens/sign_in.dart';
import 'package:hotel_database/screens/sign_up.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 42, color: lightColor),
            ),
            Space.spaceH24,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: lightColor,
              ),
              onPressed: () {
                const SignUpScreen().push(context);
              },
              child: Text('Sign Up', style: TextStyle(fontSize: 20)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: lightColor,
              ),
              onPressed: () {
                SignInScreen().push(context);
              },
              child: const Text('Sign In', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
