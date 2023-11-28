import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyQualitySection extends StatefulWidget {
  final String? imagePath;
  final String? mainTitle;
  final String? desc;
  const MyQualitySection({
    super.key,
    required this.imagePath,
    required this.desc,
    required this.mainTitle,
  });

  @override
  State<MyQualitySection> createState() => _MyQualitySectionState();
}

class _MyQualitySectionState extends State<MyQualitySection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 250,
      margin: const EdgeInsets.only(left: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3,
              spreadRadius: 0.5,
              offset: Offset(1, 1),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Container(
            height: 100,
            width: 130,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('${widget.imagePath}'),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          const SizedBox(height: 5),
          AutoSizeText(
            '${widget.mainTitle}',
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.grey,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 10),
          Text(
            '${widget.desc}',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
