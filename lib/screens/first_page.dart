import 'package:flutter/material.dart';
import 'package:hotel_database/constant/colors.dart';
import 'package:hotel_database/constant/spaces.dart';
import 'package:hotel_database/screens/sign_in.dart';
import 'package:hotel_database/screens/sign_up.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Image.network(
                  "https://timmytcshtlnlxqvgdwm.supabase.co/storage/v1/object/public/image/10.png",
                  width: 415,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 410,
                  decoration: const BoxDecoration(
                    color: Color(0xffF8F8F8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(),
                            child: Text(
                              "A VACATION TO REMEMBER!",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            child: Text(
                              "Exsplore Luxury Hotels, low price Hotels, Homes and much more...",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                );
                              },
                              child: Text("Login"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: lightColor,
                                fixedSize: Size(300, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                            ),
                        Space.spaceH8,
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, left: 37, right: 37, bottom: 10),
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Signup()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: lightColor,
                                      fixedSize: Size(300, 50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                    ),
                                    child: const Text("Sign Up"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
