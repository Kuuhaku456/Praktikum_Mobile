import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyanimeCard extends StatefulWidget {
  final int index;
  final String title;
  final String imagePath;
  final String rating;
  final bool isFavorite;
  final String episode;
  final Function()? handleTap;
  final bool isTapped;
  const MyanimeCard(
      {required this.index,
      required this.title,
      required this.imagePath,
      required this.rating,
      required this.episode,
      this.isFavorite = false,
      this.isTapped = false,
      this.handleTap,
  });

  @override
  State<MyanimeCard> createState() => _MyanimeCardState();
}

class _MyanimeCardState extends State<MyanimeCard> {
  @override
  Widget build(BuildContext context) {
    var Lebar = MediaQuery.of(context).size.width;
    Color containerColor = widget.isTapped ? Colors.grey : Color(0xFF374259);
    Color textColor = widget.isTapped ? Colors.yellow : Colors.yellow;
    Color iconColor = widget.isTapped ? Colors.yellow : Colors.yellow;
    return Container(
      width: Lebar,
      height: 150,
      margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Expanded(
        child: Row(
          children: [
            Container(
             width: Lebar / 10,
              height: 130,
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF374259),
              ),
              child: Center(
                child: Text(
                  '${widget.index + 1}',
                  style: GoogleFonts.poppins(
                    color: Colors.yellow,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: Lebar / 4.7,
              height: 170,
              margin: EdgeInsets.only(left: 20, right: 10, top: 15, bottom: 15),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
                // image: DecorationImage(
                //   image: AssetImage(widget.imagePath),
                //   fit: BoxFit.cover,
                // ),
              ),
              child:  CachedNetworkImage(
                  imageUrl: widget.imagePath,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Container(
              width: Lebar / 2.9,
              height: 150,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              decoration: BoxDecoration(
                  color: Colors.green
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 7),
                      decoration: BoxDecoration(
                          color: Colors.red
                          ),
                      child: Text(
                        widget.title,
                        style: GoogleFonts.poppins(
                          color: Color(0xFF374259),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: Lebar / 2.9,
                    height: 70,
                    decoration: BoxDecoration(
                        // color: Colors.blue
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.rating}, ${widget.episode}',
                          style: GoogleFonts.poppins(
                            color: Color(0xFF374259),
                          ),
                        ),
                        InkWell(
                          onTap:
                              //_handleTap, // Ketika kontainer ditekan, panggil _handleTap.
                              (){
                                
                              },
                          child: AnimatedContainer(
                            width: Lebar / 4.5,
                            height: 40,
                            duration: Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: containerColor,
                                boxShadow: [
                                  BoxShadow()
                                ]), // Durasi animasi. // Ganti warna kontainer sesuai kondisi.
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.grade,
                                    color: iconColor, // Atur warna ikon.
                                    size: 25,
                                  ),
                                  Text(
                                    '${widget.rating}',
                                    style: GoogleFonts.poppins(
                                      color: textColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon:
                  widget.isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
              iconSize: 20,
              color: widget.isFavorite ? Color(0xFF374259) : null,
              onPressed: (){
                widget.handleTap?.call();
              },
            ),
          ],
        ),
      ),
    );
  }
}
