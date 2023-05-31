import 'package:doctor_247/common/utils/app_colors.dart';
import 'package:doctor_247/common/utils/adaptibe_size.dart';
import 'package:doctor_247/common/domain/models/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DoctorsWidget extends StatelessWidget {
  const DoctorsWidget({Key? key, required this.doctor, required this.onButtonPressed}) : super(key: key);

  final Doctor doctor;
  final Function(String id) onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        color: AppColors.secondary,
        child: InkWell(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Image.network(
                              doctor.picture.toString() ?? '',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 2,
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              doctor.name ?? '',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              doctor.degree ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(fontSize: 9),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              doctor.shortDescOne ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(fontSize: 9),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              doctor.shortDescTwo ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(fontSize: 9),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'ফি ',
                                  style: TextStyle(
                                    fontSize: const AdaptiveSize()
                                        .getAdaptiveSize(context, 13),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                TextSpan(
                                  text: '${doctor.appointmentFee}  ৳',
                                  style: TextStyle(
                                    fontSize: const AdaptiveSize()
                                        .getAdaptiveSize(context, 13),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: FilledButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))),
                            onPressed:(){
                              onButtonPressed(doctor.id ?? '');
                            },
                            child: const Text(
                              'অ্যাপয়েন্টমেন্ট নিন',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
