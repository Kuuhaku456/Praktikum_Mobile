import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:posttest5_096_filipus_manik/pages/Screen.dart';
import 'package:posttest5_096_filipus_manik/pages/Tops_animes.dart';
import 'package:posttest5_096_filipus_manik/pages/introduction_page.dart';
import 'package:posttest5_096_filipus_manik/provider/Top_Anime_notifier.dart';
import 'package:posttest5_096_filipus_manik/provider/anime_favorite_notifier.dart';
import 'package:posttest5_096_filipus_manik/repository/anime_repo.dart';
import 'package:provider/provider.dart';

final getIt = GetIt.instance;
void main() async {
  final Dio apiClient = Dio();
  final AnimeRepository animeRepository = AnimeRepository(
    apiClient: apiClient,
  );

  getIt.registerLazySingleton<AnimeRepository>(() => animeRepository);
  //  print("masuk");
  // print(getIt.get<AnimeRepository>().apiClient);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TopAnimeNotifier(repositories: AnimeRepository(apiClient: getIt.get<AnimeRepository>().apiClient)),
        ),
        ChangeNotifierProvider(
          create: (_) => AnimeFavoriteNotifier(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: const Screen(),
    );
  }
}
