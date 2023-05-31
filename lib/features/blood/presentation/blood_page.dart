import 'package:auto_route/auto_route.dart';
import 'package:doctor_247/common/presentation/routes/router.gr.dart';
import 'package:doctor_247/common/utils/Constants.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BloodPage extends StatelessWidget {
  const BloodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ব্লাড ব্যাংক ও সংস্থা'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Card(
                  child: InkWell(
                    splashFactory: InkRipple.splashFactory,
                    onTap: () {
                      Future.delayed(const Duration(milliseconds: 200))
                          .whenComplete(() {
                        AutoRouter.of(context).navigate(const BloodBankRoute());
                      });
                    },
                    child: SizedBox(
                      height: 115,
                      width: 115,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset(
                                width: 60, 'assets/pictures/blood_bank.png'),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              'ব্লাড ব্যাংক',
                              // style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  child: InkWell(
                    splashFactory: InkRipple.splashFactory,
                    onTap: () {
                      Future.delayed(const Duration(milliseconds: 200))
                          .whenComplete(() {});
                    },
                    child: SizedBox(
                      height: 115,
                      width: 115,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset(
                                width: 60, 'assets/pictures/blood_bank.png'),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              'রক্তদানকারী সংস্থা',
                              // style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
