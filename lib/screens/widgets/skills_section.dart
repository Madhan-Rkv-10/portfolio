// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:madhan_portfolio/screens/widgets/skills_card.dart';
import 'package:madhan_portfolio/utils/src/helpers/ui_dimens.dart';

import '../../model/data_model.dart';

class SkillsSection extends HookConsumerWidget {
  const SkillsSection({required this.skills, super.key});
  final List<Language> skills;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController =
        usePageController(viewportFraction: 0.5, initialPage: 0);
    final currentPage = useState(pageController.initialPage);
    useEffect(() {
      // final onPageChange = () {
      //   currentPage.value = pageController.page!.toInt();
      // };

      pageController.addListener(() {
        currentPage.value = pageController.page!.toInt();
      });

      return null;
      // () {
      // pageController.removeListener(onPageChange);
      // pageController.dispose();
      // };
    }, [pageController]);
    // useEffect(() {
    //   final itemWidth =
    //       MediaQuery.of(context).size.width * pageController.viewportFraction;
    //   return null;
    // }, [pageController]);
    return Stack(children: [
      // if (pageController != null)
      Positioned.fill(
        child: Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: context.screenWidth * pageController.viewportFraction,
            child: FractionallySizedBox(
              child: SkillsCard(
                  // isFlutter: currentPage.value == 0,
                  name: skills[currentPage.value].name.toString(),
                  width: context.screenWidth * pageController.viewportFraction,
                  image: skills[currentPage.value].imageUrl.toString()),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 250,
        child: PageView.builder(
          padEnds: false,
          controller: pageController,
          itemBuilder: (context, index) {
            return Opacity(
                opacity: index <= currentPage.value ? 0 : 1,
                child: SkillsCard(
                  name: skills[index].name.toString(),
                  // isFlutter: index == 0,
                  image: skills[index].imageUrl.toString(),
                ));
          },
          itemCount: skills.length,
        ),
      )
    ]);

    //     Container(
    //   height: 300,
    //   child: ListView.builder(
    //       scrollDirection: Axis.horizontal,
    //       itemCount: LogoStrings.logos.length,
    //       itemBuilder: (context, index) {
    //         return SkillsCard(
    //           image: LogoStrings.logos[index],
    //           isFlutter: index == 0,
    //         );
    //       }),
    // );
  }

  // double _page = 0;

  // /// The index of the leftmost element of the list to be displayed
  // int get _firstItemIndex => _page.toInt();
}
