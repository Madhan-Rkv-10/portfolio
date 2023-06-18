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
    final nameController = useTextEditingController();
    final phoneNumberController = useTextEditingController();
    final emailController = useTextEditingController();
    final subjectController = useTextEditingController();
    final messageController = useTextEditingController();
    final isLoading = useState(false);
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
              final value =
                  "https://developers.google.com/profile/u/mad_han_10";
            },
            color: Colors.white,
          ),
          CommonIcon(
            icon: FontAwesomeIcons.github,
            onPressed: () async {
              final String url =
                  "https://github.com/agiratech-madhan?tab=repositories";

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
              const FormTitle(
                title: "Name",
              ),
              CommonTextField(
                  controller: nameController,
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'This field is required';
                    }
                    return '';
                  },
                  onEditing: (value) {
                    _formKey.currentState?.validate();
                    return '';
                  },
                  title: '',
                  textinputAction: TextInputAction.next,
                  textinputType: TextInputType.name),
              const SizedBox(
                height: 8,
              ),
              const FormTitle(
                title: "Email",
              ),
              CommonTextField(
                controller: subjectController,
                validate: (value) {
                  if (value.isEmpty) {
                    return 'This field is required';
                  } else {}
                  return '';
                },
                onEditing: (value) {
                  _formKey.currentState?.validate();
                  return '';
                },
                title: 'title',
                textinputAction: TextInputAction.next,
                textinputType: TextInputType.name,
              ),

              const SizedBox(
                height: 8,
              ),
              FormTitle(
                title: "Message",
              ),
              // SizedBox(
              //   width: double.infinity,
              //   child: TextFormField(
              //     minLines: 1,
              //     maxLines: 5,
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return '*Required';
              //       }
              //       return null;
              //     },
              //     controller: messageController,
              //     scrollPadding: const EdgeInsets.all(5),
              //     keyboardType: TextInputType.multiline,
              //     textInputAction: TextInputAction.done,
              //     enableSuggestions: true,
              //     style: const TextStyle(fontSize: 15),
              //     decoration: InputDecoration(
              //       // hintText: 'Hi',
              //       contentPadding:
              //           EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              //       fillColor: Colors.white,
              //       border: OutlineInputBorder(
              //         borderSide: BorderSide(
              //           color: primaryColor,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              CommonTextField(
                controller: messageController,
                maxline: true,
                validate: (value) {
                  if (value.isEmpty) {
                    return 'This field is required';
                  } else {}

                  // using regular expression

                  // the email is valid
                  return '';
                },
                onEditing: (value) {
                  _formKey.currentState?.validate();
                  return '';
                },
                title: 'title',
                textinputAction: TextInputAction.done,
                textinputType: TextInputType.multiline,
              ),

              Container(
                // width: context.screenWidth * 0.9,
                child: CommonElevatedButton(
                  loading: isLoading.value,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      log("${nameController.text}"
                          "${emailController.text}"
                          "${messageController.text}");
                      isLoading.value = !isLoading.value;
                      final values = await sendEmail(nameController.text,
                          emailController.text, messageController.text);
                      // //TODO: send email
                      nameController.clear();
                      emailController.clear();
                      phoneNumberController.clear();
                      messageController.clear();
                      subjectController.clear();
                      print(values);
                      isLoading.value = !isLoading.value;
                    }
                    // await FlutterEmailSender.send(emailData);
                  },
                  iconButton: false,
                  text: "Submit",
                  roundedBorder: false,
                  borderRadiuss: 0,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white),
                ),
              )
            ],
          ).paddingSymmetric(horizontal: 14),
        ),
      ),
    );
  }

  // InputDecoration commonDecoration(String value) {
  //   return InputDecoration(
  //       hintText: value,
  //       filled: true,
  //       border: InputBorder.none,
  //       enabledBorder: OutlineInputBorder(
  //         borderSide: BorderSide(
  //           color: Colors.purple,
  //         ),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderSide: BorderSide(
  //           color: Colors.purple,
  //         ),
  //       ),
  //       fillColor: Colors.white);
  // }

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

class CommonTextField extends HookConsumerWidget {
  const CommonTextField(
      {required this.controller,
      required this.validate,
      required this.onEditing,
      required this.title,
      required this.textinputAction,
      required this.textinputType,
      this.maxline = false,
      super.key});
  final TextEditingController controller;
  final String Function(String) validate;
  final String Function(String) onEditing;
  final String title;
  final TextInputType textinputType;
  final TextInputAction textinputAction;
  final bool maxline;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      child: TextFormField(
        enableSuggestions: false,
        cursorColor: primaryColor,
        textInputAction: TextInputAction.next,
        controller: controller,
        keyboardType: textinputType,
        maxLines: maxline ? 5 : 1,
        minLines: 1,
        validator: (validate) => validate,
        autocorrect: false,
//  enableSuggestions: false,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        onChanged: (validate) => onEditing,
        decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 18, 79, 124),
              ),
            ),
            // hintText: 'Hi',
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 18, 79, 124),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 18, 79, 124),
              ),
            )),
      ),
    );
  }
}
