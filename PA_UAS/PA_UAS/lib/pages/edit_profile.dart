import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:posttest5_096_filipus_manik/pages/Screen.dart';
import 'package:posttest5_096_filipus_manik/pages/profile.dart';
import 'package:posttest5_096_filipus_manik/widget/Button.dart';
import 'package:posttest5_096_filipus_manik/widget/emailTextfield.dart';
import 'package:posttest5_096_filipus_manik/widget/passwordtextfield.dart';
import 'package:posttest5_096_filipus_manik/widget/textfield.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class MyEditProfile extends StatefulWidget {
  const MyEditProfile({super.key});

  @override
  State<MyEditProfile> createState() => _MyEditProfileState();
}

class _MyEditProfileState extends State<MyEditProfile> {
  File? _profileImage;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void showAlert(String message) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      text: message,
    );
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _profileImage = File(pickedFile.path);
      }
    });
  }

  void showAlertSuccess(String message) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: message,
      onConfirmBtnTap: () => Navigator.of(context)
          .push(CupertinoPageRoute(builder: (BuildContext context) {
        return const Screen();
      })),
    );
  }

  void clearInputs() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    // Pastikan untuk membersihkan kontroler ketika widget dihapus
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF374259),
        appBar: AppBar(
          title: Text(
            'Edit Profile',
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.yellow,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: const Color(0xFF374259),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Lets Edit your profile!',
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: Colors.yellow,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      _getImage();
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: _profileImage != null
                          ? Image.file(_profileImage!, fit: BoxFit.cover)
                          : const Icon(Icons.add_a_photo, size: 40),
                    ),
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                      controller: usernameController,
                      hintText: 'Username',
                      prefixicon: const Icon(
                        Icons.person,
                        color: Color(0xFF374259),
                      )),
                  const SizedBox(height: 20),
                  MyEmailTextField(
                      controller: emailController,
                      hintText: 'Email',
                      prefixicon: const Icon(
                        Icons.mail,
                        color: Color(0xFF374259),
                      ),
                      showMessage: () {
                        showAlert(
                            'Inputan tidak boleh kosong atau Format email masih salah');
                      }),
                  const SizedBox(height: 20),
                  MyPasswordTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    prefixicon: const Icon(
                      Icons.lock,
                      color: Color(0xFF374259),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 5),
                    child: MyButton(
                        onTap: () {
                          if (usernameController.text == "" ||
                              passwordController.text == "") {
                            showAlert('inputan tidak boleh kosong');
                          } else if (!RegExp(
                                  r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
                              .hasMatch(emailController.text)) {
                            showAlert('Format Email Salah');
                          } else {
                            showAlertSuccess('Profile Berhasil diupdate');
                            clearInputs();
                          }
                        },
                        text: 'Save Changes',
                        backgroundColor: Colors.yellow,
                        textColor: const Color(0xFF374259)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
