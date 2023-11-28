import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySeacrhBar extends StatefulWidget {
  final Function() ? onTap;
  final String ? labeltext;
  final Color ? backgroundColor;
  final Widget ? iconBar;
  const MySeacrhBar(
    {
      super.key,
      required this.iconBar,
      required this.backgroundColor,
      required this.labeltext,
      required this.onTap,
    }
  );

  @override
  State<MySeacrhBar> createState() => _MySeacrhBarState();
}

class _MySeacrhBarState extends State<MySeacrhBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Center(
        child: Container(
          width: 370,
          height: 70,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.only(left: 20),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: widget.iconBar
                ),
              ),
              const SizedBox(width: 30),
              Text(
                '${widget.labeltext}',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
