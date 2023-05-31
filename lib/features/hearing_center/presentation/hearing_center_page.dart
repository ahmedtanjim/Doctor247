import 'package:auto_route/auto_route.dart';
import 'package:doctor_247/common/presentation/widget/listItem.dart';
import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/hearing_center/domain/controllers/hearing_center_controller.dart';
import 'package:doctor_247/features/hearing_center/domain/models/hearing_center.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class HearingCenterPage extends StatefulHookConsumerWidget {
  const HearingCenterPage({Key? key}) : super(key: key);

  @override
  HearingCenterPageState createState() => HearingCenterPageState();
}

class HearingCenterPageState extends ConsumerState<HearingCenterPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });
  }

  void getData() async {
    final viewModel = ref.watch(hearingCentersControllerProvider.notifier);
    await viewModel.getHearingCenter();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(hearingCentersControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.95),
      appBar: AppBar(
        title: const Text('হিয়ারিং সেন্টার'),
      ),
      body: state.viewState.status != ViewStatus.success ? const Center(child: CircularProgressIndicator(),) :Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: state.hearingCenters.length,
              itemBuilder: (context, index) {
                HearingCenter hearingCenter = state.hearingCenters[index];
                print(hearingCenter);
                return ListItem(
                  name: hearingCenter.name,
                  phone: hearingCenter.phone,
                  picture: hearingCenter.picture,
                  location: hearingCenter.location,
                  onButtonPressed: (phone) {
                    launchUrl(Uri.parse("tel:+88$phone"));
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
