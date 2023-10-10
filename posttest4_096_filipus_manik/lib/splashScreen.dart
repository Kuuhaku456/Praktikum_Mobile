import 'package:flutter/material.dart';
import 'input_anime_streaming_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';// Import halaman sign-up

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 3), () {
      // Pindah ke halaman sign-up setelah 2 detik
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const SignUpPage(),
        ),
      );
    }
    );

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width : 300,
              height: 200,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 50.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                  image: AssetImage("Assets/logo_anime.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 50),
            SpinKitSpinningLines(
              color: Colors.orange,
              size: 50.0,
            ),

            // Container(
            //   width : 100,
            //   height: 100,
            //   color: Colors.amber,
            // ),
          ],
        ),
        // child: Text(
        //   'Splash Screen',
        //   style: TextStyle(fontSize: 24.0),
        // ),
      ),
    );
  }
}
