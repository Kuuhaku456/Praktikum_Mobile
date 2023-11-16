import 'package:flutter/material.dart';

class MyImageButton extends StatefulWidget {
  final Function()? onTap;
  final String? imagepath;
  final Color? backgroundColor;
  final Widget? text;
  const MyImageButton({
    super.key,
    required this.onTap,
    required this.imagepath,
    required this.backgroundColor,
    required this.text,
  });

  @override
  State<MyImageButton> createState() => _MyImageButtonState();
}

class _MyImageButtonState extends State<MyImageButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
    );
  }
}