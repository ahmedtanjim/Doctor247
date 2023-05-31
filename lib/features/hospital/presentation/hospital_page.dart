import 'package:auto_route/auto_route.dart';
import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/hearing_center/domain/controllers/hearing_center_controller.dart';
import 'package:doctor_247/features/hearing_center/domain/models/hearing_center.dart';
import 'package:doctor_247/features/hospital/domain/controllers/hospitals_controller.dart';
import 'package:doctor_247/features/hospital/domain/models/hospital.dart';
import 'package:doctor_247/features/hospital/presentation/widgets/hospital_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class HospitalsPage extends StatefulHookConsumerWidget {
  const HospitalsPage({Key? key}) : super(key: key);

  @override
  HospitalsPageState createState() => HospitalsPageState();
}

class HospitalsPageState extends ConsumerState<HospitalsPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });
  }

  void getData() async {
    final viewModel = ref.watch(hospitalsControllerProvider.notifier);
    await viewModel.getHospitals();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(hospitalsControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.95),
      appBar: AppBar(
        title: const Text('হাসপাতাল ও ক্লিনিক'),
      ),
      body: state.viewState.status != ViewStatus.success ? const Center(child: CircularProgressIndicator(),) :Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.hospitals.length,
                itemBuilder: (context, index) {
                  Hospital hospital = state.hospitals[index];
                  print(hospital);
                  return HospitalWidget(
                    hospital: hospital,
                    onButtonPressed: (phone) {
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
