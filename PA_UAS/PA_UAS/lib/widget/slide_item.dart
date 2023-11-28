import 'package:flutter/material.dart';

class MySlideItem extends StatefulWidget {
  final Function()? onTap;
  final String ? title;
  final int ? rating;
  const MySlideItem(
    {
      super.key,
      required this.onTap,
      required this.rating,
      required this.title,
    }
  );

  @override
  State<MySlideItem> createState() => _MySlideItemState();
}

class _MySlideItemState extends State<MySlideItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 500,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage('assets/one_piece.jpg'),
            filterQuality: FilterQuality.low,
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 125,
              child: Container(
                width: 330,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF374259).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'One Piece',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow),
                    ),
                    Container(
                      width: 70,
                      height: 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.yellow,
                          ),
                          Text(
                            '8.45',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
