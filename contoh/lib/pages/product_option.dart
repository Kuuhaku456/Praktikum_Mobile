import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pa_mobile/pages/product_input.dart';
import 'edit_product_page.dart';

class ProductOptionPage extends StatefulWidget {
  @override
  State<ProductOptionPage> createState() => _ProductOptionPageState();
}

class _ProductOptionPageState extends State<ProductOptionPage> {
  // Metode untuk menghapus produk berdasarkan ID
  Future<void> _deleteProduct(String productId) async {
    try {
      // Tampilkan dialog konfirmasi sebelum menghapus
      bool confirmDelete = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirm Deletion'),
            content: Text('Are you sure you want to delete this product?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // Batal menghapus
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Konfirmasi menghapus
                },
                child: Text('Delete'),
              ),
            ],
          );
        },
      );

      if (confirmDelete == null || !confirmDelete) {
        // Batal menghapus
        return;
      }

      // Hapus produk dari Firestore berdasarkan ID
      await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .delete();

      // Tampilkan pemberitahuan berhasil
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Product deleted successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (error) {
      // Tangani error dan tampilkan pemberitahuan error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error deleting product: $error'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Metode untuk membuka halaman edit produk
  void _editProduct(String productId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductEditPage(productId: productId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Menu'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Tombol atau menu untuk menuju ke product input page
          ListTile(
            title: Text('Product Input'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductInputPage()),
              );
            },
          ),
          Divider(),
          // 2. Text "Product List"
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Product List',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // 3. List menu untuk informasi produk, Edit Product, dan Delete Product
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('products').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  var productList = snapshot.data?.docs ?? [];

                  return ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      var productData =
                          productList[index].data() as Map<String, dynamic>;

                      return ListTile(
                        title: Text(productData['name']),
                        subtitle: Text('Price: Rp ${productData['price']}'),
                        onTap: () {
                          // Navigasi ke halaman detail produk
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ProductDetailPage(
                          //       productId: productList[index].id,
                          //     ),
                          //   ),
                          // );
                        },
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Tombol Edit Product
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                // Panggil metode _editProduct untuk membuka halaman edit produk
                                _editProduct(productList[index].id);
                              },
                            ),
                            // Tombol Delete Product
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                // Panggil metode _deleteProduct untuk menghapus produk
                                _deleteProduct(productList[index].id);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
