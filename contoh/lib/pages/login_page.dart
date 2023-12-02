// Import paket-paket yang diperlukan
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pa_mobile/pages/admin_home_page.dart';
import 'package:pa_mobile/pages/home_page.dart';
import 'register_page.dart';
import 'package:flutter/material.dart';

// Kelas Login adalah StatefulWidget untuk halaman login
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Instance FirebaseAuth untuk melakukan autentikasi
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Variable untuk menangani status loading
  final bool _loading = false;

  // GlobalKey untuk form
  final _formKey = GlobalKey<FormState>();

  // Controller untuk input email dan password
  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();

  // Method untuk melakukan login
  void _login() async {
    try {
      // Perform Firebase login
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _ctrlEmail.text,
        password: _ctrlPassword.text,
      );

      // If login is successful, get user information from Firestore
      await getUserInfoFromFirestore(userCredential.user!);

      // Show success dialog
      _showDialog(
          'Success', 'Login successful! User ID: ${userCredential.user?.uid}');
    } on FirebaseAuthException catch (e) {
      // Show error dialog for authentication failure
      _showDialog('Error', 'Login failed. ${e.message}');
    } catch (e) {
      // Show error dialog for other exceptions
      _showDialog('Error', 'An unexpected error occurred. $e');
    }
  }

  // Method to get user information from Firestore
  Future<void> getUserInfoFromFirestore(User user) async {
    try {
      DocumentSnapshot userInfo =
          await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

      if (userInfo.exists) {
        // User information exists in Firestore
        String userRole = userInfo['role'];

        // Redirect to the appropriate page based on user role
        if (userRole == 'admin') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AdminBottomNavExample()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomNavExample()),
          );
        }
      } else {
        // User information doesn't exist
        print('User information not found in Firestore.');
      }
    } catch (e) {
      // Handle exceptions if any
      print('Error getting user information from Firestore: $e');
    }
  }

  // Method untuk menampilkan dialog
  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _ctrlEmail,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silakan Masukkan Email Anda';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _ctrlPassword,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silakan Masukkan Password Anda';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    _login();
                  },
                  child: _loading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text("Submit"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: Text("Belum Punya Akun? Klik Disini Untuk Register"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
