// import 'package:flutter/cupertino.dart'; // Import package Flutter untuk Cupertino (iOS-style widgets)
// import 'package:flutter/material.dart'; // Import package untuk Flutter Material Design
// import 'package:pa_mobile/pages/single_item_screen.dart';  // Import halaman SingleItemScreen.dart

// class Product {
//   final String name;
//   final String description;
//   final double price;
//   final String imageUrl;

//   Product({
//     required this.name,
//     required this.description,
//     required this.price,
//     required this.imageUrl,
//   });

//   // Konstruktor untuk mengonversi dokumen Firestore menjadi objek Product
//   factory Product.fromMap(Map<String, dynamic> map) {
//     return Product(
//       name: map['name'] ?? '',
//       description: map['description'] ?? '',
//       price: (map['price'] ?? 0).toDouble(),
//       imageUrl: map['imageUrl'] ?? '',
//     );
//   }
// }


// // Kelas CoffeeList yang merupakan StatefulWidget
// class CoffeeList extends StatefulWidget {
//   @override
//   _CoffeeListState createState() => _CoffeeListState();
// }

// // Kelas _CoffeeListState yang merupakan State dari CoffeeList
// class _CoffeeListState extends State<CoffeeList> {
//   // List nama file gambar untuk kopi
//   List<String> img = [
//     'Latte',
//     'Espresso',
//     'Black Coffee',
//     'Cold Coffee',
//   ];

//   String selectedSize = 'S'; // Ukuran kopi yang dipilih

//   // Metode untuk membangun antarmuka pengguna
//   @override
//   Widget build(BuildContext context) {
//     // Mendapatkan lebar dan tinggi layar menggunakan MediaQuery
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;

//     return Container(
//       child: Padding(
//         padding: EdgeInsets.all(screenWidth * 0.02),
//         child: GridView.count(
//           physics: NeverScrollableScrollPhysics(), // Mencegah scrolling GridView
//           crossAxisCount: 2, // Jumlah kolom dalam grid
//           crossAxisSpacing: screenWidth * 0.04, // Jarak horizontal antar elemen
//           mainAxisSpacing: screenHeight * 0.02, // Jarak vertikal antar elemen
//           shrinkWrap: true,  // Mengikat GridView ke dalam ukuran yang tersedia
//           childAspectRatio: (155/ 245), // Rasio aspek disesuaikan
//           children: [
//             for (int i = 0; i < img.length; i++)
//               Container(
//                 padding: EdgeInsets.symmetric(
//                   vertical: screenHeight * 0.02,
//                   horizontal: screenWidth * 0.03,
//                 ),
//                 margin: EdgeInsets.symmetric(
//                   vertical: screenHeight * 0.015,
//                   horizontal: screenWidth * 0.02,
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(screenWidth * 0.04),
//                   color: Color(0xFF212325),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       spreadRadius: 1,
//                       blurRadius: screenWidth * 0.04,
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         // Navigasi ke halaman SingleItemScreen ketika gambar kopi ditekan
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => SingleItemScreen(
//                               img: img[i],
//                               selectedSize: selectedSize,
//                             ),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         margin: EdgeInsets.all(screenWidth * 0.02),
//                         child: Image.asset(
//                           "images/${img[i]}.png",
//                           width: screenWidth * 0.3,
//                           height: screenWidth * 0.3,
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(bottom: screenHeight * 0.008),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // Nama kopi
//                             Text(
//                               img[i],
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             SizedBox(height: screenHeight * 0.01),
//                             Text(
//                               "Best Coffee",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white60,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: screenHeight * 0.009),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           // Harga kopi
//                           Text(
//                             "Rp 30.000",
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.white,
//                             ),
//                           ),
//                           // Tombol tambah ke keranjang
//                           Container(
//                             padding: EdgeInsets.all(screenWidth * 0.01),
//                             decoration: BoxDecoration(
//                               color: Color(0xFFE57734),
//                               borderRadius: BorderRadius.circular(screenWidth * 0.04),
//                             ),
//                             child: Icon(
//                               CupertinoIcons.add,
//                               size: 20,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
