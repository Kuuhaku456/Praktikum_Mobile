import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySlideItem extends StatefulWidget {
  final String ? maintitle;
  final String ? subtitle;
  final String ? labelbutton;
  final String ? imagepath;
  final Function() ? onPressed;
  const MySlideItem(
    {
      super.key,
      required  this.imagepath,
      required  this.labelbutton,
      required  this.maintitle,
      required  this.subtitle,
      required  this.onPressed,
    }
  );

  @override
  State<MySlideItem> createState() => _MySlideItemState();
}

class _MySlideItemState extends State<MySlideItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 150,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage('${widget.imagepath}'),
            fit: BoxFit.cover,
          )),
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: 10,
            child: SizedBox(
              width: 223,
              height: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    '${widget.maintitle}',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5),
                  AutoSizeText(
                    '''${widget.subtitle}''',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[600],
                    ),
                    onPressed: widget.onPressed,
                    child: AutoSizeText(
                      '${widget.labelbutton}',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
