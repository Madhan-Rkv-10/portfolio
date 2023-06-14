// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommonIcon extends StatelessWidget {
  const CommonIcon(
      {required this.icon,
      required this.onPressed,
      Key? key,
      this.size = 25,
      this.color = Colors.black})
      : super(key: key);
  final IconData? icon;
  final VoidCallback? onPressed;
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: FaIcon(
          icon,
          color: color,
          size: size,
        ));
  }
}
