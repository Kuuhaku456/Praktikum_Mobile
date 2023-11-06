import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/pages/Favorites.dart';
import 'package:posttest5_096_filipus_manik/pages/input_anime_streaming_page.dart';
import 'package:posttest5_096_filipus_manik/pages/notifications.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _slides = [
    Container(
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
    Container(
      width: 500,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/mushoku_tensei.jpeg'),
          filterQuality: FilterQuality.medium,
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
                    'Mushoku Tensei',
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
                          '8.88',
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
    Container(
      width: 500,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/gotoubun.jpg'),
          filterQuality: FilterQuality.medium,
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
                    'Gotoubun No Hanayome',
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
                          '7.89',
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
  ];
  @override
  Widget build(BuildContext context) {
    var Lebar = MediaQuery.of(context).size.width;
    var Tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF374259),
        title: Text(
          'CrunchRyoll',
          style: GoogleFonts.poppins(
            color: Colors.yellow,
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
          },
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://avatars.githubusercontent.com/Kuuhaku456'),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        actions: [
          CupertinoButton(
            child: Icon(
              Icons.notifications,
              size: 30,
              color: Colors.yellow,
            ), 
            onPressed: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (BuildContext context) {
                  return MyNotification();
                }
              )
            ),
            disabledColor: Color(0xFF374259),
          ),
          CupertinoButton(
            child: Icon(
              Icons.favorite,
              size: 30,
              color: Colors.yellow,
            ), 
            onPressed: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (BuildContext context) {
                  return Favorites();
                }
              )
            ),
            disabledColor: Color(0xFF374259),
          ),
          
        ],
      ),
      body: Container(
        width: Lebar,
        height: Tinggi,
        decoration: BoxDecoration(
          color: Color(0xFF374259),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'TOP AIRING',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              CarouselSlider(
                items: _slides,
                options: CarouselOptions(
                  height: 200,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              search_field(),
              Text_genre(),
              genre_section(Lebar),
              recommendation_text(),
              Container(
                width: Lebar,
                height: 270,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    one_piece_card(),
                    bnb_card(),
                    mushoku_tensei_card(),
                    Goblin_slayer_card(),
                  ],
                ),
              ),
              Container(
                width: Lebar,
                height: 60,
                color: Color(0xFF374259),
                margin: EdgeInsets.only(top: 20),
                child: DefaultTabController(
                  length: 3,
                  child: TabBar(
                    labelColor: Colors.yellow,
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: [
                      Tab(text: 'Anime'),
                      Tab(text: 'Musik'),
                      Tab(text: 'Berita'),
                    ],
                  ),
                ),
              ),
              Container(
                width: Lebar,
                height: 400,
                color: Colors.amberAccent,
                margin: EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    'COMING SOON',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: Lebar,
                height: 70,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding recommendation_text() {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Recommendation',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.yellow,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton.icon(
            onPressed: () {},
            label: Text('Lihat Semua'),
            icon: Icon(Icons.arrow_right_alt_sharp),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF374259), // Warna latar belakang tombol
              onPrimary: Colors.yellow, // Warna teks pada tombol
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10), // Mengatur sudut tombol
              ),
              minimumSize: Size(50, 50),
              elevation: 0.0, // Ukuran minimum tombol
            ),
          ),
        ],
      ),
    );
  }

  Stack Goblin_slayer_card() {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 250,
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(2, 2)),
            ],
            image: DecorationImage(
              image: AssetImage('assets/Gs2.png'),
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Container(
            width: 70,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.star,
                  size: 16,
                  color: Colors.white,
                ),
                Text(
                  '8.50',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: Color(0xFF374259),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 220,
          left: 20,
          child: Container(
            width: 180,
            height: 35,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'Goblin slayer S2',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF374259),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Stack mushoku_tensei_card() {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 250,
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(2, 2)),
            ],
            image: DecorationImage(
              image: AssetImage('assets/mushoku_tensei.jpeg'),
              filterQuality: FilterQuality.medium,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Container(
            width: 70,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.star,
                  size: 16,
                  color: Colors.white,
                ),
                Text(
                  '8.88',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: Color(0xFF374259),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 220,
          left: 20,
          child: Container(
            width: 180,
            height: 35,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'MUSOKU TENSEI',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF374259),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Stack bnb_card() {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 250,
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(2, 2)),
            ],
            image: DecorationImage(
              image: AssetImage('assets/bnb.png'),
              filterQuality: FilterQuality.medium,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Container(
            width: 70,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.star,
                  size: 16,
                  color: Colors.white,
                ),
                Text(
                  '7.49',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: Color(0xFF374259),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 220,
          left: 20,
          child: Container(
            width: 180,
            height: 35,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'BOUSHOKU',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF374259),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Stack one_piece_card() {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 250,
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(2, 2)),
            ],
            image: DecorationImage(
              image: AssetImage('assets/one_piece.jpg'),
              filterQuality: FilterQuality.low,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Container(
            width: 70,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.star,
                  size: 16,
                  color: Colors.white,
                ),
                Text(
                  '8.45',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: Color(0xFF374259),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 220,
          left: 20,
          child: Container(
            width: 180,
            height: 35,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'ONE PIECE',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF374259),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Container genre_section(double Lebar) {
    return Container(
      width: Lebar,
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            height: 120.0,
            width: 120.0,
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/kny.png'),
                        filterQuality: FilterQuality.low,
                        fit: BoxFit.cover),
                  ),
                ),
                Text(
                  'ACTION',
                  style: TextStyle(
                    color: Color(0xFF374259),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(2, 2)),
              ],
            ),
          ),
          Container(
            height: 120.0,
            width: 120.0,
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/one_piece.jpg'),
                        filterQuality: FilterQuality.low,
                        fit: BoxFit.cover),
                  ),
                ),
                Text(
                  'ADVENTURE',
                  style: TextStyle(
                    color: Color(0xFF374259),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(2, 2)),
              ],
            ),
          ),
          Container(
            height: 120.0,
            width: 120.0,
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/junji_ito.jpg'),
                        filterQuality: FilterQuality.low,
                        fit: BoxFit.cover),
                  ),
                ),
                Text(
                  'HORROR',
                  style: TextStyle(
                    color: Color(0xFF374259),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(2, 2)),
              ],
            ),
          ),
          Container(
            height: 120.0,
            width: 120.0,
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/shigatsu.jpg'),
                        filterQuality: FilterQuality.low,
                        fit: BoxFit.cover),
                  ),
                ),
                Text(
                  'DRAMA',
                  style: TextStyle(
                    color: Color(0xFF374259),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(2, 2)),
              ],
            ),
          ),
          Container(
            height: 120.0,
            width: 120.0,
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/mushoku_tensei.jpeg'),
                        filterQuality: FilterQuality.low,
                        fit: BoxFit.cover),
                  ),
                ),
                Text(
                  'MAGIC',
                  style: TextStyle(
                    color: Color(0xFF374259),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(2, 2)),
              ],
            ),
          ),
          Container(
            height: 120.0,
            width: 120.0,
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/cs.jpg'),
                        filterQuality: FilterQuality.low,
                        fit: BoxFit.cover),
                  ),
                ),
                Text(
                  'THRILLER',
                  style: TextStyle(
                    color: Color(0xFF374259),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(2, 2)),
              ],
            ),
          ),
          Container(
            height: 120.0,
            width: 120.0,
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/gotoubun.jpg'),
                        filterQuality: FilterQuality.low,
                        fit: BoxFit.cover),
                  ),
                ),
                Text(
                  'HAREM',
                  style: TextStyle(
                    color: Color(0xFF374259),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(2, 2)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding Text_genre() {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text(
        'Genre',
        style: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.yellow,
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  GestureDetector search_field() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 40, 20, 40),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF9F343),
              blurRadius: 40,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            hintText: 'Search Anime. . .',
            hintStyle: TextStyle(
              color: Color(0xFF374259),
              fontSize: 14,
            ),
            fillColor: Color(0xFF9F343),
            prefixIcon: Padding(
              padding: EdgeInsets.all(12),
              child: Icon(
                Icons.search,
                color: Color(0xFF374259),
              ),
            ),
            contentPadding: EdgeInsets.all(15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  } 
}