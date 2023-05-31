import 'package:auto_route/annotations.dart';
import 'package:doctor_247/common/presentation/widget/listItem.dart';
import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/physiotherapy/domain/controller/physiotherapy_controller.dart';
import 'package:doctor_247/features/physiotherapy/domain/models/physiotherapy.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class PhysiotherapyPage extends StatefulHookConsumerWidget {
  const PhysiotherapyPage({Key? key}) : super(key: key);

  @override
  PhysiotherapyPageState createState() => PhysiotherapyPageState();
}

class PhysiotherapyPageState extends ConsumerState<PhysiotherapyPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });
  }

  void getData() async {
    final viewModel = ref.watch(physiotherapyControllerProvider.notifier);
    await viewModel.getPhysiotherapyCenters();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(physiotherapyControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.95),
      appBar: AppBar(
        title: const Text('ফিজিওথেরাপি সেন্টার'),
      ),
      body: state.viewState.status != ViewStatus.success ? const Center(child: CircularProgressIndicator(),) :Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: state.physiotherapyCenters.length,
              itemBuilder: (context, index) {
                Physiotherapy physiotherapy = state.physiotherapyCenters[index];
                print(physiotherapy);
                return ListItem(
                  name: physiotherapy.name,
                  phone: physiotherapy.phone,
                  picture: physiotherapy.picture,
                  location: physiotherapy.location,
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
