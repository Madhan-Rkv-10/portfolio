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
    final onTapped = useState(false);

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
                    final List<bool> onHover = List.generate(
                        data.data?.projects?.length ?? 0, (index) => false);
                    final project = data.data?.projects?.elementAt(index);
                    return MouseRegion(
                        onEnter: (value) {
                          print(onHover[index]);
                          onHover[index] = !onHover[index];
                        },
                        onExit: (value) {
                          print(onHover[index]);

                          onHover[index] = false;
                        },
                        child: ProjectCard(project: project!));
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
    return InkWell(
      onTap: () {
        visible.value = !visible.value;
      },
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              visible.value = !visible.value;
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              // height: visible.value ? context.screenHeight * 0.4 : 320,
              // width: context.screenWidth * 0.9,

              // alignment: Alignment.bottomCenter,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  // color: Colors.pink,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                      color: primaryColor,
                      // spreadRadius: 1,
                    ),
                  ]),
              margin: const EdgeInsets.all(18),
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: Duration(
                      milliseconds: 400,
                    ),
                    height: visible.value ? 50 : 0,
                    width: context.screenWidth * 0.8,
                    // width: visible.value,
                    decoration: BoxDecoration(
                        // color: primaryColor.withOpacity(0.5),
                        boxShadow: [
                          // BoxShadow(
                          //   blurRadius: 8,
                          //   offset: const Offset(0, 2),
                          //   color: primaryColor.withOpacity(0.3),
                          //   // spreadRadius: 1,
                          // ),
                        ]),
                    child: AnimatedOpacity(
                      opacity: visible.value ? 1 : 0,
                      duration: Duration(microseconds: 400),
                      child: Container(
                        color: Colors.grey.shade300,
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
                                  FontAwesomeIcons.circleInfo,
                                  color: primaryColor,
                                )),
                            // IconButton(
                            //   onPressed: () {},
                            //   icon: FaIcon(
                            //     FontAwesomeIcons.github,
                            //     color: primaryColor,
                            //   ),
                            // ),

                            // ElevatedButton.icon(
                            //     icon: FaIcon(Icons.info_outline),
                            //     onPressed: () {},
                            //     label: const Text("More Info"))
                          ],
                        ),
                      ),
                    ),
                  ).animate().scale(
                      curve: Curves.easeIn,
                      begin: Offset(0, 1),
                      duration: Duration(milliseconds: 500)),
                  Container(
                    height: context.screenHeight * 0.55,
                    child: ClipRRect(
                        borderRadius: visible.value
                            ? BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8))
                            : BorderRadius.circular(8),
                        child: Image.asset(
                            width: context.screenWidth * 0.8,
                            fit: BoxFit.fill,
                            "assets/project_assets/todo_filter.png")),
                  ),
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

// row double image
/**
 * Expanded(
                    child: Container(
                      color: Colors.grey.shade300,
                      child:
                      
                       Row(
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
 */