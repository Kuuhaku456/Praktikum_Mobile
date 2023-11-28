import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFavoriitePage extends StatefulWidget {
  const MyFavoriitePage({super.key});

  @override
  State<MyFavoriitePage> createState() => _MyFavoriitePageState();
}

class _MyFavoriitePageState extends State<MyFavoriitePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'My Favorites',
          style:  GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}