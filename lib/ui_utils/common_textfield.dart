import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../screens/contacts.dart';

class CommonTextField extends HookConsumerWidget {
  const CommonTextField(
      {required this.controller,
      required this.validate,
      required this.onEditing,
      required this.title,
      required this.textinputAction,
      required this.textinputType,
      this.phoneLength = false,
      this.maxline = false,
      super.key});
  final TextEditingController controller;
  final Function(String) validate;
  final Function(String) onEditing;
  final String title;
  final TextInputType textinputType;
  final TextInputAction textinputAction;
  final bool maxline;
  final bool phoneLength;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        enableSuggestions: false,
        cursorColor: primaryColor,
        textInputAction: TextInputAction.next,
        controller: controller,
        keyboardType: textinputType,
        maxLines: maxline ? 5 : 1,
        minLines: 1,
        maxLength: phoneLength ? 10 : null,
        validator: (v) {
          return validate(v ?? '');
        },
        autocorrect: false,
//  enableSuggestions: false,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        onFieldSubmitted: validate,
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
