import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/pages/signinpage.dart';
import 'package:posttest5_096_filipus_manik/widget/Button.dart';
import 'package:posttest5_096_filipus_manik/widget/customsnackbar.dart';
import 'package:posttest5_096_filipus_manik/widget/passwordtextfield.dart';
import 'package:posttest5_096_filipus_manik/widget/textfield.dart';

import '../widget/imagebutton.dart';

Future<bool> BacaData(String x, String y) async {
  bool o = true;
  final userRef = FirebaseFirestore.instance.collection('users');
  await userRef.get().then((snapshot) {
    snapshot.docs.forEach((doc) {
      if (doc.data()['email'] == x || doc.data()['username'] == y) {
        print('tidak berhasil masuk email atau username sudah ada');
        o = false;
      }
    });
  });
  print(o);
  return o;
  // return false;
}

class AddUser {
  final String username;
  final String email;
  final String pass;
  final int age;

  AddUser(this.username, this.email, this.pass, this.age);

  Future<void> addUser() async {
    // bool o;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    // bool o = BacaData(email, username);
    // if (o) {
    // if (o) {
    //   return true;
    // }
    // print('tidak berhasil masuk');
    // return false;

    await users
        .add({
          'username': username,
          'email': email, // John Doe
          'password': pass, // Stokes and Sons
          'usia': '',
          'no_telp': '',
          'favorit': [],
          // 'favorit': ["sakura", "sasuke"],
          // 'age': age // 42
        })
        // ignore: avoid_print
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
    // } else {
    //   print('tidak berhasil masuk email atau username sudah ada');

    //   return;
    // }
  }
}

class MySignUpPage extends StatefulWidget {
  const MySignUpPage({super.key});

  @override
  State<MySignUpPage> createState() => _MySignUpPageState();
}

class _MySignUpPageState extends State<MySignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void showSnackbar(BuildContext context, String? title, String? message,
      String? type, Color? backgroundColor) {
    final snackbar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: MyCustomSnackbar(
          title: title,
          message: message,
          type: type,
          backgroundColor: backgroundColor),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF374259),
      appBar: AppBar(
        backgroundColor: const Color(0xFF374259),
        title: Text(
          'Sign up',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.yellow,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [
              Text(
                'Lets, Create Your Account!',
                style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.yellow),
              ),
              const SizedBox(height: 20),
              MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  prefixicon: const Icon(
                    Icons.person,
                    color: Color(0xFF374259),
                  )),
              const SizedBox(height: 17),
              MyTextField(
                  controller: emailController,
                  hintText: 'E-Mail',
                  prefixicon: const Icon(
                    Icons.mail,
                    color: Color(0xFF374259),
                  )),
              const SizedBox(height: 17),
              MyPasswordTextField(
                controller: passwordController,
                hintText: 'Password',
                prefixicon: const Icon(
                  Icons.lock,
                  color: Color(0xFF374259),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: 'I aggree to ',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.yellow,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy ',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: 'and ',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.yellow,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms of Use',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: MyButton(
                    onTap: () async {
                      if (await BacaData(
                              emailController.text, usernameController.text) ==
                          true) {
                        AddUser(usernameController.text, emailController.text,
                                passwordController.text, 1)
                            .addUser();

                        // ignore: use_build_context_synchronously
                        showSnackbar(
                            context,
                            'Berhasil!',
                            'Selamat Anda berhasil SignUp, Silahkan login terlebih dahulu!',
                            'Succes',
                            DefaultColors.successGreen);
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MySigninPage()),
                        );
                      } else {
                        // ignore: use_build_context_synchronously
                        showSnackbar(
                            context,
                            'Gagal!',
                            'tidak berhasil masuk email atau username sudah ada',
                            'Failed',
                            DefaultColors.failureRed);
                      }
                    },
                    text: 'Sign Up',
                    backgroundColor: Colors.yellow,
                    textColor: const Color(0xFF374259)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 1.0,
                        color: Colors.yellow,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: GoogleFonts.poppins(
                          color: Colors.yellow,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 1.0,
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  children: [
                    MyImageButton(
                      onTap: () {},
                      imagepath: 'assets/facebook_icon.png',
                      labeltext: 'Continue with Facebook',
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                    ),
                    MyImageButton(
                      onTap: () {},
                      imagepath: 'assets/google_icon.png',
                      labeltext: 'Continue with Google',
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have an Account?',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.yellow,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MySigninPage()),
                          );
                        },
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
