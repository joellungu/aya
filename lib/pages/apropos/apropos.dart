import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Propos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Notifications"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.filter_list_sharp,
                  color: Colors.blue,
                ),
              ),
            ],
            leading: IconButton(
              onPressed: () {
                //
                Get.back();
                //
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.blue.shade700,
              ),
            ),
          ),
          body: Container(),
        ),
      ),
    );
  }
}
