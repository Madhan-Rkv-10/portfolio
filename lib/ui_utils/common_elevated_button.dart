// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton(
      {Key? key,
      required this.onPressed,
      required this.iconButton,
      required this.text,
      this.roundedBorder = true,
      this.style,
      this.borderRadiuss,
      this.loading = false,
      this.icon})
      : super(key: key);
  final VoidCallback onPressed;
  final bool iconButton;
  final String text;
  final Widget? icon;
  final bool roundedBorder;
  final bool loading;
  final ButtonStyle? style;
  final double? borderRadiuss;
  @override
  Widget build(BuildContext context) {
    if (iconButton) {
      return ElevatedButton.icon(
        icon: icon ?? const Text(''),
        style: style ??
            ElevatedButton.styleFrom(
              shape: roundedBorder
                  ? const StadiumBorder()
                  : borderRadiuss == null
                      ? RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))
                      : RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadiuss!)),
            ),
        onPressed: onPressed,
        label: Text(
          text,
        ),
      );
    } else {
      return ElevatedButton(
        style: style ??
            ElevatedButton.styleFrom(
              shape: roundedBorder
                  ? const StadiumBorder()
                  : RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
            ),
        onPressed: onPressed,
        child: loading
            ? const CircularProgressIndicator.adaptive(
                // color: Colors.white,
                valueColor: AlwaysStoppedAnimation(Colors.white))
            : Text(
                text,
              ),
      );
    }
  }
}
