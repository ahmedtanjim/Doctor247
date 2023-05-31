import 'package:auto_route/auto_route.dart';
import 'package:doctor_247/common/presentation/routes/router.dart';
import 'package:doctor_247/common/presentation/routes/router.gr.dart';
import 'package:doctor_247/common/utils/Constants.dart';
import 'package:doctor_247/features/home_page/presentation/widgets/main_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'widgets/doctor_Category_widget.dart';

@RoutePage()
class DoctorCategoryPage extends StatelessWidget {
  const DoctorCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              AutoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('বিভাগ নির্বাচন করুন'),
      ),
      backgroundColor: Colors.white.withOpacity(.95),
      body: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: AlignedGridView.count(
                crossAxisCount: 3,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: Constants.doctorCategories.length,
                itemBuilder: (context, index) => DoctorCategoryWidget(
                  index: index,
                  onClick: (category) {
                    AutoRouter.of(context).navigate(
                      DoctorsListRoute(
                        doctorsField: category.initial,
                        doctorsFieldHeader: category.name,
                        index: index,
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
