import 'package:doctor_247/common/utils/Constants.dart';
import 'package:doctor_247/features/doctor_category/domain/models/doctor_category.dart';
import 'package:flutter/material.dart';

class DoctorCategoryWidget extends StatelessWidget {
  final int index;
  final Function(DoctorCategory) onClick;

  const DoctorCategoryWidget(
      {Key? key, required this.index, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Card(
        child: InkWell(
          splashFactory: InkRipple.splashFactory,
          onTap: () {
            Future.delayed(const Duration(milliseconds: 200)).whenComplete(() {
              onClick(Constants.doctorCategories[index]);
            });
          },
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Image.asset(
                  width: 45,
                  Constants.doctorCategories[index].picture,
                  scale: .5,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              SizedBox(
                width: 70,
                child: Text(
                  Constants.doctorCategories[index].name,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
