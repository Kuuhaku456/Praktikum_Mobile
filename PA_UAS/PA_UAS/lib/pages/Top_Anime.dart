import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/pages/Tops_animes.dart';
import 'package:posttest5_096_filipus_manik/pages/Tops_manga.dart';
import 'package:posttest5_096_filipus_manik/pages/Tops_music.dart';
import 'package:posttest5_096_filipus_manik/provider/Top_Anime_notifier.dart';
import 'package:provider/provider.dart';

class Top_anime extends StatefulWidget {
  const Top_anime({super.key});

  @override
  State<Top_anime> createState() => _Top_animeState();
}

class _Top_animeState extends State<Top_anime> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:const  Color(0xFF374259),
          title: Text(
            'TOP CHARTS',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.yellow
            )
          ),
      ),
        body: TopsAnimes(),
      ),
    );
  }
}