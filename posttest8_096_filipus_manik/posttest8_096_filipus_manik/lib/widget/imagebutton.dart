import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyImageButton extends StatefulWidget {
  final Function()? onTap;
  final String? labeltext;
  final String? imagepath;
  final Color ? backgroundColor;
  final Color ? textColor;
  const MyImageButton({
    super.key,
    required this.onTap,
    required this.imagepath,
    required this.labeltext,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  State<MyImageButton> createState() => _MyImageButtonState();
}

class _MyImageButtonState extends State<MyImageButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 20, right: 15),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                        widget.imagepath.toString(),
                    ),
                  ),
                ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                widget.labeltext.toString(),
                style: GoogleFonts.poppins(
                  color: widget.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
