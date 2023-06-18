import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:madhan_portfolio/screens/contact_form.dart';
import 'package:http/http.dart' as http;

import '../../../responsive/web_screen.dart';
import '../../contacts.dart';

final _formKey = GlobalKey<FormState>();

class ContactSection extends HookConsumerWidget {
  const ContactSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 1400,
      ),
      margin: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: primaryColor,
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(color: primaryColor)
      ),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
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
                          fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
                Container(
                    width: 500,
                    // height: 600,
                    child: Lottie.asset('assets/json/contact.json')),
                Text(
                  "K.Madhan",
                  style:
                      GoogleFonts.openSans(fontSize: 20, color: primaryColor),
                ),
                Text(
                  "A Flutter Developer",
                  style:
                      GoogleFonts.openSans(fontSize: 20, color: Colors.black),
                ),
                FindMe(isbottom: true)
              ],
            ),
          ),
          Expanded(
            child: Form(key: _formKey, child: ContactForm(formkey: _formKey)),
          )
        ],
      ),
    );
  }
}

InputDecoration commonDecoration(String value) {
  return InputDecoration(
      hintText: value,
      hintStyle: GoogleFonts.openSans(color: Colors.white),
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
      fillColor: Colors.white);
}

Future sendEmail(String name, String email, String message) async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  const serviceId = 'service_a9lo892';
  const templateId = 'template_amce8yp';
  const userId = '_DbPHqYlc1GewkHd9';
  final response = await http.post(url,
      headers: {
        'Content-Type': 'application/json'
      }, //This line makes sure it works for all platforms.
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'from_name': name,
          'from_email': email,
          'message': message
        }
      }));
  return response.statusCode;
}
