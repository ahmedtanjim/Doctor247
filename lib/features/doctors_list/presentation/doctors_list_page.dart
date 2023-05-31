import 'package:auto_route/auto_route.dart';
import 'package:doctor_247/common/domain/models/doctor.dart';
import 'package:doctor_247/common/presentation/routes/router.gr.dart';
import 'package:doctor_247/common/utils/Constants.dart';
import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/doctors_list/domain/controllers/doctors_list_controller.dart';
import 'package:doctor_247/features/doctors_list/presentation/widgets/doctors_list_page_search_bar.dart';
import 'package:doctor_247/features/doctors_list/presentation/widgets/doctors_list_chip_row.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/doctors_widget.dart';

@RoutePage()
class DoctorsListPage extends StatefulHookConsumerWidget {
  final String doctorsField;
  final String doctorsFieldHeader;
  final int index;
  final TextEditingController search = TextEditingController();

  DoctorsListPage(this.index,
      {Key? key,
      @PathParam('doctorsField') required this.doctorsField,
      @PathParam('doctorsFieldHeader') required this.doctorsFieldHeader})
      : super(key: key);

  @override
  ConsumerState<DoctorsListPage> createState() => _DoctorsListPageState();
}

class _DoctorsListPageState extends ConsumerState<DoctorsListPage> {
  final _globalKey = GlobalKey<FormState>();

  int selectedChipOption = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print(widget.doctorsField);
      selectedChipOption = widget.index;
      getData();
    });
  }

  void getData() async {
    final viewModel = ref.watch(doctorsListControllerProvider.notifier);
    await viewModel.setDoctorsField(
        widget.doctorsField, widget.doctorsFieldHeader);
    await viewModel.getDoctors(category: widget.doctorsField);
  }

  @override
  void dispose() {
    super.dispose();
    _globalKey.currentState!.dispose();
    widget.search.dispose();
    final viewModel = ref.watch(doctorsListControllerProvider.notifier);
    viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(doctorsListControllerProvider);
    final viewModel = ref.watch(doctorsListControllerProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.95),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            AutoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(state.doctorsFieldHeader),
      ),
      body: Container(
        child: state.viewState.status != ViewStatus.success
                ?  Center(
                    child:state.viewState.status != ViewStatus.loading
                        ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.sentiment_dissatisfied,
                          size: 150,
                          color: Colors.black45,
                        ),
                        Text(
                          "There isn't any doctor for your selected category",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black45,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 180,)
                      ],
                    ) : const CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      DoctorsListPageSearchBar(widget: widget),
                      DoctorsListChipRow(
                        selectedOption: selectedChipOption,
                        onSelectNewChip: (int option) async {
                          setState(() {
                            selectedChipOption = option;
                          });
                          await viewModel.setDoctorsField(
                              Constants.doctorCategories[option].initial,
                              Constants.doctorCategories[option].name);
                          await viewModel.getDoctors(
                              category:
                                  Constants.doctorCategories[option].initial);
                        },
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.doctors.length,
                          itemBuilder: (context, index) {
                            Doctor doctor = state.doctors[index];
                            print(doctor);
                            return DoctorsWidget(
                              doctor: doctor,
                              onButtonPressed: (id) {
                                AutoRouter.of(context)
                                    .navigate(DoctorsRoute(doctorID: id));
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
