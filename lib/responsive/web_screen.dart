// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:madhan_portfolio/ui_utils/async_data.dart';
import 'package:madhan_portfolio/ui_utils/common_appbar.dart';
import 'package:madhan_portfolio/ui_utils/common_elevated_button.dart';
import 'package:madhan_portfolio/utils/src/helpers/ui_dimens.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/data_controller.dart';
import '../screens/contacts.dart';
import '../screens/webscreen/widgets/contact_icon.dart';
import '../screens/webscreen/widgets/contact_wen.dart';
import '../screens/webscreen/widgets/project_web.dart';
import '../screens/webscreen/widgets/skills_web.dart';
import '../screens/widgets/skills_card.dart';

void scrollToTopPercentage(ScrollController controller, double position) {
  final double maxScrollExtent = controller.position.maxScrollExtent;
  final double targetScrollPosition =
      maxScrollExtent * position; // 10% of the total height

  controller.animateTo(
    targetScrollPosition,
    duration: Duration(
        milliseconds:
            500), // Optional: specify a duration for the scrolling animation
    curve: Curves.ease, // Optional: specify an easing curve for the animation
  );
}

class WebScreenLayout extends HookConsumerWidget {
  final Widget child;
  const WebScreenLayout({required this.child, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    // final resumeData = ref.watch(resumeDataProvider);
    // useEffect(() {
    //   void scrollToSection(int index) {
    //     scrollController.animateTo(
    //       index * 200.0, // Assuming each section has a height of 200
    //       duration: const Duration(milliseconds: 500),
    //       curve: Curves.easeInOut,
    //     );
    //   }
    // }, [scrollController]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: const Text("M").paddingAll(5)),
                SizedBox(width: 20),
                Text(
                  "Madhan",
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    scrollToTopPercentage(scrollController, 0);
                  },
                  child: Text(
                    "Home",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      scrollToTopPercentage(scrollController, 0.3);
                    },
                    child: Text(
                      "About",
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      scrollToTopPercentage(scrollController, 0.65);
                    },
                    child: Text(
                      "Projects",
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      scrollToTopPercentage(scrollController, 1);
                    },
                    child: Text(
                      "Contact",
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TextButton(
            //     onPressed: () {
            //       scrollToTopPercentage(scrollController);
            //     },
            //     child: Text("Navigate to 70 percent")),
            Container(
              height: 700,
              // color: Colors.blue,
              constraints: const BoxConstraints(
                maxWidth: 1400,
              ),
              // color: Colors.red,
              margin: const EdgeInsets.all(25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    // flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              "Welcome to My World".toUpperCase(),
                              style: GoogleFonts.openSans(
                                  fontSize: 23,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 40),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Hi,I'm ",
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: "Madhan",
                                    style: GoogleFonts.openSans(
                                        fontSize: 30,
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Mobile Application Developer",
                              style: GoogleFonts.openSans(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            )
                                .animate(
                                    onPlay: (controller) => controller.repeat())
                                .shimmer(duration: 1200.ms, color: Colors.blue)
                                .animate() // this wraps the previous Animate in another Animate
                                .fadeIn(
                                    duration: 1200.ms,
                                    curve: Curves.easeOutQuad)
                                .slide(),
                            const SizedBox(
                              height: 20,
                            ),
                            AnimatedTextKit(
                              isRepeatingAnimation: false,

                              animatedTexts: [
                                // TypewriterAnimatedText(
                                //   "  I am a passionate Flutter developer who thrives on coding and continuously updating my skills. With a deep love for problem-solving, I am driven to achieve challenging targets , I am excited about the future possibilities in mobile app development.",
                                //   textAlign: TextAlign.center,
                                // ),

                                TypewriterAnimatedText(
                                    textAlign: TextAlign.left,
                                    textStyle: GoogleFonts.openSans(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                    "Passionate Flutter developer with a knack for creating sleek and functional mobile applications. ")
                              ],
                              // onTap: () {
                              //   print("Tap Event");
                              // },
                            ),
                            // Text(
                            //     "I am also passionate about open source software and I am always willing to help others"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("FIND ME",
                                style: GoogleFonts.openSans(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                            const SizedBox(height: 15),
                            FindMe(),
                          ],
                        ),
                        const SizedBox(height: 50)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Transform.scale(
                        scale: 1.2,
                        child: Lottie.asset(
                            animate: true, 'assets/json/home_lottie.json'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 1400,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            constraints: const BoxConstraints(
                              maxWidth: 500,
                              maxHeight: 500,
                            ),
                            child: Transform.scale(
                              scale: 1.2,
                              child: Lottie.asset(
                                animate: true,
                                'assets/json/about.json',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Who I Am?",
                                    style: GoogleFonts.openSans(
                                      fontSize: 27,
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        "   I am a passionate Flutter developer from Chennai, who thrives on coding and continuously updating my skills. With a deep love for problem-solving, I am driven to achieve challenging targets , I am excited about the future possibilities in mobile app development.",
                                        softWrap: true,
                                        textAlign: TextAlign.justify,
                                        style: GoogleFonts.openSans(
                                          fontSize: 24,
                                          color: Colors.black,
                                        ),
                                      )
                                          .animate()
                                          .fadeIn(
                                            duration: 900.ms,
                                            delay: 300.ms,
                                          )
                                          .shimmer(
                                              blendMode: BlendMode.srcOver,
                                              color: Colors.white12)
                                          .move(
                                            begin: const Offset(-16, 0),
                                            curve: Curves.easeOutQuad,
                                          ),
                                    ),
                                    Container(
                                      height: 50,
                                      margin: const EdgeInsets.only(top: 30),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 5,
                                            shadowColor: primaryColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            backgroundColor: Colors.white,
                                            surfaceTintColor: Colors.white,
                                            foregroundColor: primaryColor),
                                        onPressed: () async {
                                          launchUrl(Uri.parse(
                                              "https://drive.google.com/file/d/1Fb-qefjDj4tPPfjtf3w9x5kY8itqzNCR/view"));
                                        },
                                        child: Text(
                                          "More",
                                          style: GoogleFonts.openSans(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ).paddingAll(20),
                // child: Text("data"),
              ),
            ),
            const SkillsSectionWeb(),
            Container(
                // height: 700,
                margin: EdgeInsets.symmetric(vertical: 15),
                constraints: const BoxConstraints(
                  maxWidth: 1400,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Projects",
                  style: GoogleFonts.openSans(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                )),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 1400,
              ),
              height: 700,
              child: ProjectWeb(),
            ),
            const ContactSection(),
          ],
        ).paddingAll(10),
      ),
    );
  }
}

class FindMe extends StatelessWidget {
  const FindMe({super.key, this.isbottom = false});
  final bool isbottom;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isbottom ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        ContactIcon(
            icon: FontAwesomeIcons.github,
            onPressed: () async {
              const String url =
                  "https://github.com/agiratech-madhan?tab=repositories";

              await launchUrl(Uri.parse(url));
            }),
        ContactIcon(
            icon: FontAwesomeIcons.linkedin,
            onPressed: () async {
              await launchUrl(
                Uri.parse("https://www.linkedin.com/in/madhan-k-/"),
              );
            }),
        ContactIcon(
            icon: Icons.email_outlined,
            onPressed: () async {
              String? encodeQueryParameters(Map<String, String> params) {
                return params.entries
                    .map((MapEntry<String, String> e) =>
                        '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                    .join('&');
              }

              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'madhan.k@agiratech.com',
                query: encodeQueryParameters(<String, String>{
                  'subject': 'Example Subject & Symbols are allowed!',
                }),
              );

              await launchUrl(emailLaunchUri);
            }),
      ],
    );
  }
}
