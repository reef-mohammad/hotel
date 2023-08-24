import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hotel_database/components/color.dart';
import 'package:hotel_database/screens/home_page.dart';
import 'package:hotel_database/screens/notification_page.dart';
import 'package:hotel_database/screens/orderes_page.dart';
import 'package:hotel_database/screens/profile_page.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  final List<dynamic> _page = [
    const Home(),
   
  ];
  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    print("This is the actice page $_activePage");
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: _activePage,
          height: 60.0,
          items: const <Widget>[
            Icon(Icons.home, size: 30 , semanticLabel: "Home",),
            Icon(
              Icons.receipt,semanticLabel: "Orders",
              size: 30,
            ),
            Icon(Icons.notifications, size: 30,semanticLabel: "Notifications",),
            Icon(Icons.perm_identity, size: 30,semanticLabel: "Profile",),
          ],
          color:gery,
          backgroundColor:white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _activePage = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: _page[_activePage],
          ),
        ));
  }
}

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class OrdersRoute extends StatelessWidget {
  const OrdersRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Orders();
  }
}

class NotificationsRoute extends StatelessWidget {
  const NotificationsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Notifications();
  }
}

class ProfileRoute extends StatelessWidget {
  const ProfileRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return const Profile();
  }
}
