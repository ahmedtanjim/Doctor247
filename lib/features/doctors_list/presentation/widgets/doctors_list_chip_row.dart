import 'package:doctor_247/common/utils/Constants.dart';
import 'package:doctor_247/common/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DoctorsListChipRow extends StatelessWidget {
  const DoctorsListChipRow({
    super.key,
    required int selectedOption, required this.onSelectNewChip,
  }) : _selectedOption = selectedOption;

  final int _selectedOption;
  final Function(int) onSelectNewChip;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: Constants.doctorCategories.map((option) {
                  final index = Constants.doctorCategories.indexOf(option);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ChoiceChip(
                      label: Text(
                        option.name,
                        style: TextStyle(
                            color: _selectedOption == index
                                ? Colors.white
                                : Colors.black87),
                      ),
                      selected: _selectedOption == index,
                      onSelected: (selected) {
                        onSelectNewChip((selected ? index : null)!);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      selectedColor: AppColors.primary,
                      backgroundColor: AppColors.secondary.withOpacity(.8),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
