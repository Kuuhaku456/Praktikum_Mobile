import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Metode untuk login
  Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Error during login: $e');
      return null;
    }
  }

  // Metode untuk logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Metode untuk mendapatkan user saat ini
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Metode untuk mendengarkan perubahan status otentikasi
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}
