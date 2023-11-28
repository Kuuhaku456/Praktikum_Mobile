import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProductCard extends StatefulWidget {
  final Function () ? onTap;
  final String ? productlabel;
  final Color ? backgroundPriceColor;
  final int ? price;
  final String ? imagePath;
  final bool ? isFavorite;
  const MyProductCard(
    {
      super.key,
      required this.onTap,
      required this.backgroundPriceColor,
      required this.price,
      required this.productlabel,
      required this.imagePath,
      this.isFavorite = false,
    }
  );

  @override
  State<MyProductCard> createState() => _MyProductCardState();
}

class _MyProductCardState extends State<MyProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 180,
        height: 240,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('${widget.imagePath}'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: 200,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 130,
                    height: 60,
                    child: AutoSizeText(
                      '${widget.productlabel}',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.favorite_border_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 130,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: AutoSizeText(
                      'Rp. ${widget.price},-',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
