import 'package:auto_route/annotations.dart';
import 'package:doctor_247/common/utils/Constants.dart';
import 'package:doctor_247/common/utils/app_colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

@RoutePage()
class AddServicePage extends StatefulWidget {
  const AddServicePage({Key? key}) : super(key: key);

  @override
  State<AddServicePage> createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final serviceNameController = TextEditingController();
  final locationController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('আপনার সেবা যুক্ত করুন'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('আপনার নাম')),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: phoneNumberController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('আপনার মোবাইল নাম্বার')),
            ),
            const SizedBox(
              height: 8,
            ),
            DropdownButtonFormField2(
              decoration: InputDecoration(
                hintText: 'ক্যাটাগরি নির্বাচন করুন',
                isDense: true,
                contentPadding: const EdgeInsets.only(left: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              isExpanded: true,
              items: Constants.mainCategories
                  .map((item) => DropdownMenuItem<String>(
                        value: item.name,
                        child: Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                //Do something when changing the item if you want.
              },
              onSaved: (value) {},
              buttonStyleData: const ButtonStyleData(
                height: 60,
                padding: EdgeInsets.only(left: 20, right: 10),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: serviceNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('সেবার/প্রতিষ্ঠানের নাম'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: locationController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('সেবার ঠিকানা'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 150,
              child: MaterialButton(
                color: AppColors.primary,
                onPressed: () {
                  if (nameController.text.isEmpty ||
                      phoneNumberController.text.isEmpty ||
                      serviceNameController.text.isEmpty ||
                      locationController.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: 'দয়া করে প্রতিটি ক্ষেত্র পূরণ করুন', backgroundColor: Colors.black45);
                  }
                  Fluttertoast.showToast(
                      msg: 'দয়া করে প্রতিটি ক্ষেত্র পূরণ করুন', backgroundColor: Colors.black45);
                },
                child: const Text(
                  'প্রেরণ করুন',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
