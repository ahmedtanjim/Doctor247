import 'package:flutter/material.dart';

import '../doctors_list_page.dart';

class DoctorsListPageSearchBar extends StatelessWidget {
  const DoctorsListPageSearchBar({
    super.key,
    required this.widget,
  });

  final DoctorsListPage widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Card(
        elevation: 3,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: TextFormField(
          controller: widget.search,
          onChanged: (t) {},
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.text,
          onFieldSubmitted: (value) {
            print("search");
          },
          onTapOutside: (f) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            hintText: 'অনুসন্ধান করুন',
            border: InputBorder.none,
            prefixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
            suffixIcon: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // added line
              mainAxisSize: MainAxisSize.min,
              // a
              children: [
                widget.search.text != ''
                    ? IconButton(
                        onPressed: () {
                          widget.search.text = '';
                        },
                        icon: const Icon(
                          Icons.close,
                        ),
                      )
                    : const SizedBox(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter_list,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
