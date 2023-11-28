class Product {
  int ? id;
  bool ? isFavorite;
  int ? price;
  String ? title;
  String ? description;
  int ? ukuran;
  String ? imagePath;

  Product ({
    this.id,
    required this.title,
    this.isFavorite =  false,
    required this.price,
    this.ukuran,
    this.description,
    required this.imagePath,
  });
}