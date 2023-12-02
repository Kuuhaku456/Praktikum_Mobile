// // Tambahkan kelas FavoritePage
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import 'home_page.dart';

// class FavoritePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorite Products'),
//       ),
//       body: StreamBuilder<List<Product>>(
//         stream: getFavoriteProducts(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             List<Product> favoriteList = snapshot.data ?? [];
//             return ListView.builder(
//               itemCount: favoriteList.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(favoriteList[index].name),
//                   subtitle: Text(
//                       'Rp ${NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0).format(favoriteList[index].price)}'),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// // Metode untuk mendapatkan daftar produk favorit dari Firestore
// Stream<List<Product>> getFavoriteProducts() {
//   // Dapatkan UserID saat ini
//   User? user = FirebaseAuth.instance.currentUser;
//   if (user != null) {
//     String userId = user.uid;

//     return FirebaseFirestore.instance
//         .collection('users')
//         .doc(userId)
//         .collection('favorites')
//         .snapshots()
//         .asyncMap(
//       (snapshot) async {
//         List<Product> favorites = [];
//         for (QueryDocumentSnapshot doc in snapshot.docs) {
//           String productId = doc['productId'];
//           // Dapatkan detail produk dari Firestore berdasarkan ID produk
//           DocumentSnapshot productSnapshot =
//               await FirebaseFirestore.instance.collection('products').doc(productId).get();
//           Product product = Product.fromMap(productId, productSnapshot.data() as Map<String, dynamic>);
//           favorites.add(product);
//         }
//         return favorites;
//       },
//     );
//   } else {
//     // Jika pengguna tidak login, kembalikan stream kosong
//     return Stream.value([]);
//   }
// }