import 'package:flutter/material.dart';
import 'package:uts_mobile/pages/Screen.dart';
import 'package:uts_mobile/pages/homepage.dart';
import 'package:uts_mobile/pages/landing_Page.dart';
import 'package:uts_mobile/pages/sign_in.dart';
import 'package:uts_mobile/pages/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:  const LandingPage(),
      routes: {
        '/signIn' : (context) => const SignIn(),
        '/signUp' : (context) => const SignUp(),
        '/Home' : (context) => const HomePage(),
        '/Screen' : (context) => const MyScreen(),
      },
    );
  }
}


