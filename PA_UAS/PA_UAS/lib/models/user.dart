import 'package:posttest5_096_filipus_manik/models/anime.dart';

class User{
  int ? id;
  String ? username;
  String ? password;
  String ? phonenumber;
  int ? usia;
  List<Animes> ? animeFavorites;
  String ? imagePath;
  User(
    {
      required this.id,
      required this.password,
      required this.username,
      required this.phonenumber,
      required this.usia,
      required this.animeFavorites,
      this.imagePath,
    }
  );
}