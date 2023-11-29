import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/models/anime.dart';
import 'package:posttest5_096_filipus_manik/pages/Favorites.dart';
import 'package:posttest5_096_filipus_manik/pages/detail_anime.dart';
import 'package:posttest5_096_filipus_manik/pages/notifications.dart';
import 'package:posttest5_096_filipus_manik/pages/signinpage.dart';
import 'package:posttest5_096_filipus_manik/widget/anime_cards.dart';
import 'package:posttest5_096_filipus_manik/widget/slide_item.dart';

class HomePage extends StatefulWidget {
  final id;
  final Animes? anime;
  const HomePage({
    super.key,
    this.id,
    this.anime,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int id = 0;
  void onTapped(int passid) {
    id = passid;
  }

  int _currentIndex = 0;
  final List<Widget> _slides = [
    MySlideItem(
        onTap: () {},
        rating: 8.45,
        title: 'One Piece',
        imagePath: 'assets/one_piece.jpg'),
    MySlideItem(
        onTap: () {},
        rating: 8.88,
        title: 'Mushoku Tensei',
        imagePath: 'assets/mushoku_tensei.jpeg'),
    MySlideItem(
        onTap: () {},
        rating: 8.88,
        title: 'Gotoubun No Hanayome',
        imagePath: 'assets/gotoubun.jpg'),
  ];
  List animeList = Animes.animeList;
  @override
  Widget build(BuildContext context) {
    var Lebar = MediaQuery.of(context).size.width;
    var Tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF374259),
        title: Text('CrunchRyoll',
            style: GoogleFonts.poppins(
                color: Colors.yellow,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.of(context)
              .push(CupertinoPageRoute(builder: (BuildContext context) {
            return const MySigninPage();
          })),
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
            onPressed: () => Navigator.of(context)
                .push(CupertinoPageRoute(builder: (BuildContext context) {
              return MyNotification();
            })),
            disabledColor: Color(0xFF374259),
          ),
          CupertinoButton(
            child: Icon(
              Icons.favorite,
              size: 30,
              color: Colors.yellow,
            ),
            onPressed: () => Navigator.of(context)
                .push(CupertinoPageRoute(builder: (BuildContext context) {
              return const Favorites();
            })),
            disabledColor: const Color(0xFF374259),
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
                  'CURRENT AIRING',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow),
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
              SizedBox(
                width: double.infinity,
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (int index = 0; index < animeList.length; index++)
                      MyAnimeCards(
                        onTap: () => Navigator.of(context).push(
                            CupertinoPageRoute(builder: (BuildContext context) {
                          return MyAnimeDetails(id: animeList[index].id);
                        })),
                        rating: animeList[index].rating,
                        title: animeList[index].judul,
                        imagePath: animeList[index].imagePath,
                      )
                  ],
                ),
              )
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
