import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyImageButton extends StatefulWidget {
  final Function() ? onTap;
  final String ? labeltext;
  final String ? imagepath;
  const MyImageButton(
    {
      super.key,
      required this.onTap,
      required this.imagepath,
      required this.labeltext,
    }
  );

  @override
  State<MyImageButton> createState() => _MyImageButtonState();
}

class _MyImageButtonState extends State<MyImageButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 80,
        height: 30,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('${widget.imagepath}'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset.zero,
                blurRadius: 2.0,
                spreadRadius: 0.0,
              )
            ]),
        child: Center(
          child: Text(
            '${widget.labeltext}',
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
