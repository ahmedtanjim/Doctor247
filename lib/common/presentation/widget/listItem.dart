import 'package:doctor_247/common/utils/Constants.dart';
import 'package:doctor_247/common/utils/app_colors.dart';
import 'package:doctor_247/features/blood_bank/domain/models/blood_bank.dart';
import 'package:doctor_247/features/hearing_center/domain/models/hearing_center.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem(
      {Key? key,
      required this.onButtonPressed,
      required this.name,
      required this.picture,
      required this.location,
      required this.phone})
      : super(key: key);

  final Function(String phone) onButtonPressed;
  final String? name;
  final String? picture;
  final String? location;
  final String? phone;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (picture != null)
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Image.network(
                      picture!.isEmpty ? Constants.doctorPlaceHolder : picture ?? Constants.doctorPlaceHolder,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            Column(
              children: [
                Text(
                  name ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  location ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
            IconButton(
                onPressed: () {
                  onButtonPressed(phone ?? '');
                },
                iconSize: 40,
                icon: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
