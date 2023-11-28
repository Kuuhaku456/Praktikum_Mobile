import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/widget/Button.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: lebar,
        height: tinggi,
        decoration: const BoxDecoration(
          color: Color(0xFF374259),
        ),
        child: ListView(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: lebar,
                  height: 380,
                ),
                Container(
                  width: lebar,
                  height: 300,
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(350),
                        bottomRight: Radius.circular(350)),
                  ),
                ),
                Positioned(
                  top: 190,
                  left: 122,
                  child: Container(
                    width: 170,
                    height: 170,
                    decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/logo-wallpaper.jpeg'),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              ],
            ),
            Center(
              child: AutoSizeText(
                'I work at EDLAC and I am intrested in meeting a hardworking and loving man. I,m your girl.',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.yellow[600],
                ),
                maxLines: 5,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: lebar,
              height: 500,
              margin: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF374259)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        margin: const EdgeInsets.only(left: 10, top: 20),
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/logo-wallpaper.jpeg'),
                              fit: BoxFit.cover,
                            )),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: Text(
                          'Details',
                          style: GoogleFonts.poppins(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.yellow),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.yellow, //color of divider
                    height: 5, //height spacing of divider
                    thickness: 3, //thickness of divier line
                    indent: 10, //spacing at the start of divider
                    endIndent: 10, //spacing at the end of divider
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      AutoSizeText(
                        'Username',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.yellow),
                      ),
                      const SizedBox(width: 50),
                      AutoSizeText(
                        'Filipus Adriel Manik',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.yellow),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      AutoSizeText(
                        'Usia',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.yellow),
                      ),
                      const SizedBox(width: 280),
                      AutoSizeText(
                        '19',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      AutoSizeText(
                        'No. Telepon',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.yellow),
                      ),
                      const SizedBox(width: 95),
                      AutoSizeText(
                        '081218100498',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      AutoSizeText(
                        'Email',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.yellow),
                      ),
                      const SizedBox(width: 40),
                      AutoSizeText(
                        'manikfilip03@gmail.com',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  MyButton(
                    onTap: () {},
                    text: 'Edit',
                    backgroundColor: Colors.yellow,
                    textColor: const Color(0xFF374259),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
