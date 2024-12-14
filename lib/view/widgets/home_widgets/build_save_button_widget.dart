import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import 'build_save_button.dart';
import 'build_saved_button.dart';

class BuildSaveButtonWidget extends StatefulWidget {
  const BuildSaveButtonWidget({super.key, required this.homeController});

  final HomeController homeController;

  @override
  State<BuildSaveButtonWidget> createState() => _BuildSaveButtonWidgetState();
}

class _BuildSaveButtonWidgetState extends State<BuildSaveButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return widget.homeController.saveButtonText.value == 'Saved'
          ? const BuildSavedButton()
          : BuildSaveButton(homeController: widget.homeController);
    });
  }
}
