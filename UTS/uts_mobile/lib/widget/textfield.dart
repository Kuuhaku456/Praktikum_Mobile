import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixicon;
  const MyTextField(
      {required this.prefixicon,
      required this.hintText,
      required this.controller,
      super.key});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 350,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(40),
          ),
          child: TextFormField(
            controller: widget.controller,
            autofocus: true,
            cursorColor: Colors.black,
            style: GoogleFonts.poppins(fontSize: 20),
            decoration: InputDecoration(
                prefixIcon: widget.prefixicon,
                hintText: widget.hintText,
                hintStyle: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(40),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                )),
          )),
    );
  }
}
