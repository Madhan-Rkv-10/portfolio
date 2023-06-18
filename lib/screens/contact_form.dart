// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'contacts.dart';

class ContactForm extends HookConsumerWidget {
  final GlobalKey<FormState> formkey;
  const ContactForm({required this.formkey, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final phoneNumberController = useTextEditingController();
    final emailController = useTextEditingController();
    final subjectController = useTextEditingController();
    final messageController = useTextEditingController();
    return Container(
      margin: EdgeInsets.only(
        top: 15,
        right: 20,
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        FormTitle(
          isWeb: true,
          title: "Name",
        ),
        Container(
          child: CommonTextField(
              controller: nameController,
              validate: (value) {
                // Check if this field is empty
                if (value.isEmpty) {
                  return 'This field is required';
                }

                // using regular expression

                // the email is valid
                return '';
              },
              onEditing: (value) {
                formkey.currentState?.validate();
                return '';
              },
              title: '',
              textinputAction: TextInputAction.next,
              textinputType: TextInputType.name),
        )
        // Container(
        //   width: double.infinity,
        //   // height: 50,
        //   // constraints: BoxConstraints(maxHeight: 80, minHeight: 45),
        //   child: TextFormField(
        //     enableSuggestions: true,
        //     keyboardType: TextInputType.name,
        //     onChanged: (value) {
        //      formkey.currentState?.validate();
        //     },
        //     validator: (value) {
        //       // Check if this field is empty
        //       if (value == null || value.isEmpty) {
        //         return 'This field is required';
        //       }

        //       // using regular expression

        //       // the email is valid
        //       return null;
        //     },
        //     controller: nameController,
        //     textInputAction: TextInputAction.next,
        //     style: GoogleFonts.openSans(fontSize: 18, color: Colors.black),
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
        ,
        SizedBox(
          height: 8,
        ),
        FormTitle(
          isWeb: true,
          title: "Email",
        ),
        // Container(
        //   width: double.infinity,
        //   // constraints: BoxConstraints(maxHeight: 80, minHeight: 45),
        //   child: TextFormField(
        //     enableSuggestions: true,
        //     controller: emailController,
        //     onChanged: (value) {
        //      formkey.currentState?.validate();
        //     },
        //     validator: (value) {
        //       if (value == null || value.isEmpty) {
        //         return '*Required';
        //       } else {
        //         if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
        //           return "Please enter a valid email address";
        //         }
        //       }
        //       return null;
        //     },
        //     keyboardType: TextInputType.name,
        //     textInputAction: TextInputAction.next,
        //     style: GoogleFonts.openSans(fontSize: 18),
        //     decoration: InputDecoration(
        //       contentPadding:
        //           EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        //       // hintText: 'Email',
        //       fillColor: Colors.white,
        //       border: OutlineInputBorder(
        //         borderSide: BorderSide(
        //           color: Colors.purple,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),Premov

        Container(
          child: CommonTextField(
              controller: emailController,
              onEditing: (p0) {
                formkey.currentState!.validate();
                return '';
              },
              validate: (value) {
                if (value.isEmpty) {
                  return '*Required';
                } else {
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                }
                return '';
              },
              title: '',
              textinputAction: TextInputAction.next,
              textinputType: TextInputType.emailAddress),
        ),
        SizedBox(height: 8),
        FormTitle(
          isWeb: true,
          title: "Mobile Number",
        ),
        // Container(
        //   width: double.infinity,
        //   // constraints: BoxConstraints(maxHeight: 80, minHeight: 45),
        //   child: TextFormField(
        //     enableSuggestions: true,
        //     // maxLength: 10,
        //     // spellCheckConfiguration: SpellCheckConfiguration.disabled(),
        //     controller: phoneNumberController,
        //     keyboardType: TextInputType.number,
        //     textInputAction: TextInputAction.next,
        //     style: GoogleFonts.openSans(fontSize: 18),
        //     validator: (value) {
        //       // Check if this field is empty
        // if (value == null || value.isEmpty) {
        //   return 'This field is required';
        // } else {}

        // // using regular expression

        // // the email is valid
        // return null;
        //     },
        //     decoration: InputDecoration(
        //       // hintText: 'Hi',
        //       contentPadding:
        //           EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        //       fillColor: Colors.white,
        //       border: OutlineInputBorder(
        //         borderSide: BorderSide(
        //           color: Colors.purple,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),

        Container(
          child: CommonTextField(
              controller: phoneNumberController,
              validate: (value) {
                if (value.isEmpty) {
                  return 'This field is required';
                } else {}

                // using regular expression

                // the email is valid
                return '';
              },
              onEditing: (value) {
                formkey.currentState?.validate();
                return '';
              },
              title: 'title',
              textinputAction: TextInputAction.next,
              textinputType: TextInputType.number),
        ),

        SizedBox(
          height: 8,
        ),
        FormTitle(
          isWeb: true,
          title: "Subject",
        ),
        // Container(
        //   width: double.infinity,
        //   // constraints: BoxConstraints(maxHeight: 80, minHeight: 45),
        //   child: TextFormField(
        //     enableSuggestions: true,
        //     textInputAction: TextInputAction.next,
        //     controller: subjectController,
        //     validator: (value) {
        //       if (value == null || value.isEmpty) {
        //         return '*Required';
        //       }
        //       return null;
        //     },
        //     style: const TextStyle(fontSize: 18),
        //     decoration: const InputDecoration(
        //       // hintText: 'Hi',
        //       contentPadding:
        //           EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        //       fillColor: Colors.white,
        //       border: OutlineInputBorder(
        //         borderSide: BorderSide(
        //           color: Color.fromARGB(255, 18, 79, 124),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),

        Container(
          child: CommonTextField(
            controller: subjectController,
            validate: (value) {
              if (value.isEmpty) {
                return 'This field is required';
              } else {}

              // using regular expression

              // the email is valid
              return '';
            },
            onEditing: (value) {
              formkey.currentState?.validate();
              return '';
            },
            title: 'title',
            textinputAction: TextInputAction.next,
            textinputType: TextInputType.name,
          ),
        ),

        const SizedBox(
          height: 8,
        ),
        FormTitle(
          isWeb: true,
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

        Container(
          child: CommonTextField(
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
              formkey.currentState?.validate();
              return '';
            },
            title: 'title',
            textinputAction: TextInputAction.done,
            textinputType: TextInputType.multiline,
          ),
        ),

        Container(
            width: 710,
            height: 50,
            margin: EdgeInsets.only(top: 30, bottom: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white),
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    log("${nameController.text}"
                        "${emailController.text}"
                        "${messageController.text}");
                    final values = await sendEmail(nameController.text,
                        emailController.text, messageController.text);
                    // //TODO: send email
                    nameController.clear();
                    emailController.clear();
                    phoneNumberController.clear();
                    messageController.clear();
                    subjectController.clear();
                    print(values);
                  }
                  // await FlutterEmailSender.send(emailData);
                },
                child: Text('Send Message'))),
      ]),
    );
  }
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
