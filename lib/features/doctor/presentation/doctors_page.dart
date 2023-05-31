import 'package:auto_route/auto_route.dart';
import 'package:doctor_247/common/utils/Constants.dart';
import 'package:doctor_247/features/doctor/domain/controllers/doctors_controller.dart';
import 'package:doctor_247/features/doctor/domain/models/chamber.dart';
import 'package:doctor_247/features/doctor/presentation/widget/doctors_chamber_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class DoctorsPage extends StatefulHookConsumerWidget {
  final String doctorID;

  const DoctorsPage({Key? key, @PathParam('doctorID') required this.doctorID})
      : super(key: key);

  @override
  DoctorsPageState createState() => DoctorsPageState();
}

class DoctorsPageState extends ConsumerState<DoctorsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });
  }

  void getData() async {
    final viewModel = ref.watch(doctorsControllerProvider.notifier);
    await viewModel.getDoctor(id: widget.doctorID);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(doctorsControllerProvider);
    print(state.doctor.picture);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.95),
      appBar: AppBar(
        title: const Text('ডাক্তার'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Image.network(
                        state.doctor.picture ??
                            Constants.doctorPlaceHolder,
                        height: 130,
                        width: 130,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                )),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 9, top: 9),
              child: Text(
                state.doctor.name ?? '',
                style: Theme.of(context).textTheme.titleLarge,
              )),
          SizedBox(
            width: 250,
            child: Padding(
              padding: const EdgeInsets.only(left: 9, top: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.doctor.degree ?? '',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    state.doctor.shortDescOne ?? '',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    state.doctor.shortDescTwo ?? '',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: state.chambers.length,
              itemBuilder: (context, index) {
                Chamber doctor = state.chambers[index];
                print(doctor);
                return DoctorsChamberWidget(
                  chamber: doctor,
                  onButtonPressed: (String phone) {

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
