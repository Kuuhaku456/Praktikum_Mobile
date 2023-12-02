import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'edit_account.dart';
import 'introduction_page.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan informasi pengguna yang sedang login
    final User? user = FirebaseAuth.instance.currentUser;

    // Mendapatkan lebar layar perangkat
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: <Widget>[
          // Tampilan profil di bagian atas
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                // Menggunakan FutureBuilder untuk mendapatkan data pengguna dari Firestore
                FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(user?.uid)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Menampilkan indikator loading jika data masih diambil
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      // Menampilkan pesan error jika terjadi kesalahan
                      return Text('Error: ${snapshot.error}');
                    } else {
                      // Mendapatkan data pengguna dari Firestore
                      var userData =
                          snapshot.data?.data() as Map<String, dynamic>?;

                      // Menampilkan elemen-elemen profil pengguna
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: screenWidth < 600 ? 60 : 80,
                            backgroundColor: Colors.white,
                            backgroundImage: userData?['profileImageUrl'] !=
                                    null
                                ? NetworkImage(userData?['profileImageUrl'])
                                    as ImageProvider<Object>?
                                : AssetImage('images/avatarplaceholder.png'),
                          ),
                          SizedBox(height: 10),
                          Text(
                            userData?['name'] ??
                                '', // Menampilkan nama pengguna
                            style: TextStyle(
                              fontSize: screenWidth < 600 ? 18 : 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            user?.email ??
                                '', // Menampilkan alamat email pengguna
                            style: TextStyle(
                                fontSize: screenWidth < 600 ? 16 : 18),
                          ),
                          Text(
                            userData?['address'] ??
                                '', // Menampilkan alamat pengguna
                            style: TextStyle(
                                fontSize: screenWidth < 600 ? 16 : 18),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Divider(),

          // Daftar opsi serupa seperti sebelumnya
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              // Aksi ketika Menu Profil ditekan
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountEditPage()),
              );
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.language),
          //   title: Text('Language'),
          //   onTap: () {
          //     // Aksi ketika Bahasa dipilih
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.privacy_tip),
          //   title: Text('Privacy Policy'),
          //   onTap: () {
          //     // Aksi ketika Kebijakan Privasi dipilih
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sign Out'),
            onTap: () {
              // Fungsi untuk logout
              _logout(context);
            },
          ),
        ],
      ),
    );
  }

  // Metode untuk logout
  void _logout(BuildContext context) async {
    // Menampilkan dialog konfirmasi
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Sign Out'),
          content: Text('Apakah Anda yakin ingin keluar?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Menutup dialog konfirmasi jika dibatalkan
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () async {
                // Menutup dialog konfirmasi
                Navigator.of(context).pop();
                // Melakukan logout
                await _performLogout(context);
              },
              child: Text('Keluar'),
            ),
          ],
        );
      },
    );
  }

  // Metode untuk melakukan logout
  Future<void> _performLogout(BuildContext context) async {
    try {
      // Melakukan logout dari Firebase Authentication
      await FirebaseAuth.instance.signOut();
      // Pindahkan pengguna ke halaman lain setelah logout berhasil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IntroductionPage()),
      );
    } catch (e) {
      print('Error during logout: $e');
      // Menampilkan pesan kesalahan jika diperlukan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error during logout: $e'),
        ),
      );
    }
  }
}