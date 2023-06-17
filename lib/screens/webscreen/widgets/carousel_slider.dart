import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:madhan_portfolio/utils/src/helpers/ui_dimens.dart';
import 'package:url_launcher/url_launcher.dart';

final _carousalController = CarouselController();

class CarouselSliderWidget extends HookConsumerWidget {
  const CarouselSliderWidget({required this.images, super.key});
  final List<String> images;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexValue = ref.watch(indexProvider);

    return Container(
      child: CarouselSlider(
        carouselController: _carousalController,
        items: images.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Stack(
                children: [
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                          fit: BoxFit.cover,
                          // width: context.screenWidth * 0.8,
                          (i)),
                    ),
                  ).paddingSymmetric(vertical: 5),
                ],
              );
            },
          );
        }).toList(),
        options: CarouselOptions(
            autoPlay: true,
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            viewportFraction: 0.5, //866
            pauseAutoPlayOnManualNavigate: true,
            height: 500,
            enlargeCenterPage: true,
            // autoPlayInterval: const Duration(seconds: 2),
            enableInfiniteScroll: true,
            autoPlayCurve: Curves.easeIn,
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            initialPage: indexValue,
            onPageChanged: (index, reason) async {
              ref.read(indexProvider.notifier).state = index;
            }),
      ).paddingSymmetric(
        vertical: 5,
      ),
    );
  }
}

final indexProvider = StateProvider<int>((ref) => 0);
