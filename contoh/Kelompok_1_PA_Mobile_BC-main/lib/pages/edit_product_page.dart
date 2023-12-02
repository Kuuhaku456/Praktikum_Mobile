import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ProductEditPage extends StatefulWidget {
  final String productId;

  ProductEditPage({required this.productId});

  @override
  _ProductEditPageState createState() => _ProductEditPageState();
}

class _ProductEditPageState extends State<ProductEditPage> {  
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  File? _image;

  @override
  void initState() {
    super.initState();
    // Memuat data produk saat halaman diinisialisasi
    _loadProductData();
  }

  // Metode untuk memuat data produk
  void _loadProductData() async {
    try {
      // Mengambil data produk dari Firestore berdasarkan ID
      DocumentSnapshot productSnapshot = await FirebaseFirestore.instance
          .collection('products')
          .doc(widget.productId)
          .get();

      // Memuat data produk ke dalam controller
      if (productSnapshot.exists) {
        var productData = productSnapshot.data() as Map<String, dynamic>;
        _nameController.text = productData['name'];
        _descriptionController.text = productData['description'];
        _priceController.text = productData['price'].toString();

        // Memuat URL gambar jika ada
        String imageUrl = productData['imageUrl'];
        if (imageUrl.isNotEmpty) {
          // Jika URL gambar ada, muat gambar dari internet
          setState(() {
            _image = NetworkImage(imageUrl) as File?;
          });
        }
      } else {
        // Handle jika produk tidak ditemukan
        print('Product not found.');
      }
    } catch (error) {
      // Handle error jika terjadi kesalahan
      print('Error loading product data: $error');
    }
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<String> _uploadImage() async {
  Reference storageReference =
      FirebaseStorage.instance.ref().child('images/${DateTime.now()}.png');
  UploadTask uploadTask = storageReference.putFile(_image!);
  await uploadTask.whenComplete(() => null);
  return await storageReference.getDownloadURL();
}

  // Metode untuk menyimpan perubahan pada produk
  void _saveChanges() async {
    try {

      // Upload gambar jika ada perubahan gambar
      String imageUrl = '';
      if (_image != null) {
        imageUrl = await _uploadImage();
      }

      // Memperbarui data produk di Firestore
      await FirebaseFirestore.instance
          .collection('products')
          .doc(widget.productId)
          .update({
        'name': _nameController.text,
        'description': _descriptionController.text,
        'price': double.parse(_priceController.text),
        'imageUrl': imageUrl, // Update URL gambar jika ada perubahan
      });

      // Tampilkan pemberitahuan berhasil
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Product updated successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (error) {
      // Tangani error dan tampilkan pemberitahuan error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating product: $error'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                _getImage();
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey),
                ),
                child: _image != null
                    ? Image.file(_image!, fit: BoxFit.cover)
                    : (_image != null
                        ? Image.network(_image!.path)
                        : Icon(Icons.add_a_photo, size: 40)),
              ),
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Panggil metode _saveChanges saat tombol disentuh
                _saveChanges();
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
