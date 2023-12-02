import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  File? _profileImage;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  // Metode untuk memilih gambar dari galeri
  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _profileImage = File(pickedFile.path);
      }
    });
  }

  Future<String> _uploadImage() async {
    Reference storageReference =
        FirebaseStorage.instance.ref().child('profile_images/${DateTime.now()}.png');
    UploadTask uploadTask = storageReference.putFile(_profileImage!);
    await uploadTask.whenComplete(() => null);
    return await storageReference.getDownloadURL();
  }

  Future<void> _signUp() async {
  try {
    // Lakukan pendaftaran akun di Firebase
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );

    // Upload foto profil jika dipilih
    String profileImageUrl = '';
    if (_profileImage != null) {
      profileImageUrl = await _uploadImage();
    }

    // Tentukan peran pengguna (role), misalnya "user"
    String userRole = 'user';

    // Tambahkan data pengguna ke Firestore
    await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
      'name': _nameController.text,
      'email': _emailController.text,
      'address': _addressController.text,
      'profileImageUrl': profileImageUrl,
      'role': userRole, // Tambahkan field role
    });

    // Tampilkan pemberitahuan sukses
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Account registered successfully'),
        duration: Duration(seconds: 2),
      ),
    );

    // Pindahkan pengguna ke halaman lain setelah pendaftaran berhasil
    // ...

  } on FirebaseAuthException catch (e) {
    // Tangani kesalahan autentikasi Firebase
    print('Error during sign up: $e');
  } catch (e) {
    // Tangani kesalahan umum
    print('Error: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
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
                  child: _profileImage != null
                      ? Image.file(_profileImage!, fit: BoxFit.cover)
                      : Icon(Icons.add_a_photo, size: 40),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _signUp();
                  }
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
