import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommonTextField extends TextField {
  const CommonTextField({super.key}) : super();
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.openSans(color: Colors.white, fontSize: 17),
      decoration: InputDecoration(
          hintText: 'Enter Your Name',
          hintStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
            ),
          ),
          fillColor: Colors.black),
    );
  }
}
