class Anime {
  String Judul;
  String Rating;
  String Tipe;
  String Episode;
  String imagePath;
  bool isFavorite;
  final bool isTapped;

  Anime({
    required this.Judul,
    required this.Rating,
    required this.Tipe,
    required this.Episode,
    required this.imagePath,
    this.isFavorite = false,
    this.isTapped = false,
  });
}
