import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controller/data_controller.dart';
import '../../../ui_utils/async_data.dart';
import '../../contacts.dart';
import '../../widgets/skills_card.dart';

class SkillsSectionWeb extends HookConsumerWidget {
  const SkillsSectionWeb({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints(
              maxWidth: 1400,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Technical Skills",
                    style: GoogleFonts.openSans(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                AsyncValueWidget(
                  value: ref.watch(resumeDataProvider),
                  data: (data) {
                    return Wrap(
                      spacing: 23,
                      runSpacing: 15,
                      children: data.data!.languages!
                          .map((e) => SkillsCard(
                                image: e.imageUrl ?? '',
                                name: e.name ?? '',
                                width: 240,
                              ))
                          .toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
