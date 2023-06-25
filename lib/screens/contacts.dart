// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:madhan_portfolio/screens/contact_form.dart';
import 'package:madhan_portfolio/ui_utils/common_elevated_button.dart';
import 'package:madhan_portfolio/utils/src/helpers/ui_dimens.dart';
// import 'package:portfolio_flutter/src/utils/src/helpers/ui_dimens.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ui_utils/common_icon.dart';

final Color primaryColor = Color.fromARGB(255, 18, 79, 124);
final _formKey = GlobalKey<FormState>();

class ScreenC extends HookConsumerWidget {
  /// Constructs a [ScreenC] widget.
  const ScreenC({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Contact ",
          style: GoogleFonts.openSans(color: Colors.white),
        ),
        actions: [
          CommonIcon(
            icon: FontAwesomeIcons.google,
            onPressed: () {
              const value =
                  "https://developers.google.com/profile/u/mad_han_10";
              launchUrl(Uri.parse(value));
            },
            color: Colors.white,
          ),
          CommonIcon(
            icon: FontAwesomeIcons.github,
            onPressed: () async {
              const String url = "https://github.com/Madhan-Rkv-10";

              await launchUrl(Uri.parse(url));
            },
            color: Colors.white,
          ),
          CommonIcon(
            icon: FontAwesomeIcons.linkedinIn,
            onPressed: () async {
              await launchUrl(
                Uri.parse("https://www.linkedin.com/in/madhan-k-/"),
              );
            },
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Lets Built Something better",
                        style: GoogleFonts.openSans(
                            fontSize: 20, color: Colors.black),
                      ),
                      Text(
                        "Together",
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                scale: 1.28,
                // transform:Matrix4.translation(3),
                child: Lottie.asset(
                    animate: true,
                    // alignment: Alignment.center,
                    // width: do,
                    height: context.screenHeight * 0.4,
                    // fit: BoxFit.fitHeight,
                    'assets/json/contact.json'),
              ),
              const ContactForm()
            ],
          ).paddingSymmetric(horizontal: 14),
        ),
      ),
    );
  }
}

class FormTitle extends StatelessWidget {
  const FormTitle({super.key, required this.title, this.isWeb = false});
  final String title;
  final bool isWeb;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: GoogleFonts.openSans(
              fontSize: 18,
              color: isWeb ? Colors.black : primaryColor,
              fontWeight: FontWeight.w500),
        ));
  }
}
