import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:uts_mobile/pages/favoritepage.dart';
import 'package:uts_mobile/pages/homepage.dart';
import 'package:uts_mobile/pages/notificationpage.dart';
import 'package:uts_mobile/pages/profile.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  int indexs = 0;

  final List<Widget> page = [
    const HomePage(),
    const MyFavoriitePage(),
    const MyNotificationPage(),
    const MyProfilePage(),
  ];

  void itemTapped(int index) {
    setState(() {
      indexs = index;
    });
  }

  @override
  void initState() {
    super.initState();
    indexs = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: page.elementAt(indexs),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 20,
          ),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            padding: const EdgeInsets.all(16), 
            onTabChange: (index) {
              itemTapped(index);
            },
            tabs: const [
              GButton(
                icon: Icons.home_filled,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Favorites',
              ),
              GButton(
                icon: Icons.notifications,
                text: 'Notification',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              )
            ],
          ),
        ),
      ),
    );
  }
}