class Anime {
  String id;
  String Judul;
  String Rating;
  String Tipe;
  String Episode;
  String imagePath;
  bool isFavorite;
  final bool isTapped;

  Anime({
    required this.id,
    required this.Judul,
    required this.Rating,
    required this.Tipe,
    required this.Episode,
    required this.imagePath,
    this.isFavorite = false,
    this.isTapped = false,
  });
}
