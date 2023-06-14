// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:madhan_portfolio/router/app_router.dart';
import 'package:madhan_portfolio/screens/contacts.dart';
import 'package:madhan_portfolio/ui_utils/async_data.dart';
import 'package:madhan_portfolio/ui_utils/common_elevated_button.dart';
import 'package:madhan_portfolio/utils/src/helpers/ui_dimens.dart';

import '../controller/data_controller.dart';
import '../model/data_model.dart';
import '../ui_utils/common_appbar.dart';

Color secondaryColor = const Color(0xFF42A5F5);

class ScreenB extends HookConsumerWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    return Scaffold(
        // backgroundColor: Colors.black12,
        appBar: CommonAppBar(
          title: 'Projects',
        ),
        body: AsyncValueWidget(
            value: ref.watch(resumeDataProvider),
            data: (data) {
              return ListView.builder(
                  controller: scrollController,
                  itemCount: data.data?.projects?.length,
                  itemBuilder: (context, index) {
                    final project = data.data?.projects?.elementAt(index);
                    return ProjectCard(project: project!);
                  });
            }));
  }
}

class ProjectCard extends HookConsumerWidget {
  final Project project;
  const ProjectCard({required this.project, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = useState(false);
    return GestureDetector(
      onTap: () {
        visible.value = !visible.value;
      },
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              visible.value = !visible.value;
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              height: visible.value ? 450 : 320,
              width: context.screenWidth,

              // alignment: Alignment.bottomCenter,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  // color: Colors.pink,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    // BoxShadow(
                    //   blurRadius: 8,
                    //   offset: const Offset(0, 1),
                    //   color: Colors.grey,
                    //   spreadRadius: 1,
                    // ),
                  ]),
              margin: const EdgeInsets.all(18),
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: Duration(
                      milliseconds: 400,
                    ),
                    height: visible.value ? 50 : 0,
                    // width: visible.value,
                    decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.5),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                            color: primaryColor.withOpacity(0.3),
                            // spreadRadius: 1,
                          ),
                        ]),
                    child: AnimatedOpacity(
                      opacity: visible.value ? 1 : 0,
                      duration: Duration(microseconds: 400),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(project.title.toString(),
                                style: GoogleFonts.openSans(
                                    fontSize: 20,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w700)),
                          ),
                          IconButton(
                              onPressed: () {
                                context.goNamed(AppRoute.projectDetails.name,
                                    pathParameters: {
                                      "id": project.id.toString(),
                                    },
                                    queryParameters: {
                                      "title": project.title.toString()
                                    });
                              },
                              icon: FaIcon(
                                Icons.info_outline,
                                color: primaryColor,
                              )),
                          IconButton(
                            onPressed: () {},
                            icon: FaIcon(
                              FontAwesomeIcons.github,
                              color: primaryColor,
                            ),
                          ),

                          // ElevatedButton.icon(
                          //     icon: FaIcon(Icons.info_outline),
                          //     onPressed: () {},
                          //     label: const Text("More Info"))
                        ],
                      ),
                    ),
                  ).animate().scale(
                      curve: Curves.easeIn,
                      begin: Offset(0, 1),
                      duration: Duration(milliseconds: 500)),

                  Expanded(
                    child: Container(
                      color: Colors.grey.shade300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            // borderRadius: const BorderRadius.only(
                            //     bottomLeft: Radius.circular(10),
                            //     bottomRight: Radius.circular(10)),
                            child: Container(
                              width: 130,
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                    // height: 300,
                                    width: 150,
                                    isAntiAlias: true,
                                    fit: BoxFit.fill,
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSfS04L7MmiGxm94FKQ8BFYcLvjOa1SNZOj_k5a9jW9dmnhLKyyqJVRXevIhWWpojUJ3s&usqp=CAU"),
                              ),
                            ),
                          ),
                          ClipRRect(
                            // borderRadius: const BorderRadius.only(
                            //     bottomLeft: Radius.circular(10),
                            //     bottomRight: Radius.circular(10)),
                            child: Container(
                              width: 130,
                              margin: EdgeInsets.all(8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                    // height: 300,
                                    width: 150,
                                    // isAntiAlias: true,
                                    fit: BoxFit.fill,
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSfS04L7MmiGxm94FKQ8BFYcLvjOa1SNZOj_k5a9jW9dmnhLKyyqJVRXevIhWWpojUJ3s&usqp=CAU"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // AnimatedContainer(
                  //   // height: 80,
                  //   duration: Duration(
                  //     milliseconds: 400,
                  //   ),
                  //   height: visible.value ? 50 : 0,
                  //   color: primaryColor.withOpacity(0.7),
                  //   child:
                  //       // SwipeButton(
                  //       //   elevationThumb: 10,

                  //       //       //   onSwipeEnd: () {
                  //       //       //     print("object");
                  //       //       //   },
                  //       //       //   child: Text('data'),
                  //       //       // )

                  //       Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: [
                  //       CommonElevatedButton(
                  //           onPressed: () {},
                  //           iconButton: true,
                  //           style: ElevatedButton.styleFrom(
                  //               foregroundColor: primaryColor),
                  //           // roundedBorder: false,
                  //           icon: const Icon(Icons.info_outline),
                  //           text: "More Info"),
                  //       CommonElevatedButton(
                  //           style: ElevatedButton.styleFrom(
                  //               foregroundColor: primaryColor),
                  //           onPressed: () {
                  //             print(project.sourceCode);
                  //           },
                  //           iconButton: true,
                  //           icon: const FaIcon(FontAwesomeIcons.github),
                  //           text: "Code"),
                  //     ],
                  //   ),
                  // ).animate().scale(
                  //     curve: Curves.easeIn,
                  //     begin: Offset(0, 1),
                  //     duration: Duration(milliseconds: 500)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




//
/**
 *   GestureDetector(
      onTap: () {
        visble.value = !visble.value;
      },
      child: Container(
        child: Column(
          children: [
            AnimatedOpacity(
                opacity: visble.value ? 1 : 0,
                duration: Duration(
                  milliseconds: 400,
                ),
                child: Container(
                  height: 50,
                  child: Text("Top Section"),
                )),
            AnimatedContainer(
              duration: Duration(milliseconds: 400),
              height: visble.value ? 400 : 300,
              color: Colors.red,
            ),
            AnimatedOpacity(
                opacity: visble.value ? 1 : 0,
                duration: Duration(
                  milliseconds: 400,
                ),
                child: Container(
                  height: 50,
                  child: Text("Top Section"),
                )),
          ],
        ),
      ),
    );
  
  
  
 */
//
/**
 *  
 *  
 */