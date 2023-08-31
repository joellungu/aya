import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'accueil/Accueil.dart';
import 'application_controller.dart';
import 'login/login.dart';

class Application extends StatelessWidget {
  //
  ApplicationController applicationController = Get.find();
  //
  //
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => applicationController.inscrit.value ? Accueil() : Login(),
    );
  }
}
