import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:madhan_portfolio/screens/contacts.dart';
import 'package:madhan_portfolio/utils/src/helpers/ui_dimens.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../project_details.dart';
import 'carousel_slider.dart';

class SimpleDialogWidget extends HookConsumerWidget {
  const SimpleDialogWidget(
      {required this.images,
      required this.technologies,
      required this.sourceCode,
      required this.description,
      required this.title,
      required this.features,
      super.key});
  final List<String> images;
  final List<String> technologies;
  final String sourceCode;
  final String title;
  final List<String> description;
  final List<String> features;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrollable: true,
        content: SingleChildScrollView(
          child: Container(
              width: context.screenWidth * 0.5,
              color: Colors.white,

              // height: context.screenHeight * 0.9,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Align(alignment: Alignment.topRight, child: FaIcon(FontAwesomeIcons.stickerMule),),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          title,
                          style: GoogleFonts.openSans(
                            fontSize: 30,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: Navigator.of(context).pop,
                            icon: FaIcon(FontAwesomeIcons.xmark)),
                      ),
                    ],
                  ),
                  Text(
                    "Project Overview",
                    style: GoogleFonts.openSans(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: description
                        .map((e) => DescriptionsTile(description: e))
                        .toList(),
                  ),
                  CarouselSliderWidget(images: images),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: 130,
                    ),
                    child: Wrap(
                      children: [...technologies, ...features]
                          .map(
                            (e) => OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                e.toString(),
                              ),
                            ).paddingSymmetric(horizontal: 15, vertical: 8),
                          )
                          .toList(),
                    ),
                  ),
                  if (sourceCode != 'none')
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.all(15),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () async {
                              // Future<void> _launchUniversalLinkIos(Uri url) async {
                              await launchUrl(
                                Uri.parse(sourceCode),
                              );
                              // if (!nativeAppLaunchSucceeded) {
                              //   await launchUrl(
                              //     Uri.parse(sourceCode),
                              //   );
                              // }
                              // }
                            },
                            child: Text("Source Code")),
                      ),
                    )
                ],
              )),
        ));
  }
}
/**
 *  Container(
                      width: 300,
                      child: Column(
                        children: [
                          Text(
                            "Technologies",
                            style: GoogleFonts.openSans(
                              color: Colors.purple,
                              fontSize: 25,
                            ),
                          ),
                          Column(
                            children: technologies
                                .map((e) => Container(
                                      width: 180,
                                      height: 50,
                                      margin: EdgeInsets.only(bottom: 15),
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              shape: StadiumBorder()),
                                          child: Text(e)),
                                    ))
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    
 */