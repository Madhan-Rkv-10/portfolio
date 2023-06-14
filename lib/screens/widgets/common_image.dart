// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CommonImage extends StatelessWidget {
  const CommonImage(
      {required this.image,
      this.height = 100,
      this.networkImage = true,
      super.key});
  final String image;
  final double height;
  final bool networkImage;
  @override
  Widget build(BuildContext context) {
    return networkImage
        ? Image.network(height: height, image)
        : Image.asset(height: height, image);
  }
}
