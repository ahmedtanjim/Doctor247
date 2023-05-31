import 'package:doctor_247/common/utils/app_colors.dart';
import 'package:doctor_247/features/hearing_center/domain/models/hearing_center.dart';
import 'package:doctor_247/features/hospital/domain/models/hospital.dart';
import 'package:flutter/material.dart';

class HospitalWidget extends StatelessWidget {
  const HospitalWidget(
      {Key? key, required this.hospital, required this.onButtonPressed})
      : super(key: key);

  final Hospital hospital;
  final Function(String phone) onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                'assets/pictures/medical.png',
                width: 50,
              ),
            ),
            Text(
              hospital.name ?? '',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              '${hospital.location}',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              hospital.phone ?? '',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              hospital.discount ?? '',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }
}
