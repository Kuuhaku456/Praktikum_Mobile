import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyNotificationPage extends StatefulWidget {
  const MyNotificationPage({super.key});

  @override
  State<MyNotificationPage> createState() => _MyNotificationPageState();
}

class _MyNotificationPageState extends State<MyNotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'My Notification',
          style: GoogleFonts.poppins(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
