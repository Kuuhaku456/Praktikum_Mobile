// import 'package:flutter/cupertino.dart'; // Import package Flutter untuk Cupertino (iOS-style widgets)
// import 'package:flutter/material.dart'; // Import package untuk Flutter Material Design

// class SingleItemScreen extends StatefulWidget { // Kelas SingleItemScreen yang merupakan StatefulWidget
//   // Variabel yang menyimpan ukuran dan nama file gambar kopi
//   String selectedSize;
//   final String img;

//   // Konstruktor dengan parameter wajib menggunakan "required"
//   SingleItemScreen({required this.img, required this.selectedSize, Key? key})
//       : super(key: key);

//   // Override metode createState untuk membuat state
//   @override
//   _SingleItemScreenState createState() => _SingleItemScreenState();
// }

// // Kelas _SingleItemScreenState yang merupakan State dari SingleItemScreen
// class _SingleItemScreenState extends State<SingleItemScreen> {
//   int quantity = 1;  // Jumlah awal kopi yang akan ditambahkan ke keranjang
//   static const int coffeePrice = 30; // Harga per item kopi

//   // Fungsi untuk menambah jumlah kopi
//   void incrementQuantity() {
//     if (quantity < 20) {
//       setState(() {
//         quantity++;
//       });
//     }
//   }

//   // Fungsi untuk mengurangi jumlah kopi
//   void decrementQuantity() {
//     if (quantity > 1) {
//       setState(() {
//         quantity--;
//       });
//     }
//   }

//   // Metode untuk membangun antarmuka pengguna
//   @override
//   Widget build(BuildContext context) {
//     // Mendapatkan lebar dan tinggi layar menggunakan MediaQuery
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     // Scaffold sebagai kerangka utama
//     return Scaffold(
//       // Body menggunakan SingleChildScrollView untuk mendukung scrolling jika diperlukan
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.only(top: screenHeight * 0.04, bottom: screenHeight * 0.03),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Tombol kembali
//                 Padding(
//                   padding: EdgeInsets.only(left: screenWidth * 0.05),
//                   child: InkWell(
//                     onTap: () {
//                       // Kembali ke layar sebelumnya
//                       Navigator.pop(context);
//                     },
//                     child: Icon(
//                       Icons.arrow_back_ios_new,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.06),  // Spasi vertikal
//                 // Gambar kopi
//                 Center(
//                   child: Image.asset(
//                     "images/${widget.img}.png",
//                     width: screenWidth / 1.5,
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.06), // Spasi vertikal
//                 // Informasi dan kontrol kopi
//                 Padding(
//                   padding: EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "BEST COFFEE",
//                         style: TextStyle(
//                             color: Colors.white.withOpacity(0.4)),
//                       ),
//                       SizedBox(height: screenHeight * 0.02), // Spasi vertikal
//                       // Nama kopi
//                       Text(
//                         widget.img,
//                         style: TextStyle(
//                           fontSize: 30,
//                           letterSpacing: 1,
//                           color: Colors.white,
//                         ),
//                       ),
//                       SizedBox(height: screenHeight * 0.04), // Spasi vertikal
//                       // Kontrol kuantitas dan harga
//                       Container(
//                         width: screenWidth,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             // Kontrol kuantitas
//                             Container(
//                               padding: EdgeInsets.all(screenHeight * 0.02),
//                               width: screenWidth * 0.4,
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: Colors.white.withOpacity(0.2),
//                                 ),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 // Tombol kurang
//                                 children: [
//                                   InkWell(
//                                     onTap: decrementQuantity,
//                                     child: Icon(
//                                       CupertinoIcons.minus,
//                                       size: 18,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   SizedBox(width: screenHeight * 0.025), // Spasi vertikal
//                                   // Jumlah kopi yang dipilih
//                                   Text(
//                                     quantity.toString(),
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                   SizedBox(width: screenHeight * 0.025),  // Spasi vertikal
//                                   // Tombol tambah
//                                   InkWell(
//                                     onTap: incrementQuantity,
//                                     child: Icon(
//                                       CupertinoIcons.plus,
//                                       size: 18,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             // Harga total
//                             Text(
//                               "Rp ${(coffeePrice * quantity).toStringAsFixed(3)}",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: screenHeight * 0.02), // Spasi vertikal
//                       // Deskripsi kopi
//                       Text(
//                         "Coffee is a major source of antioxidants in the diet. It has many health benefits",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white.withOpacity(0.4),
//                         ),
//                       ),
//                       SizedBox(height: screenHeight * 0.02), // Spasi vertikal
//                       // Pilihan ukuran kopi
//                       Row(
//                         children: [
//                           // Label "Size"
//                           Text(
//                             "Size ",
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(width: screenHeight * 0.02),  // Spasi vertikal  
//                           // Tombol radio untuk ukuran kopi
//                           Row(
//                             children: [
//                               buildRadioButton("S"),
//                               buildRadioButton("M"),
//                               buildRadioButton("L"),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: screenHeight * 0.01), // Spasi vertikal
//                        // Menampilkan gambar sesuai dengan ukuran yang dipilih
//                       if (widget.selectedSize == "S")
//                         buildSizeImage("images/small_${widget.img}.png"),
//                       if (widget.selectedSize == "M")
//                         buildSizeImage("images/medium_${widget.img}.png"),
//                       if (widget.selectedSize == "L")
//                         buildSizeImage("images/large_${widget.img}.png"),
//                       SizedBox(height: screenHeight * 0.02),  // Spasi vertikal
//                       // Tombol "Add to Cart" dan ikon favorit
//                       Container(
//                         width: screenWidth,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             // Tombol "Add to Cart"
//                             Container(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: screenHeight * 0.03, horizontal: screenWidth * 0.2),
//                               decoration: BoxDecoration(
//                                 color: Color.fromARGB(255, 50, 54, 56),
//                                 borderRadius: BorderRadius.circular(18),
//                               ),
//                               child: Text(
//                                 "Add to Cart",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   letterSpacing: 1,
//                                 ),
//                               ),
//                             ),
//                             // Ikon favorit
//                             Container(
//                               padding: EdgeInsets.all(screenHeight * 0.03),
//                               decoration: BoxDecoration(
//                                 color: Color(0xFFE57734),
//                                 borderRadius: BorderRadius.circular(18),
//                               ),
//                               child: Icon(
//                                 Icons.favorite_outline,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Metode untuk membangun widget gambar ukuran kopi
//   Widget buildSizeImage(String imagePath) {
//     return Center(
//       child: Image.asset(
//         imagePath,
//         width: MediaQuery.of(context).size.width / 3,
//       ),
//     );
//   }

//   // Metode untuk membangun tombol radio ukuran kopi
//   Widget buildRadioButton(String label) {
//     return Row(
//       children: [
//         Radio(
//           value: label,
//           groupValue: widget.selectedSize,
//           onChanged: (value) {
//             setState(() {
//               widget.selectedSize = value.toString();
//             });
//           },
//           activeColor: Color(0xFFE57734),
//         ),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }
// }
