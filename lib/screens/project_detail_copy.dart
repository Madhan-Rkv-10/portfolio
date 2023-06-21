// // ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:madhan_portfolio/controller/data_controller.dart';
// import 'package:madhan_portfolio/screens/contacts.dart';
// import 'package:madhan_portfolio/screens/widgets/languages_section.dart';
// import 'package:madhan_portfolio/ui_utils/async_data.dart';
// import 'package:madhan_portfolio/ui_utils/common_elevated_button.dart';
// import 'package:madhan_portfolio/utils/src/helpers/ui_dimens.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// // List<String> sam = ["a", "b"];
// // List<String> descriptions = [
// //   'SAMmmsa fsdnfsdnfsifs sfnsdif fsdnfsdnfsifsfsdnfsdnfsifsfsdnfsdnfsifsfsdnfsdnfsifsfsdnfsdnfsifsfsdnfsdnfsifsfsdnfsdnfsifsfsdnfsdnfsifsfsdnfsdnfsifsfsdnfsdnfsifs',
// //   "THis Project Containsbufsufbsdf"
// // ];

// class ProjectDetails extends HookConsumerWidget {
//   final String id;
//   final String title;
//   const ProjectDetails({required this.id, super.key, required this.title});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final projectData = ref.watch(resumeDataProvider);

//     final selectedIndexState = useState(0);
//     final pageViewController = usePageController(initialPage: 1);
//     final scrollController = useScrollController();
//     final isExpanded = useState(false);
//     // final details= projectData.whenData
//     useEffect(() {
//       if (isExpanded.value) {
//         // log(isExpanded.value.toString());
//         // log(scrollController.position.maxScrollExtent.toString());
//         scrollController.animateTo(
//           scrollController.position.maxScrollExtent,
//           // context.size?.height,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//         );
//       }
//       return null;
//     }, [
//       scrollController,
//     ]);
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: primaryColor,
//           leading: IconButton(
//               onPressed: () => context.pop(),
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: Colors.white,
//               )),
//           title: Text(title, style: GoogleFonts.openSans(color: Colors.white)),
//         ),
//         body: AsyncValueWidget(
//             value: ref.watch(resumeDataProvider),
//             data: (data) {
//               final indexes = data.data?.projects?.indexWhere(
//                 (element) => element.id == id,
//               );
//               final projectdata = data.data?.projects?.elementAt(indexes!);
//               return SingleChildScrollView(
//                 controller: scrollController,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         AspectRatio(
//                           aspectRatio: 1,
//                           child: PageView.builder(
//                               controller: pageViewController,
//                               itemCount: projectdata!.images!.length,
//                               findChildIndexCallback: (Key key) {
//                                 for (int index = 0;
//                                     index < projectdata!.images!.length;
//                                     index++) {
//                                   print("1");
//                                   if (projectdata.images![index] ==
//                                       key.toString()) {
//                                     print("object");
//                                     return index;
//                                   }
//                                 }
//                                 print("2");

//                                 return -1;
//                               },
//                               onPageChanged: (index) {
//                                 selectedIndexState.value = index;
//                                 print(index);
//                               },
//                               itemBuilder: (context, index) {
//                                 return Center(
//                                   child: Container(
//                                       key: Key(projectdata.images![index]),
//                                       padding: EdgeInsets.all(8),
//                                       child: Image.asset(
//                                           "assets/project_assets/todo_filter.png")
//                                       //  Image.network(
//                                       //   "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-12-r1.jpg",
//                                       // ),

//                                       ),
//                                 );
//                               }),
//                         ),
//                         SmoothPageIndicator(
//                           controller: pageViewController,
//                           // activeIndex: _selectedIndex,
//                           onDotClicked: (index) {
//                             selectedIndexState.value = index;
//                             pageViewController.animateToPage(
//                               selectedIndexState.value,
//                               duration: const Duration(milliseconds: 500),
//                               curve: Curves.ease,
//                             );
//                           },
//                           count: projectdata.images!.length,
//                           effect: ColorTransitionEffect(
//                               activeDotColor: primaryColor,
//                               dotWidth: UIDimens.size13,
//                               dotHeight: UIDimens.size13),
//                         ),
//                         Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Text(
//                                 "Project Details",
//                                 style: GoogleFonts.openSans(
//                                     fontSize: 20,
//                                     color: Color.fromARGB(255, 18, 79, 124),
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             Column(
//                               children: projectdata!.description!
//                                   .map((e) => DescriptionsTile(description: e))
//                                   .toList(),
//                             ),
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Text(
//                                 "Languages ",
//                                 style: GoogleFonts.openSans(
//                                     fontSize: 20,
//                                     color: Color.fromARGB(255, 18, 79, 124),
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             // Text(
//                             //   "  datadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata",
//                             //   style: GoogleFonts.openSans(fontSize: 14, letterSpacing: 1),
//                             // ),
//                             LanguagesSection(names: projectdata.languages!),
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Text(
//                                 "Features",
//                                 style: GoogleFonts.openSans(
//                                     fontSize: 20,
//                                     color: Color.fromARGB(255, 18, 79, 124),
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             LanguagesSection(names: projectdata.features!),
//                           ],
//                         ).paddingAll(8)
//                       ],
//                     ),
//                     Container(
//                       width: context.screenWidth * 0.9,
//                       child: CommonElevatedButton(
//                           onPressed: () {},
//                           iconButton: true,
//                           roundedBorder: false,
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: Color.fromARGB(255, 18, 79, 124),
//                               foregroundColor: Colors.white,
//                               textStyle: GoogleFonts.openSans(fontSize: 18)),
//                           icon: const FaIcon(FontAwesomeIcons.github),
//                           text: "View in Github"),
//                     )
//                   ],
//                 ),
//               );
//             }));
//   }
// }

// class DescriptionsTile extends StatelessWidget {
//   const DescriptionsTile({
//     Key? key,
//     required this.description,
//   }) : super(key: key);
//   final String description;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Icon(
//           Icons.star_border_outlined,
//           color: primaryColor,
//         ), //bullet text
//         SizedBox(
//           width: 10,
//         ), //space between bullet and text
//         Expanded(
//           child: Text(
//             description,
//             style: GoogleFonts.openSans(fontSize: 16),
//           ), //text
//         )
//       ],
//     ).paddingOnly(bottom: 7);
//   }
// }
