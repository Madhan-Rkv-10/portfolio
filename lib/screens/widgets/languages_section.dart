// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguagesSection extends StatelessWidget {
  const LanguagesSection({
    Key? key,
    required this.names,
  }) : super(key: key);
  final List<String> names;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      // height: 70,
      spacing: 10,
      children: names.map((e) => LanguagesCard(name: e.toString())).toList(),
    );
  }
}

class LanguagesCard extends StatelessWidget {
  const LanguagesCard({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
        // width: 100,
        constraints: BoxConstraints(minWidth: 100, maxWidth: 120),
        height: 45,
        alignment: Alignment.center,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            // shape: BoxShape.circle,
            // border:
            //     Border.all(color: Color.fromARGB(255, 18, 79, 124)),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                offset: Offset(0, 1),
                color: Color.fromARGB(255, 18, 79, 124),
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)),
        child: FittedBox(
          child: Text(
            name,
            style: GoogleFonts.openSans(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ));
  }
}
