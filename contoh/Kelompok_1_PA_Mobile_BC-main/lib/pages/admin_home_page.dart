import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Import halaman-halaman terkait
import 'admin_order_page.dart';
import 'product_option.dart';
import 'home_page.dart';
import 'product_detail.dart';
import 'settings_page.dart';

// Model untuk representasi produk
class Product {
  final String name; // Nama produk
  final String description; // Deskripsi produk
  final double price; // Harga produk
  final String imageUrl; // URL gambar produk

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  // Konstruktor untuk mengonversi dokumen Firestore menjadi objek Product
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      description: map['description'],
      price: (map['price'] as num).toDouble(),
      imageUrl: map['imageUrl'],
    );
  }
}

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50), // Ruang kosong di bagian atas
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Find Your Best Coffee', // Judul halaman
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CoffeeList(), // Widget untuk menampilkan daftar kopi
            ),
          ),
        ],
      ),
    );
  }
}

class CoffeeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Product>>(
      stream: getProductList(), // Mendapatkan daftar produk dari Firestore
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Menampilkan loading spinner jika data sedang dimuat
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // Menampilkan pesan error jika terjadi kesalahan
        } else {
          List<Product> productList = snapshot.data ?? [];
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return CoffeeItem(product: productList[index]); // Menampilkan item kopi
            },
          );
        }
      },
    );
  }
}

class CoffeeItem extends StatelessWidget {
  final Product product;

  CoffeeItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke ProductDetailPage saat produk ditekan (nonaktifkan sementara)
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => AdminProductDetailPage(product: product),
        //   ),
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey), // Border abu-abu
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      product.imageUrl,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    )),
              ),
              SizedBox(height: 8.0),
              Text(
                product.name, // Menampilkan nama produk
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Rp ${NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0).format(product.price)}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Metode untuk mengambil data produk dari Firestore
Stream<List<Product>> getProductList() {
  return FirebaseFirestore.instance.collection('products').snapshots().map(
    (snapshot) {
      return snapshot.docs
          .map((doc) => Product.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    },
  );
}

class AdminBottomNavExample extends StatefulWidget {
  @override
  _BottomNavExampleState createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<AdminBottomNavExample> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    AdminHomePage(), // Home Page
    OrderPageAdmin(), // Favorite Page
    ProductOptionPage(), //Input Page
    SettingsPage(), // Settings Page
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // index halaman
        onTap: onTabTapped, // reaksi ketika tab ditekan
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Icon untuk navigation Home
            label: 'Home', // Nama navigation
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.shopping_cart_rounded), // Icon untuk navigation Product
            label: 'Order', // Nama navigation
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add), // Icon untuk navigation Product
            label: 'Input', // Nama navigation
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings), // Icon untuk navigation Settings
            label: 'Settings', // nama navigation
          ),
        ],
        backgroundColor: Colors.grey[900], // Warna background bottom navigation bar
        selectedItemColor: Color(0xFFE57734), // Warna ikon yang dipilih
        unselectedItemColor: Colors.grey, // Warna ikon yang belum dipilih
      ),
    );
  }
}
