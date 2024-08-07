// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../ui_utils/common_elevated_button.dart';
import '../ui_utils/common_textfield.dart';
import 'contacts.dart';

const webScreenSize = 700;
final formKey = GlobalKey<FormState>();

class ContactForm extends HookConsumerWidget {
  const ContactForm({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final phoneNumberController = useTextEditingController();
    final emailController = useTextEditingController();
    final subjectController = useTextEditingController();
    final messageController = useTextEditingController();
    final isLoading = useState(false);
    return LayoutBuilder(builder: (context, constraints) {
      final isWeb = constraints.maxWidth > webScreenSize;
      return Form(
        key: formKey,
        child: Container(
          margin: const EdgeInsets.only(
            top: 15,
            right: 20,
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            FormTitle(
              isWeb: isWeb,
              title: "Name",
            ),
            CommonTextField(
                controller: nameController,
                validate: (value) {
                  // Check if this field is empty
                  if (value.isEmpty) {
                    return 'This field is required';
                  }

                  // using regular expression

                  // the email is valid
                  return null;
                },
                onEditing: (value) {
                  formKey.currentState?.validate();
                  return '';
                },
                title: '',
                textinputAction: TextInputAction.next,
                textinputType: TextInputType.name),
            const SizedBox(
              height: 8,
            ),
            FormTitle(
              isWeb: isWeb,
              title: "Email",
            ),
            Container(
              child: CommonTextField(
                  controller: emailController,
                  onEditing: (p0) {
                    formKey.currentState!.validate();
                    return null;
                  },
                  validate: (value) {
                    if (value.isEmpty) {
                      return '*Required';
                    } else {
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return "Please enter a valid email address";
                      }
                    }
                    return null;
                  },
                  title: '',
                  textinputAction: TextInputAction.next,
                  textinputType: TextInputType.emailAddress),
            ),
            const SizedBox(height: 8),
            FormTitle(
              isWeb: isWeb,
              title: "Mobile Number",
            ),
            Container(
              child: CommonTextField(
                  controller: phoneNumberController,
                  phoneLength: isWeb,
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'This field is required';
                    } else if (value.length < 10) {
                      return "please Enter Valid Mobile Number";
                    }

                    // using regular expression

                    // the email is valid
                    return null;
                  },
                  onEditing: (value) {
                    formKey.currentState?.validate();
                    return '';
                  },
                  title: 'title',
                  textinputAction: TextInputAction.next,
                  textinputType: TextInputType.number),
            ),
            const SizedBox(
              height: 8,
            ),
            FormTitle(
              isWeb: isWeb,
              title: "Subject",
            ),
            Container(
              child: CommonTextField(
                controller: subjectController,
                validate: (value) {
                  if (value.isEmpty) {
                    return 'This field is required';
                  } else {}

                  return null;
                },
                onEditing: (value) {
                  formKey.currentState?.validate();
                  return null;
                },
                title: 'title',
                textinputAction: TextInputAction.next,
                textinputType: TextInputType.name,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const FormTitle(
              isWeb: true,
              title: "Message",
            ),
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
                  return null;
                },
                onEditing: (value) {
                  formKey.currentState?.validate();
                  return '';
                },
                title: 'title',
                textinputAction: TextInputAction.done,
                textinputType: TextInputType.multiline,
              ),
            ),
            Container(
              width: isWeb ? 710 : double.infinity,
              height: 50,
              margin: const EdgeInsets.only(top: 30, bottom: 20),
              child: CommonElevatedButton(
                loading: isLoading.value,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    // log("${nameController.text}"
                    //     "${emailController.text}"
                    //     "${messageController.text}");
                    isLoading.value = !isLoading.value;
                    final values = await sendEmail(nameController.text,
                        emailController.text, messageController.text);

                    nameController.clear();
                    emailController.clear();
                    phoneNumberController.clear();
                    messageController.clear();
                    subjectController.clear();
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
          ]),
        ),
      );
    });
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
