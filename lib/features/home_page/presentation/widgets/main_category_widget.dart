import 'package:doctor_247/common/utils/Constants.dart';
import 'package:flutter/material.dart';

class MainCategoryWidget extends StatelessWidget {
  final int index;
  final Function(String) onClick;

  const MainCategoryWidget({Key? key, required this.index, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashFactory: InkRipple.splashFactory,
        onTap: () {
          Future.delayed(const Duration(milliseconds: 200)).whenComplete(() {
            onClick(Constants.mainCategories[index].initial);
          });
        },
        child: SizedBox(
          height: 80,
          width: 80,
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Image.asset(
                    width: 60, Constants.mainCategories[index].picture),
              ),
              const SizedBox(
                height: 3,
              ),
              FittedBox(
                fit: BoxFit.cover,
                child:
                Text(
                  Constants.mainCategories[index].name,
                  style: const TextStyle(fontSize: 12),
                ),)
            ],
          ),
        ),
      ),
    );
  }
}
