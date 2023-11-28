import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_mobile/models/product.dart';
import 'package:uts_mobile/widget/Quality_section.dart';
import 'package:uts_mobile/widget/image_button.dart';
import 'package:uts_mobile/widget/product_card.dart';
import 'package:uts_mobile/widget/search_bar.dart';
import 'package:uts_mobile/widget/slide_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _listitem = [
    MySlideItem(
      onPressed: () {},
      imagepath: 'assets/slip_on_shoe.jpg',
      labelbutton: 'Beli Sekarang!',
      maintitle: 'Shop at Patrobas!',
      subtitle:
          'Sepatu Patrobas dirancang khusus untuk menemani kamu sehari-hari',
    ),
    MySlideItem(
      onPressed: () {},
      imagepath: 'assets/slip_on_shoe.jpg',
      labelbutton: 'Beli Sekarang!',
      maintitle: 'Shop at Patrobas!',
      subtitle:
          'Sepatu Patrobas dirancang khusus untuk menemani kamu sehari-hari',
    ),
    MySlideItem(
      onPressed: () {},
      imagepath: 'assets/slip_on_shoe.jpg',
      labelbutton: 'Beli Sekarang!',
      maintitle: 'Shop at Patrobas!',
      subtitle:
          'Sepatu Patrobas dirancang khusus untuk menemani kamu sehari-hari',
    ),
  ];
  final List<Product> _productitem = [
    Product(
      title: 'New Ivan Black White',
      price: 289900,
      imagePath: 'assets/slip_on_shoe.jpg',
    ),
    Product(
      title: 'New Ivan Black White',
      price: 289900,
      imagePath: 'assets/slip_on_shoe.jpg',
    ),
    Product(
      title: 'New Ivan Black White',
      price: 289900,
      imagePath: 'assets/slip_on_shoe.jpg',
    ),
    Product(
      title: 'New Ivan Black White',
      price: 289900,
      imagePath: 'assets/slip_on_shoe.jpg',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              )),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Patrobas Shoes Store',
                style: GoogleFonts.poppins(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          MySeacrhBar(
            onTap: () {},
            iconBar: const Icon(
              Icons.search,
              size: 40,
            ),
            backgroundColor: Colors.grey[300],
            labeltext: 'Search. . .',
          ),
          const SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyImageButton(
                onTap: () {
                  
                },
                imagepath: 'assets/ivan_shoes.jpg',
                labeltext: 'Ivan',
              ),
              MyImageButton(
                onTap: () {},
                imagepath: 'assets/cloud_shoe.jpg',
                labeltext: 'Cloud',
              ),
              MyImageButton(
                onTap: () {},
                imagepath: 'assets/equip_shoe.jpg',
                labeltext: 'Equip',
              ),
              MyImageButton(
                onTap: () {},
                imagepath: 'assets/slip_on_shoe.jpg',
                labeltext: 'Slip on',
              ),
            ],
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: AutoSizeText(
              'Patrobas Here For You!',
              style: GoogleFonts.poppins(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: AutoSizeText(
              '#GengPatrobas Memberikan segalanya untukmu.',
              style: GoogleFonts.poppins(
                fontSize: 17,
                color: Colors.grey[500],
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyProductCard(
                  onTap: () {},
                  backgroundPriceColor: Colors.white,
                  price: 289900,
                  productlabel: 'New Ivan Black White',
                  imagePath: 'assets/equip_shoe.jpg'),
              MyProductCard(
                  onTap: () {},
                  backgroundPriceColor: Colors.white,
                  price: 289900,
                  productlabel: 'New Ivan Black White',
                  imagePath: 'assets/equip_shoe.jpg'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyProductCard(
                  onTap: () {},
                  backgroundPriceColor: Colors.white,
                  price: 289900,
                  productlabel: 'New Ivan Black White',
                  imagePath: 'assets/equip_shoe.jpg'),
              MyProductCard(
                  onTap: () {},
                  backgroundPriceColor: Colors.white,
                  price: 289900,
                  productlabel: 'New Ivan Black White',
                  imagePath: 'assets/equip_shoe.jpg'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: AutoSizeText(
              'Dari Patrobas Untukmu.',
              style: GoogleFonts.poppins(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: AutoSizeText(
              'Kamu #GengPatrobas? Yuk, tetap update bersama Patrobas.',
              style: GoogleFonts.poppins(
                fontSize: 17,
                color: Colors.grey[500],
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 10),
          CarouselSlider(
            items: _listitem,
            options: CarouselOptions(
              height: 200,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: AutoSizeText(
              'Best Seller.',
              style: GoogleFonts.poppins(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: AutoSizeText(
              'Best Seller #GengPatrobas Untukmu.',
              style: GoogleFonts.poppins(
                fontSize: 17,
                color: Colors.grey[500],
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 230,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _productitem.length,
                itemBuilder: (BuildContext context, int index) {
                  return MyProductCard(
                    onTap: () {},
                    backgroundPriceColor: Colors.white,
                    price: _productitem[index].price,
                    productlabel: _productitem[index].title,
                    imagePath: _productitem[index].imagePath,
                  );
                },
              )),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyQualitySection(
                imagePath: 'assets/garansi.png',
                desc:
                    'Anda bisa menukarkan sepatu jika ada kesalahan ukuran maupun pengiriman',
                mainTitle: 'Garansi 7 Hari',
              ),
              MyQualitySection(
                imagePath: 'assets/kualitas.png',
                desc:
                    'Anda bisa menukarkan sepatu jika ada kesalahan ukuran maupun pengiriman',
                mainTitle: 'Kualitas Terbaik',
              ),
              MyQualitySection(
                imagePath: 'assets/produk_indonesia.png',
                desc:
                    'Anda bisa menukarkan sepatu jika ada kesalahan ukuran maupun pengiriman',
                mainTitle: 'Produk Indonesia',
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/slip_on_shoe.jpg',
                    ),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high)),
            child: Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: Colors.black.withAlpha(120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '10k++ orang sudah menjadi #GengPatrobas. Kamu kapan?',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[600],
                      ),
                      onPressed: (){
                        Navigator.pushNamed(context, '/Screen');
                      },
                      child: AutoSizeText(
                        'Gabung Sekarang!',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
