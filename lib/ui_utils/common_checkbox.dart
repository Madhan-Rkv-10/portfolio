import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonCheckBox extends StatelessWidget {
  const CommonCheckBox(
      {required this.text, super.key, this.color = Colors.black, this.style});
  final String text;
  final Color color;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile.adaptive(
        title: Text(
          text,
          style: style ??
              GoogleFonts.openSans(fontSize: 15, color: Colors.black54),
        ),
        activeColor: Colors.white38,
        checkColor: Color.fromARGB(255, 201, 94, 124),
        value: true,
        onChanged: (value) {});
  }
}
