import 'package:flutter/material.dart';
import 'package:posttest5_096_filipus_manik/models/anime_card.dart';
import 'package:posttest5_096_filipus_manik/provider/anime_favorite_notifier.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF374259),
      appBar: AppBar(
        backgroundColor: const Color(0xFF374259),
        title:const  Text('Favorites Anime'),
        centerTitle: true,
      ),
      body:
          Consumer<AnimeFavoriteNotifier>(builder: (context, provider, child) {
        if (provider.getAnime.isNotEmpty) {
          return ListView.builder(
              itemCount: provider.getAnime.length,
              itemBuilder: (context, index) {
                return MyanimeCard(
                  index: index,
                  title: provider.getAnime[index].judul,
                  imagePath: provider.getAnime[index].imagePath,
                  rating: provider.getAnime[index].Rating,
                  episode: provider.getAnime[index].Episode,
                  isFavorite: provider.getAnime[index].isFavorite,
                  handleTap: () {
                    // toggleFavorite(provider.getAnime[index]);
                    // setState(() {
                    //   ListTopAnime[index].isFavorite = !ListTopAnime[index].isFavorite;
                    // });
                  },
                );
              });
        }
        return Text(
          'Kosong',
        );
      }),
    );
  }
}
