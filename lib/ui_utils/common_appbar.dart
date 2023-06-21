// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madhan_portfolio/screens/contacts.dart';
import 'package:madhan_portfolio/ui_utils/common_icon.dart';
import 'package:madhan_portfolio/utils/src/helpers/ui_dimens.dart';
import 'package:url_launcher/url_launcher.dart';

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

class CommonAppBar extends AppBar {
  final ScrollController? scrollController;
  final bool isWeb;
  CommonAppBar(
      {final String? title,
      super.key,
      this.isWeb = false,
      final bool actionExpand = false,
      this.scrollController})
      : super(
            toolbarHeight: 65,
            backgroundColor: primaryColor,
            automaticallyImplyLeading: false,
            leading: CircleAvatar(
              child: Text("M"),
              backgroundColor: Colors.white,
              radius: 7,
            ).paddingOnly(left: 5),
            title: Text(
              title ?? 'Madhan',
              style: GoogleFonts.openSans(color: Colors.white),
            ),
            elevation: 10,
            actions: [
              if (!actionExpand) ...[
                CommonIcon(
                  icon: Icons.email_outlined,
                  textButton: isWeb,
                  title: 'Home',
                  onPressed: () async {
                    if (isWeb) {
                      scrollToTopPercentage(scrollController!, 0);
                    } else {
                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'madhanrkv10@gmail.com',
                      );
                      await launchUrl(emailLaunchUri);
                    }
                  },
                  color: Colors.white,
                ),
                CommonIcon(
                    icon: FontAwesomeIcons.github,
                    textButton: isWeb,
                    title: "About",
                    onPressed: () async {
                      if (isWeb) {
                        scrollToTopPercentage(scrollController!, 0.3);
                      } else {
                        const String url =
                            "https://github.com/agiratech-madhan?tab=repositories";

                        await launchUrl(Uri.parse(url));
                      }
                    },
                    color: Colors.white),
                CommonIcon(
                    icon: FontAwesomeIcons.linkedinIn,
                    textButton: isWeb,
                    title: "Projects",
                    onPressed: () async {
                      if (isWeb) {
                        scrollToTopPercentage(scrollController!, 0.75);
                      } else {
                        await launchUrl(
                          Uri.parse("https://www.linkedin.com/in/madhan-k-/"),
                        );
                      }
                    },
                    color: Colors.white),
                if (isWeb)
                  CommonIcon(
                      icon: FontAwesomeIcons.linkedinIn,
                      textButton: isWeb,
                      title: "Contact",
                      onPressed: () async {
                        scrollToTopPercentage(scrollController!, 1);
                      },
                      color: Colors.white),
              ] else ...[
                CommonIcon(
                    icon: Icons.more_vert_outlined,
                    textButton: isWeb,
                    onPressed: () {},
                    color: Colors.white)
              ]
            ]);
}
