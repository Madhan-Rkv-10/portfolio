// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonIcon extends StatelessWidget {
  const CommonIcon(
      {required this.icon,
      required this.onPressed,
      Key? key,
      this.size = 25,
      this.title = '',
      this.textButton = false,
      this.color = Colors.black})
      : super(key: key);
  final IconData? icon;
  final VoidCallback? onPressed;
  final double size;
  final Color color;
  final bool textButton;
  final String title;
  @override
  Widget build(BuildContext context) {
    if (textButton) {
      return TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: GoogleFonts.openSans(
            color: Colors.white,
          ),
        ),
      );
    } else {
      return IconButton(
          onPressed: onPressed,
          icon: FaIcon(
            icon,
            color: color,
            size: size,
          ));
    }
  }
}
