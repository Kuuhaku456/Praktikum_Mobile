import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_mobile/widget/button.dart';
import 'package:uts_mobile/widget/button_logo.dart';
import 'package:uts_mobile/widget/passwordfield.dart';
import 'package:uts_mobile/widget/textfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
          const SizedBox(height: 50),
          Center(
            child: Text(
              'Sign In',
              style: GoogleFonts.poppins(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              ''' Welcome back you've
            been missed!''',
              style: GoogleFonts.poppins(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          MyTextField(
            prefixicon: const Icon(
              Icons.mail,
              color: Colors.black,
            ),
            hintText: 'Email',
            controller: emailController,
          ),
          const SizedBox(
            height: 20,
          ),
          MyPasswordField(
              prefixicon: const Icon(
                Icons.lock,
                color: Colors.black,
              ),
              controller: passwordController,
              hintText: 'Password'),
          const SizedBox(
            height: 5,
          ),
          Container(
            margin: const EdgeInsets.only(right: 40),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Recovery Password',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MyButton(
            text: 'Sign In', 
            onTap: () {
              Navigator.pushNamed(context, '/Screen');
            },
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
                  'Dont have an account?',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signUp');
                    },
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
