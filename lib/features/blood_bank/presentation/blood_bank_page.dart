import 'package:auto_route/auto_route.dart';
import 'package:doctor_247/common/presentation/widget/listItem.dart';
import 'package:doctor_247/common/utils/view_state.dart';
import 'package:doctor_247/features/blood_bank/domain/controller/blood_bank_controller.dart';
import 'package:doctor_247/features/blood_bank/domain/models/blood_bank.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class BloodBankPage extends StatefulHookConsumerWidget {
  const BloodBankPage({Key? key}) : super(key: key);

  @override
  BloodBankPageState createState() => BloodBankPageState();
}

class BloodBankPageState extends ConsumerState<BloodBankPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });
  }

  void getData() async {
    final viewModel = ref.watch(bloodBankControllerProvider.notifier);
    await viewModel.getBloodBanks();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bloodBankControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.95),
      appBar: AppBar(
        title: const Text('ব্লাড ব্যাংক'),
      ),
      body: state.viewState.status != ViewStatus.success
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.bloodBanks.length,
                    itemBuilder: (context, index) {
                      BloodBank bloodBank = state.bloodBanks[index];
                      print(bloodBank);
                      return ListItem(
                        name: bloodBank.name,
                        picture: bloodBank.picture,
                        location: bloodBank.location,
                        phone: bloodBank.phone,
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
