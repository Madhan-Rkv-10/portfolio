import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../contacts.dart';

class ContactIcon extends StatelessWidget {
  const ContactIcon({required this.icon, required this.onPressed, super.key});
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                blurRadius: 8, offset: const Offset(0, 1), color: primaryColor)
          ]),
      child: IconButton(
          icon: FaIcon(
            icon,
            color: primaryColor,
          ),
          onPressed: onPressed),
    );
  }
}
