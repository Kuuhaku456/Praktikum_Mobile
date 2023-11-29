import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:posttest5_096_filipus_manik/pages/Home_Page.dart';
import 'package:posttest5_096_filipus_manik/pages/Schedule.dart';
import 'package:flutter/cupertino.dart';
import 'package:posttest5_096_filipus_manik/pages/Tops_animes.dart';
import 'package:posttest5_096_filipus_manik/pages/profile.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int indexs = 0;

  final List<Widget> page = [
    const HomePage(),
    const JadwalTayang(),
    const TopsAnimes(),
    const MyProfile(),
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
        child: page.elementAt(indexs),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor:const Color(0xFF374259),
        color: Colors.grey.shade400.withAlpha(128),
        items: const [
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
