import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'My Favorites',
          style: GoogleFonts.poppins(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
