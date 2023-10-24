import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: Color(0xFF374259),
      appBar: AppBar(
        backgroundColor: Color(0xFF374259),
        title: Text(
          'TOP CHARTS',
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: Lebar,
        height: Tinggi,
        color: Color(0xFF374259),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DefaultTabController(
                  length: 3,
                  child: TabBar(
                    labelColor: Colors.yellow,
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: [
                      Tab(text: 'Anime'),
                      Tab(text: 'Musik'),
                      Tab(text: 'Berita'),
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}