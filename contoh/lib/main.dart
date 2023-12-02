import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth_services.dart';
import 'firebase_options.dart';
import 'pages/admin_home_page.dart';
import 'pages/home_page.dart';
import 'pages/introduction_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);  

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    // Dapatkan UserID saat aplikasi dimulai
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userId = user.uid;
      print('UserID: $userId');
    } else {
      print('Pengguna belum login');
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: _authService.authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasData) {
            // Pemeriksaan apakah pengguna memiliki peran admin
            bool isAdmin = snapshot.data!.uid == 'admin'; // Ganti dengan nilai yang sesuai
            // Berdasarkan peran pengguna, rutekan ke halaman yang sesuai
            return isAdmin ? AdminBottomNavExample() : BottomNavExample();
          } else {
            return IntroductionPage();
          }
        },
      ),
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}
