import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../controller/home_controller.dart';

class BuildSaveButton extends StatefulWidget {
  const BuildSaveButton({super.key, required this.homeController});

  final HomeController homeController;

  @override
  State<BuildSaveButton> createState() => _BuildSaveButtonState();
}

class _BuildSaveButtonState extends State<BuildSaveButton> {
  // ignore: unused_field
  List<String> _items = [];

  void _addItem(String cityName) async {
    if (widget.homeController.cityName.value == 'Search city') {
      Fluttertoast.showToast(msg: 'Search city first');
    }

    final prefs = await SharedPreferences.getInstance();

    List<String> existingItems = prefs.getStringList('items') ?? [];

    if (existingItems.contains(cityName) ||
        widget.homeController.cityName.value == 'Search city') {
      Fluttertoast.showToast(msg: 'City already in the list');
    } else {
      existingItems.add(cityName);
      Fluttertoast.showToast(msg: 'City added to the list');
      setState(() {
        widget.homeController.saveButtonText.value = 'Saved';
      });
    }

    await prefs.setStringList('items', existingItems);

    setState(() {
      _items = existingItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainColor,
        minimumSize: Size(150.w, 50.h),
      ),
      onPressed: () => _addItem(widget.homeController.cityName.value),
      child: Text('Save', style: AppTextStyles.whitefont),
    );
  }
}
