import 'package:flutter/material.dart';
import 'package:posttest5_096_filipus_manik/pages/Screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Import halaman sign-up

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var Lebar = MediaQuery.of(context).size.width;
    var Tinggi = MediaQuery.of(context).size.height;
    Future.delayed(const Duration(seconds: 3), () {
      // Pindah ke halaman sign-up setelah 2 detik
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const Screen(),
        ),
      );
    });
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Container(
          width: Lebar,
          height: Tinggi,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 300,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 50.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                  image: DecorationImage(
                    image: AssetImage("Assets/Kny.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const SpinKitFoldingCube(
                color: Colors.orange,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
