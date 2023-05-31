import 'package:auto_route/annotations.dart';
import 'package:doctor_247/common/presentation/widget/listItem.dart';
import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/ambulance/domain/controller/ambulance_controller.dart';
import 'package:doctor_247/features/ambulance/domain/models/ambulance.dart';
import 'package:doctor_247/features/diagnostic/domain/controller/diagnostic_controller.dart';
import 'package:doctor_247/features/diagnostic/domain/models/diagnostic.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class DiagnosticsPage extends StatefulHookConsumerWidget {
  const DiagnosticsPage({Key? key}) : super(key: key);

  @override
  DiagnosticsPageState createState() => DiagnosticsPageState();
}

class DiagnosticsPageState extends ConsumerState<DiagnosticsPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });
  }

  void getData() async {
    final viewModel = ref.watch(diagnosticControllerProvider.notifier);
    await viewModel.getDiagnostics();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(diagnosticControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.95),
      appBar: AppBar(
        title: const Text('ডায়াগনস্টিক সেন্টার'),
      ),
      body: state.viewState.status != ViewStatus.success ? const Center(child: CircularProgressIndicator(),) :Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: state.diagnostics.length,
              itemBuilder: (context, index) {
                Diagnostic diagnostics = state.diagnostics[index];
                print(diagnostics);
                return ListItem(
                  name: diagnostics.name,
                  phone: diagnostics.phone,
                  picture: diagnostics.picture,
                  location: diagnostics.location,
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
