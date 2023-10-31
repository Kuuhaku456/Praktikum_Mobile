import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:posttest5_096_filipus_manik/pages/About_us.dart';
import 'package:posttest5_096_filipus_manik/pages/Home_Page.dart';
import 'package:posttest5_096_filipus_manik/pages/Schedule.dart';
import 'package:posttest5_096_filipus_manik/pages/Top_Anime.dart';
import 'package:flutter/cupertino.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int indexs = 0;

  final List<Widget> Page = [
    HomePage(),
    JadwalTayang(),
    Top_anime(),
    AboutUsPage(),
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
      backgroundColor: Color(0xFF374259),
      body: Center(
        child: Page.elementAt(indexs),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xFF374259),
        color: Colors.grey.shade400.withAlpha(128),
        items: [
          Icon(
            Icons.home,
            size: 20,
            color: Colors.yellow,
          ),
          Icon(
            Icons.calendar_month_outlined,
            size: 20,
            color: Colors.yellow,
          ),
          Icon(
            Icons.grade,
            size: 20,
            color: Colors.yellow,
          ),
          Icon(
            Icons.person,
            size: 20,
            color: Colors.yellow,
          ),
        ],
        onTap: (index) {
          itemTapped(index);
        },
      ),
    );
  }
}
