import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyLogoButton extends StatefulWidget {
  final String? imagePath;
  final Color? backgroundColors;
  final String? labelText;
  final Function()? onTap;
  final Color? textColor;
  const MyLogoButton({
    required this.imagePath,
    required this.textColor,
    required this.onTap,
    required this.labelText,
    required this.backgroundColors,
    super.key,
  });

  @override
  State<MyLogoButton> createState() => _MyLogoButtonState();
}

class _MyLogoButtonState extends State<MyLogoButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: widget.backgroundColors,
          borderRadius: BorderRadius.circular(40),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset.zero,
              blurRadius: 2.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('${widget.imagePath}'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
            ),
            Text(
              '${widget.labelText}',
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: widget.textColor,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
