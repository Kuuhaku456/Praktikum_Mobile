import 'package:flutter/material.dart';
import 'package:posttest5_096_filipus_manik/models/top_anime.dart';
import 'package:posttest5_096_filipus_manik/repository/anime_repo.dart';
import 'package:posttest5_096_filipus_manik/repository/anime_responses.dart';

enum ProviderState {
  initialize,
  loading,
  loaded,
  error,
}

class TopAnimeNotifier with ChangeNotifier {
  List<Anime> _Topanime = [];
  List<Anime> get getAnime => _Topanime;
  
  final AnimeRepository repositories;
  ProviderState state = ProviderState.initialize;
  TopAnimeNotifier({
    required this.repositories,
  });

  void getAnimeTop() async {
    state = ProviderState.loading;
    try {
      final result = await repositories.getAnimeTopList();
      if (result is AnimeResponses) {
        result.data?.forEach((element) {
          final imagePath = element.images["jpg"]?["image_url"] ?? "";
          _Topanime.add(Anime(
            id: element.malId != null ? element.malId.toString()  : "",
            judul: element.title ?? "",
            Rating: element.score.toString(),
            Tipe: "",
            Episode: element.episodes.toString(),
            imagePath: imagePath,
          ));
        });
        state = ProviderState.loaded;
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
      state = ProviderState.error;
      notifyListeners();
    }
  }
}
