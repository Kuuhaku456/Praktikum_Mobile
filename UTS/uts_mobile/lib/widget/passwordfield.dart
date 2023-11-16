import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixicon;
  const MyPasswordField({
    required this.prefixicon,
    required this.controller,
    required this.hintText,
    super.key,
  });

  @override
  State<MyPasswordField> createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  bool _obscureText = true;
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
            obscureText: _obscureText,
            cursorColor: Colors.black,
            style: GoogleFonts.poppins(fontSize: 20),
            decoration: InputDecoration(
                prefixIcon: widget.prefixicon,
                suffixIcon: IconButton(
                  icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                  color: Colors.black,
                  onPressed: (){
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
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