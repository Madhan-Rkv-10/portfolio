// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../controller/data_controller.dart';
import '../../../model/data_model.dart';
import '../../../router/app_router.dart';
import '../../../ui_utils/async_data.dart';
import '../../contacts.dart';
import '../../projects.dart';

final hoverhook = StateProvider<List<bool>?>((ref) => null);

class ProjectWeb extends HookConsumerWidget {
  const ProjectWeb({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    return AsyncValueWidget(
      value: ref.watch(resumeDataProvider),
      data: (data) {
        return ListView.builder(
          controller: scrollController,
          itemCount: data.data?.projects?.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final project = data.data?.projects?.elementAt(index);
            return ProjectWebCard(
              project: project!,
            );
          },
        );
      },
    );
  }
}

class ProjectWebCard extends StatefulHookConsumerWidget {
  const ProjectWebCard({required this.project, super.key});
  final Project project;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProjectWebCardState();
}

class _ProjectWebCardState extends ConsumerState<ProjectWebCard> {
  // bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final hover = useState(false);
    return Stack(
      children: [
        MouseRegion(
            onEnter: (event) {
              hover.value = true;
            },
            onExit: (event) {
              hover.value = false;
            },
            child: Container(
              width: 400,
              height: 600,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: hover.value ? Colors.red : null,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    offset: const Offset(0, 1),
                    color: primaryColor,
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  isAntiAlias: true,
                  image: AssetImage(
                    widget.project.images!.first.toString(),
                  ),
                ),
              ),
              child: hover.value
                  ? Container(
                      width: 400,
                      height: 600,
                      // margin: const EdgeInsets.symmetric(
                      //     horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: SizedBox(
                          height: 200,
                          child: Column(
                            children: [
                              Text(
                                widget.project.title.toString(),
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 40),
                              // Icon(Icons.arrow_outward_outlined),
                              SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  // icon: Icon(Icons.arrow_outward_outlined),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.black,
                                      surfaceTintColor: Colors.white),
                                  onPressed: () {
                                    context.goNamed(
                                        AppRoute.projectDetails.name,
                                        pathParameters: {
                                          "id": widget.project.id.toString(),
                                        },
                                        queryParameters: {
                                          "title":
                                              widget.project.title.toString()
                                        });
                                  },
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "More Info",
                                      ),
                                      Icon(
                                        Icons.arrow_outward_outlined,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            )),
      ],
    );
  }
}

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
