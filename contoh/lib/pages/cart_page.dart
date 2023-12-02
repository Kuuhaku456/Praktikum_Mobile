import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  final String userId;

  CartPage({required this.userId});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(widget.userId)
            .collection('cart')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('Cart is empty'),
            );
          }

          // Inisialisasi total harga
          double totalHarga = 0;

          // Menyimpan produk yang dipilih
          List<Map<String, dynamic>> selectedProducts = [];

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var cartItem = snapshot.data!.docs[index];

                    // Mendapatkan nilai dari Firestore
                    String productName = cartItem['productName'];
                    String cupSize = cartItem['cupSize'];
                    String hotCold = cartItem['hotCold'];
                    bool lessIce = cartItem['lessIce'];
                    bool lessSugar = cartItem['lessSugar'];
                    int quantity = cartItem['quantity'];
                    double subTotalPrice = cartItem['subTotalPrice'];

                    // Menambahkan subtotal ke total harga
                    totalHarga += subTotalPrice;

                    // Menambahkan produk ke dalam daftar yang dipilih
                    selectedProducts.add({
                      'productName': productName,
                      'cupSize': cupSize,
                      'hotCold': hotCold,
                      'lessIce': lessIce,
                      'lessSugar': lessSugar,
                      'quantity': quantity,
                      'subTotalPrice': subTotalPrice,
                    });

                    // Membuat widget untuk menampilkan detail produk
                    return ListTile(
                      title: Text(productName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cup Size: $cupSize'),
                          Text('Hot/Cold: $hotCold'),
                          Text('Less Ice: ${lessIce ? 'Yes' : 'No'}'),
                          Text('Less Sugar: ${lessSugar ? 'Yes' : 'No'}'),
                          Text('Quantity: $quantity'),
                          Text('Subtotal: $subTotalPrice'),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Menambahkan tombol untuk melakukan pemesanan
              ElevatedButton(
                onPressed: () {
                  _placeOrder(selectedProducts, totalHarga);
                },
                child: Text('Order All'),
              ),
            ],
          );
        },
      ),
    );
  }

  // Fungsi untuk menempatkan pesanan
  void _placeOrder(
      List<Map<String, dynamic>> selectedProducts, double totalHarga) async {
    // Mendapatkan user ID
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;

      try {
        // Simpan data produk yang dipilih ke orderHistory
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('orderHistory')
            .add({
          'products': selectedProducts,
          'totalHarga': totalHarga,
          'orderDate': DateTime.now(),
          'orderStatus': 'On Queue',
        });

        // Hapus semua produk dari cart
        await _clearCart(userId);

        // Tampilkan snackbar sukses
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Pesanan berhasil ditempatkan!'),
            duration: Duration(seconds: 2),
          ),
        );
      } catch (error) {
        // Tampilkan snackbar gagal jika terjadi kesalahan
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('Gagal menempatkan pesanan. Silakan coba lagi.'),
            duration: Duration(seconds: 2),
          ),
        );
        print('Error placing order: $error');
      }
    }
  }

  // Fungsi untuk menghapus semua produk dari cart
  Future<void> _clearCart(String userId) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cart')
        .get()
        .then((snapshot) {
      for (DocumentSnapshot doc in snapshot.docs) {
        doc.reference.delete();
      }
    });
  }
}
