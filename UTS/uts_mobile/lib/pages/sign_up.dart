import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_mobile/widget/button.dart';
import 'package:uts_mobile/widget/button_logo.dart';
import 'package:uts_mobile/widget/passwordfield.dart';
import 'package:uts_mobile/widget/textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Text(
              'Sign Up',
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                      image: AssetImage('assets/yae.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          MyTextField(
            prefixicon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
            hintText: 'Full Name. . .',
            controller: fullnameController,
          ),
          const SizedBox(height: 20),
          MyTextField(
            prefixicon: const Icon(
              Icons.mail,
              color: Colors.black,
            ),
            hintText: 'Your Email. . .',
            controller: emailController,
          ),
          const SizedBox(height: 20),
          MyPasswordField(
              prefixicon: const Icon(
                Icons.lock,
                color: Colors.black,
              ),
              controller: passwordController,
              hintText: 'Your Password. . .'),
          const SizedBox(height: 20),
          MyButton(
            text: 'Sign Up', 
            onTap: () {
              Navigator.pushNamed(context, '/signIn');
            }
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1.0,
                    color: Colors.grey[400],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Or continue with',
                    style: GoogleFonts.poppins(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1.0,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          MyLogoButton(
            onTap: () {},
            imagePath: 'assets/facebook_icon.png',
            labelText: 'Continue With Facebook',
            backgroundColors: Colors.blue[800],
            textColor: Colors.white,
          ),
          const SizedBox(height: 20),
          MyLogoButton(
            onTap: () {},
            imagePath: 'assets/google_icon.png',
            labelText: 'Continue With Google',
            backgroundColors: Colors.white,
            textColor: Colors.black,
          ),
          const SizedBox(height: 3),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already Have an Account?',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signIn');
                  }, 
                  child: Text(
                    'Sign in',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  )
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
