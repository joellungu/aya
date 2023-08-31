import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccueilController extends GetxController with StateMixin<Map> {
  RxBool inscrit = false.obs;
  analyse() async {
    Timer(Duration(seconds: 3), () {
      Map menu = {
        "menu": [
          {
            "titre": "Reservation",
            "icon":
                "navigation, location _ route, destination, marker, pin, gps, map, woman, people@2x.png",
          },
          {
            "titre": "Profil",
            "icon":
                "accounts _ user, users, profile, account, man, people, website, browser, webpage@2x.png"
          },
          {
            "titre": "Notification",
            "icon":
                "tools _ notification, ringtone, ring, ringing, bell, belltone, man, people@2x.png",
          },
          {
            "titre": "Historiques",
            "icon":
                "tools _ time, clock, time management, deadline, woman, people, reminder@2x.png",
          },
          {
            "titre": "Theme",
            "icon":
                "settings _ options, preferences, setting, dial, on, off, turn on, turn off, woman, people@2x.png",
          },
        ],
      };
      change(menu, status: RxStatus.success());
    });
  }
}
