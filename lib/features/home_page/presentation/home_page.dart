import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_247/common/presentation/routes/router.gr.dart';
import 'package:doctor_247/common/utils/Constants.dart';
import 'package:doctor_247/common/utils/app_colors.dart';
import 'package:doctor_247/features/blood/presentation/blood_page.dart';
import 'package:doctor_247/features/home_page/domain/controller/home_page_controller.dart';
import 'package:doctor_247/features/home_page/domain/model/main_category.dart';
import 'package:doctor_247/features/home_page/presentation/widgets/main_category_widget.dart';
import 'package:doctor_247/features/home_page/presentation/widgets/scrolling_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marquee/marquee.dart';

@RoutePage()
class HomePage extends StatefulHookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int currentPos = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });
  }

  void getData() async {
    final viewModel = ref.watch(homePageControllerProvider.notifier);
    await viewModel.getConfig();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homePageControllerProvider);
    List<String> listPaths = state.config.bannerImages ?? [];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DocFinder',
        ),
        actions: [
          IconButton(
              onPressed: () {
                AutoRouter.of(context).navigate(const AddServiceRoute());
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(children: [
        listPaths.isEmpty
            ? Container(
                height: 230,
              )
            : Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: listPaths.length,
                    options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentPos = index;
                          });
                        }),
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 0),
                          child: Image.network(
                            listPaths[index],
                            fit: BoxFit.fill,
                          ));
                    },
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: listPaths.map((url) {
                        int index = listPaths.indexOf(url);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentPos == index
                                ? const Color.fromRGBO(0, 0, 0, 0.9)
                                : const Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
        Row(
          children: [
            Container(
              color: const Color(0XFFb61f59),
              width: 70,
              height: 30,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                child: Text(
                  'নোটিশঃ',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              color: AppColors.primary,
              height: 30,
              width: MediaQuery.of(context).size.width - 70,
              child: Marquee(
                text: ' ${state.config.notice ?? ''}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: Constants.mainCategories.length,
            itemBuilder: (context, index) => MainCategoryWidget(
              index: index,
              onClick: (initial) {
                switch (initial) {
                  case 'doctor':
                    AutoRouter.of(context)
                        .navigate(const DoctorCategoryRoute());
                    break;
                  case 'hearing':
                    AutoRouter.of(context).navigate(const HearingCenterRoute());
                    break;
                  case 'clinic':
                    AutoRouter.of(context).navigate(const HospitalsRoute());
                    break;
                  case 'blood':
                    AutoRouter.of(context).navigate(const BloodRoute());
                    break;
                  case 'physiotherapy':
                    AutoRouter.of(context).navigate(const PhysiotherapyRoute());
                    break;
                  case 'ambulance':
                    AutoRouter.of(context).navigate(const AmbulanceRoute());
                    break;
                  case 'diagnostic':
                    AutoRouter.of(context).navigate(const DiagnosticsRoute());
                    break;
                  default:
                }
              },
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
          ),
        )
      ]),
    );
  }
}
