import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_mobile/pages/sign_up.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100),
          Center(
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/patrobas-logo.jpeg'),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                    spreadRadius: 0,
                    offset: Offset(1, 1),
                  )
                ]
              ),
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: Text(
              '''Jadi Bagian dari #GengPatrobas\n
            Tim Sepatu Berkualitas\n
                  Harga Terjangkau''',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 60),
          AnimatedButton(
              height: 70,
              width: 200,
              text: 'Mulai',
              isReverse: true,
              selectedTextColor: Colors.black,
              transitionType: TransitionType.LEFT_TO_RIGHT,
              textStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.white,
              ),
              backgroundColor: Colors.black,
              borderColor: Colors.black,
              borderRadius: 50,
              borderWidth: 2,
              onPress: (){
                Navigator.of(context).push(_createRoute());
              },
          ),
        ],
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const SignUp(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}