// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madhan_portfolio/screens/contacts.dart';
import 'package:madhan_portfolio/screens/widgets/common_image.dart';
import 'package:madhan_portfolio/utils/src/helpers/ui_dimens.dart';

class SkillsCard extends StatelessWidget {
  const SkillsCard({
    Key? key,
    required this.image,
    this.isFlutter = false,
    required this.name,
    this.width = 170,
  }) : super(key: key);

  final String image;
  final bool isFlutter;
  final String name;
  final double width;
  @override
  Widget build(BuildContext context) {
    print(image);
    return Stack(
      children: [
        Container(
          height: 250,
          width: width,
          decoration: BoxDecoration(
              color: Color(0xff0E5A9D),
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                  color: primaryColor.withOpacity(0.2),
                  spreadRadius: 1,
                ),
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.elliptical(70, 70),
                bottomRight: Radius.elliptical(70, 70),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              )),
        ),
        Container(
          height: 250,
          width: width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  topLeft: Radius.elliptical(100, 100),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.elliptical(100, 100))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CommonImage(
                image: image,
                networkImage: false,
              ),
              Text(
                name,
                style: GoogleFonts.openSans(
                    fontSize: 20, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ],
    ).paddingAll(8);
  }
}
