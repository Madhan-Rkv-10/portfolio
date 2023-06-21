// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madhan_portfolio/screens/contacts.dart';
import 'package:madhan_portfolio/ui_utils/common_icon.dart';
import 'package:madhan_portfolio/utils/src/helpers/ui_dimens.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonAppBar extends AppBar {
  final ScrollController? scrollController;
  CommonAppBar(
      {final String? title,
      super.key,
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
              title ?? '',
              style: GoogleFonts.openSans(color: Colors.white),
            ),
            elevation: 10,
            actions: [
              if (!actionExpand) ...[
                CommonIcon(
                  icon: Icons.email_outlined,
                  onPressed: () async {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'madhanrkv10@gmail.com',
                    );
                    await launchUrl(emailLaunchUri);
                  },
                  color: Colors.white,
                ),
                CommonIcon(
                    icon: FontAwesomeIcons.github,
                    onPressed: () async {
                      const String url =
                          "https://github.com/agiratech-madhan?tab=repositories";

                      await launchUrl(Uri.parse(url));
                    },
                    color: Colors.white),
                CommonIcon(
                    icon: FontAwesomeIcons.linkedinIn,
                    onPressed: () async {
                      await launchUrl(
                        Uri.parse("https://www.linkedin.com/in/madhan-k-/"),
                      );
                    },
                    color: Colors.white),
              ] else ...[
                CommonIcon(
                    icon: Icons.more_vert_outlined,
                    onPressed: () {},
                    color: Colors.white)
              ]
            ]);
}
