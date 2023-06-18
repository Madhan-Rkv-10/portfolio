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
import 'package:url_launcher/url_launcher.dart';

import '../controller/data_controller.dart';
import '../ui_utils/common_appbar.dart';

class ScreenA extends HookConsumerWidget {
  /// Constructs a [ScreenA] widget.
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Madhan",
      ),
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
                            style: GoogleFonts.openSans(
                                fontSize: 30, color: Colors.black),
                          ),
                          TextSpan(
                            text: data.data?.name.toString(),
                            style: GoogleFonts.openSans(
                                fontSize: 30,
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          )
                        ]))

                        // Text(
                        //   "Hi, I'm Madhan",
                        //   style: GoogleFonts.openSans(
                        //       fontSize: 30, color:primaryColor),
                        // ),

                        ),
                    Gap(15),
                    Text(
                      "A Flutter Developer",
                      style: GoogleFonts.openSans(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    )
                        .animate(onPlay: (controller) => controller.repeat())
                        .shimmer(duration: 1200.ms, color: primaryColor)
                        .animate() // this wraps the previous Animate in another Animate
                        .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                        .slide(),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                        "Passionate Flutter developer with a knack for creating sleek and functional mobile applications.",
                        style: GoogleFonts.openSans(fontSize: 14)),
                    const SizedBox(
                      height: 15,
                    ),
                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: Text(
                    //     "Who I Am?",
                    //     style: GoogleFonts.openSans(
                    //         fontSize: 27,
                    //         color: primaryColor,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Who I Am?",
                          style: GoogleFonts.openSans(
                              fontSize: 22,
                              color: primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            launchUrl(Uri.parse(
                                "https://drive.google.com/file/d/1Fb-qefjDj4tPPfjtf3w9x5kY8itqzNCR/view"));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              foregroundColor: Colors.white,
                              shadowColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: const Text(
                            "More Info",
                            // style: GoogleFonts.openSans(color: primaryColor),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "   I am a passionate Flutter developer from Chennai, who thrives on coding and continuously updating my skills. With a deep love for problem-solving, I am driven to achieve challenging targets,I am excited about the future possibilities in mobile app development.",
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.openSans(
                          fontSize: 18, color: Colors.black),
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

                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Technical Skills",
                        style: GoogleFonts.openSans(
                          fontSize: 22,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SkillsSection(
                      skills: data.data?.languages ?? [],
                    )
                  ],
                ).paddingAll(13);
              })),
    );
  }
}
