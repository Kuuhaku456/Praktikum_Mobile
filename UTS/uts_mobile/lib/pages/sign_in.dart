import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          Center(
            child: Text(
              'Sign Up',
              style: GoogleFonts.poppins(
                fontSize: 50,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(
                      image: AssetImage('assets/patrobas-logo.jpeg'),
                    ),
                  ),
                ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100), 
                        color: Colors.yellow
                      ),
                      child: GestureDetector(
                        onTap: (){},
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}