// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:madhan_portfolio/screens/contacts.dart';
import 'package:madhan_portfolio/ui_utils/common_icon.dart';
import 'package:madhan_portfolio/utils/src/helpers/ui_dimens.dart';

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
              style: TextStyle(color: Colors.white),
            ),
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.only(
            //   bottomLeft: Radius.circular(16),
            //   bottomRight: Radius.circular(16),
            // )),
            elevation: 10,
            actions: [
              if (!actionExpand) ...[
                CommonIcon(
                  icon: FontAwesomeIcons.instagram,
                  onPressed: () {},
                  color: Colors.white,
                ),
                CommonIcon(
                    icon: FontAwesomeIcons.github,
                    onPressed: () {},
                    color: Colors.white),
                CommonIcon(
                    icon: FontAwesomeIcons.linkedinIn,
                    onPressed: () {},
                    color: Colors.white),
              ] else ...[
                CommonIcon(
                    icon: Icons.more_vert_outlined,
                    onPressed: () {},
                    color: Colors.white)
              ]
            ]);
}
