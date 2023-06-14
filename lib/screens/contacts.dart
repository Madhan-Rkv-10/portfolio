import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:madhan_portfolio/ui_utils/common_elevated_button.dart';
import 'package:madhan_portfolio/utils/src/helpers/ui_dimens.dart';
// import 'package:portfolio_flutter/src/utils/src/helpers/ui_dimens.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

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
        title: const Text(
          "Contact ",
          style: TextStyle(color: Colors.white),
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
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                )
              ]),
              Container(
                  // margin: EdgeInsets.only(right: 300),
                  child: Transform.scale(
                scale: 1.28,
                // transform:Matrix4.translation(3),
                child: Lottie.asset(
                    animate: true,
                    // alignment: Alignment.center,
                    // width: do,
                    height: context.screenHeight * 0.4,
                    // fit: BoxFit.fitHeight,
                    'assets/json/contact.json'),
              )),
              FormTitle(
                title: "Name",
              ),
              Container(
                width: double.infinity,
                constraints: BoxConstraints(maxHeight: 80, minHeight: 45),
                child: TextFormField(
                  enableSuggestions: true,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    // Check if this field is empty
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }

                    // using regular expression

                    // the email is valid
                    return null;
                  },
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    // hintText: 'Hi',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              FormTitle(
                title: "Email",
              ),
              Container(
                width: double.infinity,
                constraints: BoxConstraints(maxHeight: 80, minHeight: 45),
                child: TextFormField(
                  enableSuggestions: true,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    } else {
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return "Please enter a valid email address";
                      }
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    // hintText: 'Email',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              FormTitle(
                title: "Mobile Number",
              ),
              Container(
                width: double.infinity,
                constraints: BoxConstraints(maxHeight: 80, minHeight: 45),
                child: TextFormField(
                  enableSuggestions: true,
                  // maxLength: 10,
                  // spellCheckConfiguration: SpellCheckConfiguration.disabled(),
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(fontSize: 18),
                  validator: (value) {
                    // Check if this field is empty
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    } else {}

                    // using regular expression

                    // the email is valid
                    return null;
                  },
                  decoration: InputDecoration(
                    // hintText: 'Hi',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              FormTitle(
                title: "Subject",
              ),
              Container(
                width: double.infinity,
                constraints: BoxConstraints(maxHeight: 80, minHeight: 45),
                child: TextFormField(
                  enableSuggestions: true,
                  textInputAction: TextInputAction.next,
                  controller: subjectController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                    // hintText: 'Hi',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 18, 79, 124),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              FormTitle(
                title: "Message",
              ),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  minLines: 1,
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                  controller: messageController,
                  scrollPadding: const EdgeInsets.all(5),
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  enableSuggestions: true,
                  style: const TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    // hintText: 'Hi',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
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

  InputDecoration commonDecoration(String value) {
    return InputDecoration(
        hintText: value,
        filled: true,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple,
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
}

class FormTitle extends StatelessWidget {
  const FormTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 18, color: primaryColor, fontWeight: FontWeight.w500),
        ));
  }
}

// final _formKey = GlobalKey<FormState>();

// class ScreenC extends HookConsumerWidget {
//   const ScreenC({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
  
//     // final nameValue = useValueListenable(nameController);
//     // final phoneValue = useValueListenable(phoneNumberController);
//     // final emaiValue = useValueListenable(emailController);
//     // final subjectValue = useValueListenable(subjectController);
//     // final messageValue = useValueListenable(messageController);

//     // useEffect(() {
//     //   nameController.text = nameValue.text;
//     //   emailController.text = emaiValue.text;
//     //   phoneNumberController.text = phoneValue.text;
//     //   subjectController.text = subjectValue.text;
//     //   messageController.text = messageValue.text;
//     // }, [nameValue, phoneValue, emaiValue, subjectValue, messageValue]);

//     return

//     Container(
//       // constraints: BoxConstraints(
//       //   minWidth: context.screenWidth * 0.4,
//       //   maxWidth: context.screenWidth * 0.66,
//       //   minHeight: context.screenHeight * 0.2,
//       // ),
//       margin: const EdgeInsets.only(top: 30),
//       decoration: BoxDecoration(
//           color: Colors.black,
//           boxShadow: const [
//             BoxShadow(
//               blurRadius: 8,
//               color: Colors.orange,
//               offset: Offset(0, 2),
//             )
//           ],
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: Colors.orange)),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
            // Column(
            //   // crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Text(
            //           "Lets Built Something better",
            //           style:
            //               GoogleFonts.openSans(fontSize: 20, color: Colors.white),
            //         ),
            //         Text(
            //           "Together",
            //           style:
            //               GoogleFonts.openSans(fontSize: 20, color: Colors.white),
            //         ),
            //       ],
            //     ),
                // Container(
                //     width: 300,
                //     height: 600,
                //     child: Lottie.asset('assets/json/data.json')),
//             //     Text(
//             //       "K.Madhan",
//             //       style: GoogleFonts.openSans(fontSize: 20, color: Colors.white),
//             //     ),
//             //     Text(
//             //       "A Flutter Developer",
//             //       style: GoogleFonts.openSans(fontSize: 20, color: Colors.white),
//             //     ),
//             //     Row(
//             //       mainAxisAlignment: MainAxisAlignment.center,
//             //       children: [
//             //         // Container(
//             //         //   child: Column(
//             //         //     children: [
//             //         //       TextButton(
//             //         //         // icon: Icon(
//             //         //         //   Icons.home,
//             //         //         //   color: Colors.orange,
//             //         //         // ),
//             //         //         onPressed: () {},
//             //         //         child: Text(
//             //         //           "Home",
//             //         //           style: GoogleFonts.openSans(color: Colors.white),
//             //         //         ),
//             //         //       ),
//             //         //     ],
//             //         //   ),
//             //         // ),
//             //         IconButton(
//             //           icon: const FaIcon(
//             //             FontAwesomeIcons.github,
//             //             color: Colors.white,
//             //           ),
//             //           onPressed: () async {
//             //             final String url =
//             //                 "https://github.com/agiratech-madhan?tab=repositories";

//             //             await launchUrl(Uri.parse(url));
//             //           },
//             //         ),
//             //         IconButton(
//             //           icon: const FaIcon(
//             //             FontAwesomeIcons.linkedin,
//             //             color: Colors.white,
//             //           ),
                      // onPressed: () async {
                      //   await launchUrl(
                      //     Uri.parse("https://www.linkedin.com/in/madhan-k-/"),
                      //   );
                      // },
//             //         ),
//             //         IconButton(
//             //           icon: const Icon(
//             //             Icons.email_outlined,
//             //             color: Colors.white,
//             //           ),
//             //           onPressed: () {
//             //             String? encodeQueryParameters(
//             //                 Map<String, String> params) {
//             //               return params.entries
//             //                   .map((MapEntry<String, String> e) =>
//             //                       '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
//             //                   .join('&');
//             //             }

//             //             final Uri emailLaunchUri = Uri(
//             //               scheme: 'mailto',
//             //               path: 'madhan.k@agiratech.com',
//             //               query: encodeQueryParameters(<String, String>{
//             //                 'subject': 'Example Subject & Symbols are allowed!',
//             //               }),
//             //             );

//             //             launchUrl(emailLaunchUri);
//             //           },
//             //         ),
//             //         IconButton(
//             //           icon: const FaIcon(
//             //             FontAwesomeIcons.instagram,
//             //             color: Colors.white,
//             //           ),
//             //           onPressed: () {},
//             //         ),
//             //       ],
//             //     ),
//             //   ],
//             // ),

//             Form(
//               key: _formKey,
//               child: Column(children: [
//                 Container(
//                   width: 300,
//                   margin: EdgeInsets.only(top: 30),
//                   child: TextFormField(
//                     controller: nameController,
//                     textDirection: TextDirection.ltr,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return '*Required';
//                       }
//                       return null;
//                     },
//                     keyboardType: TextInputType.name,
//                     style:
//                         GoogleFonts.openSans(color: Colors.white, fontSize: 17),
                    // decoration: commonDecoration("Enter your Name "),
//                   ),
//                 ),
//                 Container(
//                     width: 300,
//                     margin: EdgeInsets.only(
//                       top: 30,
//                     ),
//                     child: TextFormField(
//                       style: GoogleFonts.openSans(
//                           color: Colors.white, fontSize: 17),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return '*Required';
//                         }
//                         return null;
//                       },
//                       controller: phoneNumberController,
//                       decoration: commonDecoration("Phone Number"),
//                     )),
//                 Container(
//                     margin: EdgeInsets.only(top: 30),
//                     width: 300,
//                     child: TextFormField(
//                       style: GoogleFonts.openSans(
//                           color: Colors.white, fontSize: 17),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return '*Required';
//                         }
//                         return null;
//                       },
//                       controller: emailController,
//                       decoration: commonDecoration("Enter your Email"),
//                     )),
//                 Container(
//                     width: 300,
//                     margin: EdgeInsets.only(top: 30),
//                     child: TextFormField(
//                       style: GoogleFonts.openSans(
//                           color: Colors.white, fontSize: 17),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return '*Required';
//                         }
//                         return null;
//                       },
//                       controller: subjectController,
//                       decoration: commonDecoration("Subject"),
//                     )),
//                 Container(
//                     width: 300,
//                     margin: EdgeInsets.only(top: 30, bottom: 20),
//                     child: TextFormField(
//                       style: GoogleFonts.openSans(
//                           color: Colors.white, fontSize: 17),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return '*Required';
//                         }
//                         return null;
//                       },
//                       maxLines: 5,
//                       controller: messageController,
//                       decoration: commonDecoration("Message"),
//                     )),
//                 Container(
//                     width: 300,
//                     height: 50,
//                     margin: EdgeInsets.only(top: 30, bottom: 20),
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.orange,
//                             foregroundColor: Colors.black),
                        // onPressed: () async {
                        //   if (_formKey.currentState!.validate()) {
                        //     log("${nameController.text}"
                        //         "${emailController.text}"
                        //         "${messageController.text}");
                        //     final values = await sendEmail(nameController.text,
                        //         emailController.text, messageController.text);
                        //     // //TODO: send email
                        //     nameController.clear();
                        //     emailController.clear();
                        //     phoneNumberController.clear();
                        //     messageController.clear();
                        //     subjectController.clear();
                        //     print(values);
                        //   }
                        //   // await FlutterEmailSender.send(emailData);
                        // },
//                         child: Text('Send Message'))),
//               ]),
//             )
//           ],
//         ),
//       ),
//     );

//   }
// }




