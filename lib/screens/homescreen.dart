import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:madhan_portfolio/screens/contacts.dart';
import 'package:madhan_portfolio/screens/widgets/skills_section.dart';
import 'package:madhan_portfolio/ui_utils/async_data.dart';
import 'package:madhan_portfolio/ui_utils/common_checkbox.dart';
import 'package:madhan_portfolio/ui_utils/common_icon.dart';
import 'package:madhan_portfolio/utils/src/helpers/ui_dimens.dart';

import '../controller/data_controller.dart';
import '../ui_utils/common_appbar.dart';

class ScreenA extends HookConsumerWidget {
  /// Constructs a [ScreenA] widget.
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: SingleChildScrollView(
          child: AsyncValueWidget(
              value: ref.watch(resumeDataProvider),
              data: (data) {
                print(data);
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "Hi,I'm ",
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          ),
                          TextSpan(
                            text: data.data?.name.toString(),
                            style: TextStyle(
                                fontSize: 30,
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          )
                        ]))

                        // Text(
                        //   "Hi, I'm Madhan",
                        //   style: TextStyle(
                        //       fontSize: 30, color:primaryColor),
                        // ),

                        ),
                    Gap(15),
                    Text(
                      "A Flutter Developer",
                      style: TextStyle(fontSize: 16),
                    )
                        .animate(onPlay: (controller) => controller.repeat())
                        .shimmer(duration: 1200.ms, color: primaryColor)
                        .animate() // this wraps the previous Animate in another Animate
                        .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                        .slide(),
                    const SizedBox(
                      height: 15,
                    ),
                    AnimatedTextKit(
                      isRepeatingAnimation: false,

                      animatedTexts: [
                        // TypewriterAnimatedText(
                        //   "  I am a passionate Flutter developer who thrives on coding and continuously updating my skills. With a deep love for problem-solving, I am driven to achieve challenging targets , I am excited about the future possibilities in mobile app development.",
                        //   textAlign: TextAlign.center,
                        // ),

                        TypewriterAnimatedText(
                            textAlign: TextAlign.center,
                            "Passionate Flutter developer with a knack for creating sleek and functional mobile applications.")
                      ],
                      // onTap: () {
                      //   print("Tap Event");
                      // },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Who I Am?",
                        style: TextStyle(
                            fontSize: 27,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "   I am a passionate Flutter developer from Chennai, who thrives on coding and continuously updating my skills. With a deep love for problem-solving, I am driven to achieve challenging targets , I am excited about the future possibilities in mobile app development.",
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.openSans(
                          fontSize: 25, color: Colors.pink),
                    )
                        .animate()
                        .fadeIn(duration: 900.ms, delay: 300.ms)
                        .shimmer(
                            blendMode: BlendMode.srcOver, color: Colors.white12)
                        .move(
                            begin: const Offset(-16, 0),
                            curve: Curves.easeOutQuad),
                    SizedBox(
                      height: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          shadowColor: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        "Download Resume",
                        // style: GoogleFonts.openSans(color: primaryColor),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Technical Skills",
                        style: TextStyle(
                          fontSize: 27,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SkillsSection(
                      skills: data.data?.languages ?? [],
                    )

                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    //   child: PhysicalModel(
                    //       color: Colors.white,
                    //       elevation: 5,
                    //       borderRadius: BorderRadius.circular(8),
                    //       shape: BoxShape.rectangle,
                    //       child: ExpansionTile(
                    //         title: Text("Languages"),
                    //         children: [
                    //           const Divider(
                    //             thickness: 1.0,
                    //             height: 1.0,
                    //           ),
                    //           ConstrainedBox(
                    //               constraints: const BoxConstraints(),
                    //               child: Column(
                    //                 mainAxisSize: MainAxisSize.min,
                    //                 children: [
                    //                   CommonCheckBox(text: "Dart"),
                    //                   CommonCheckBox(text: "HTML"),
                    //                   CommonCheckBox(text: "CSS"),
                    //                   CommonCheckBox(text: "JS"),
                    //                   CommonCheckBox(text: "Python"),
                    //                   CommonCheckBox(text: "Java"),

                    //                   // Container(
                    //                   //   margin: EdgeInsets.all(5),
                    //                   //   child: Row(
                    //                   //       mainAxisAlignment:
                    //                   //           MainAxisAlignment.spaceBetween,
                    //                   //       //  mainAxisSize: Main,
                    //                   //       children: [
                    //                   //         // Container(
                    //                   //         //   width: 6,
                    //                   //         //   height: 40,
                    //                   //         //   decoration: BoxDecoration(
                    //                   //         //       color: Colors.blue,
                    //                   //         //       borderRadius: BorderRadius.only(
                    //                   //         //           topRight: Radius.circular(10),
                    //                   //         //           bottomRight:
                    //                   //         //               Radius.circular(10))),
                    //                   //         //   child: Text(''),
                    //                   //         // ),
                    //                   //         // Container(
                    //                   //         //   child: Text("Dart"),
                    //                   //         // )
                    //                   //       ]),
                    //                   // )
                    //                 ],
                    //               ))
                    //         ],
                    //       )),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    //   child: PhysicalModel(
                    //       color: Colors.white,
                    //       elevation: 5,
                    //       borderRadius: BorderRadius.circular(8),
                    //       shape: BoxShape.rectangle,
                    //       child: ExpansionTile(
                    //         title: Text("Framework"),
                    //         children: [
                    //           const Divider(
                    //             thickness: 1.0,
                    //             height: 1.0,
                    //           ),
                    //           ConstrainedBox(
                    //               constraints: const BoxConstraints(),
                    //               child: Column(
                    //                 mainAxisSize: MainAxisSize.min,
                    //                 children: [
                    //                   CommonCheckBox(text: "Flutter"),

                    //                   // Container(
                    //                   //   margin: EdgeInsets.all(5),
                    //                   //   child: Row(
                    //                   //       mainAxisAlignment:
                    //                   //           MainAxisAlignment.spaceBetween,
                    //                   //       //  mainAxisSize: Main,
                    //                   //       children: [
                    //                   //         // Container(
                    //                   //         //   width: 6,
                    //                   //         //   height: 40,
                    //                   //         //   decoration: BoxDecoration(
                    //                   //         //       color: Colors.blue,
                    //                   //         //       borderRadius: BorderRadius.only(
                    //                   //         //           topRight: Radius.circular(10),
                    //                   //         //           bottomRight:
                    //                   //         //               Radius.circular(10))),
                    //                   //         //   child: Text(''),
                    //                   //         // ),
                    //                   //         // Container(
                    //                   //         //   child: Text("Dart"),
                    //                   //         // )
                    //                   //       ]),
                    //                   // )
                    //                 ],
                    //               ))
                    //         ],
                    //       )),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    //   child: PhysicalModel(
                    //       color: Colors.white,
                    //       elevation: 5,
                    //       borderRadius: BorderRadius.circular(8),
                    //       shape: BoxShape.rectangle,
                    //       child: ExpansionTile(
                    //         title: Text("DataBase"),
                    //         children: [
                    //           const Divider(
                    //             thickness: 1.0,
                    //             height: 1.0,
                    //           ),
                    //           ConstrainedBox(
                    //               constraints: const BoxConstraints(),
                    //               child: Column(
                    //                 mainAxisSize: MainAxisSize.min,
                    //                 children: [
                    //                   CommonCheckBox(text: "Hive"),
                    //                   CommonCheckBox(text: "SqlLite"),
                    //                   CommonCheckBox(text: "SqlServer"),
                    //                   CommonCheckBox(text: "Cloud Firestore"),

                    //                   // Container(
                    //                   //   margin: EdgeInsets.all(5),
                    //                   //   child: Row(
                    //                   //       mainAxisAlignment:
                    //                   //           MainAxisAlignment.spaceBetween,
                    //                   //       //  mainAxisSize: Main,
                    //                   //       children: [
                    //                   //         // Container(
                    //                   //         //   width: 6,
                    //                   //         //   height: 40,
                    //                   //         //   decoration: BoxDecoration(
                    //                   //         //       color: Colors.blue,
                    //                   //         //       borderRadius: BorderRadius.only(
                    //                   //         //           topRight: Radius.circular(10),
                    //                   //         //           bottomRight:
                    //                   //         //               Radius.circular(10))),
                    //                   //         //   child: Text(''),
                    //                   //         // ),
                    //                   //         // Container(
                    //                   //         //   child: Text("Dart"),
                    //                   //         // )
                    //                   //       ]),
                    //                   // )
                    //                 ],
                    //               ))
                    //         ],
                    //       )),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    //   child: PhysicalModel(
                    //       color: Colors.white,
                    //       elevation: 5,
                    //       borderRadius: BorderRadius.circular(8),
                    //       shape: BoxShape.rectangle,
                    //       child: ExpansionTile(
                    //         title: Text("Services"),
                    //         children: [
                    //           const Divider(
                    //             thickness: 1.0,
                    //             height: 1.0,
                    //           ),
                    //           ConstrainedBox(
                    //               constraints: const BoxConstraints(),
                    //               child: Column(
                    //                 mainAxisSize: MainAxisSize.min,
                    //                 children: [
                    //                   CommonCheckBox(text: "REST API"),
                    //                   CommonCheckBox(text: "Firebase"),
                    //                 ],
                    //               ))
                    //         ],
                    //       )),
                    // )
                  ],
                ).paddingAll(8);
              })),
    );
  }
}
