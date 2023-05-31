import 'package:auto_route/annotations.dart';
import 'package:doctor_247/common/presentation/widget/listItem.dart';
import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/ambulance/domain/controller/ambulance_controller.dart';
import 'package:doctor_247/features/ambulance/domain/models/ambulance.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class AmbulancePage extends StatefulHookConsumerWidget {
  const AmbulancePage({Key? key}) : super(key: key);

  @override
  AmbulancePageState createState() => AmbulancePageState();
}

class AmbulancePageState extends ConsumerState<AmbulancePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });
  }

  void getData() async {
    final viewModel = ref.watch(ambulancesControllerProvider.notifier);
    await viewModel.getAmbulances();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(ambulancesControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.95),
      appBar: AppBar(
        title: const Text('এম্বুলেন্স'),
      ),
      body: state.viewState.status != ViewStatus.success ? const Center(child: CircularProgressIndicator(),) :Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: state.ambulances.length,
              itemBuilder: (context, index) {
                Ambulance ambulance = state.ambulances[index];
                print(ambulance);
                return ListItem(
                  name: ambulance.name,
                  phone: ambulance.phone,
                  picture: ambulance.picture,
                  location: ambulance.location,
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
