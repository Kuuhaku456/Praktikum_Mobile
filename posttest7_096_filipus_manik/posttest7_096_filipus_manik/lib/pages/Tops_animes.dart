import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/models/anime_card.dart';
import 'package:posttest5_096_filipus_manik/models/top_anime.dart';
import 'package:posttest5_096_filipus_manik/provider/anime_favorite_notifier.dart';
import 'package:provider/provider.dart';



class TopsAnimes extends StatefulWidget {
  const TopsAnimes({super.key});

  @override
  State<TopsAnimes> createState() => _TopsAnimesState();
}

class _TopsAnimesState extends State<TopsAnimes> {
  bool isTapped = false;
  // bool isFavorite = false;

  final List<Anime> ListAnime = [
    Anime(
        Judul: 'Attack on Titan',
        Rating: '8.59',
        Tipe: 'TV',
        Episode: '24 Eps',
        imagePath: 'assets/aot.png'),
    Anime(
        Judul: 'Death Note',
        Rating: '8.62',
        Tipe: 'TV',
        Episode: '37 Eps',
        imagePath: 'assets/death_note.png'),
    Anime(
        Judul: 'Fullmetal Alchemist',
        Rating: '9.10',
        Tipe: 'TV',
        Episode: '64 Eps',
        imagePath: 'assets/fullmetal_alchemist.png'),
    Anime(
        Judul: 'Hunter x Hunter',
        Rating: '9.05',
        Tipe: 'TV',
        Episode: '148 Eps',
        imagePath: 'assets/hxh.png'),
        
  ];

  void toggleFavorite(Anime data) {
    if (data.isFavorite) {
      setState(() {
        data.isFavorite = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xFF374259),
          content: Text(
            'Anime telah di-unfavorit',
            style: GoogleFonts.poppins(color: Colors.yellow, fontSize: 15),
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Tambahkan ke Favorit?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    data.isFavorite = true;
                  });
                  Provider.of<AnimeFavoriteNotifier>(context, listen: false).addToFavorite(data);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Color(0xFF374259),
                      content: Row(
                        children: [
                          Text(
                            'Anime telah di tambahkan ke favorit',
                            style: GoogleFonts.poppins(
                                color: Colors.yellow, fontSize: 15),
                          ),
                          TextButton(
                              onPressed: () {
                                toggleFavorite(data);
                              },
                              child: Text(
                                'Urungkan',
                                style: GoogleFonts.poppins(
                                    fontSize: 15, color: Colors.blue),
                              )),
                        ],
                      ),
                    ),
                  );
                },
                child: Text('Tambahkan'),
              ),
            ],
          );
        },
      );
    }
  }

  void _handleTap() {
    setState(() {
      isTapped = !isTapped; // Toggle nilai ketika tombol ditekan.
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color containerColor = isTapped ? Colors.grey : Color(0xFF374259);
    Color textColor = isTapped ? Colors.yellow : Colors.yellow;
    Color iconColor = isTapped ? Colors.yellow : Colors.yellow;
    var Lebar = MediaQuery.of(context).size.width;
    var Tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: Lebar,
        height: 800,
        decoration: BoxDecoration(
          color: Color(0xFF374259),
        ),
        child: Container(
          width: Lebar,
          height: Tinggi,
          child: Container(
            width: Lebar,
            height: 900,
            child: ListView.builder(
                itemCount: ListAnime.length,
                itemBuilder: (context, index) {
                  return MyanimeCard(
                    index: index,
                    title: ListAnime[index].Judul,
                    imagePath: ListAnime[index].imagePath,
                    rating: ListAnime[index].Rating,
                    episode: ListAnime[index].Episode,
                    isFavorite: ListAnime[index].isFavorite,
                    handleTap: (){
                      toggleFavorite(ListAnime[index]);
                      // setState(() {
                      //   ListTopAnime[index].isFavorite = !ListTopAnime[index].isFavorite;
                      // });
                    },
                  );
                }),
          ),
        ),
      ),
    );
  }
}
