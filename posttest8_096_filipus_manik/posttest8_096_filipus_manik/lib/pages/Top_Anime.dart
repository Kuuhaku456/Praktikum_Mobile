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
    var Lebar = MediaQuery.of(context).size.width;
    var Tinggi = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF374259),
            title: Text(
              'TOP CHARTS',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.yellow
              )
            ),
            centerTitle: true,
            bottom: TabBar(              
              labelColor: Colors.yellow,
              dividerColor: Colors.yellow,
              tabs: [
                Tab(text: 'ANIME'),
                Tab(text: 'MANGA'),
                Tab(text: 'MUSIC'),
              ],
            ),
          ),
          body: Container(
            height: 700,
            child: TabBarView(
              children: [
                TopsAnimes(),
                TopsManga(),
                TopsMusic()
              ],
            ),
          ),
        ),
      ),
    );
  }
}