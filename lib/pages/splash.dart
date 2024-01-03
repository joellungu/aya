import 'dart:async';
import 'package:aya/pages/profil/compte/compte_controller.dart';
import 'package:get/get.dart';
import 'package:aya/pages/accueil/accueil.dart';
import 'package:aya/pages/historique/historique.dart';
import 'package:aya/pages/notifications/notifications.dart';
import 'package:aya/pages/profil/infos_personnel.dart/infos_personnel.dart';
import 'package:aya/pages/profil/profil.dart';
import 'package:aya/pages/reservations/reservation.dart';
import 'package:aya/widgets/carte_bus.dart';
import 'package:aya/widgets/dessin.dart';
import 'package:aya/widgets/ticket_widget.dart';
import 'package:simnumber/sim_number.dart';
import 'package:simnumber/siminfo.dart';
import 'package:ussd_advanced/ussd_advanced.dart';

import '';
import 'package:flutter/material.dart';

import 'accueil/accueil_controller.dart';
import 'application.dart';
import 'application_controller.dart';
import 'historique/historique_controller.dart';
import 'hotels/hotel_controller.dart';
import 'login/auth.dart';
import 'login/login_controller.dart';
import 'notifications/notification_controller.dart';
import 'recherche/lieu_controller.dart';
import 'recherche/rechercher_controller.dart';
import 'recherche/resultat.dart';
import 'recherche/resultat_controller.dart';
import 'reservations/details/details.dart';
import 'reservations/formulaire/formulaire.dart';
import 'reservations/paiement/paiement.dart';
import 'reservations/paiement/paiement_controller.dart';
import 'reservations/reservation_controller.dart';

class Splash extends StatelessWidget {
  //
  ApplicationController applicationController =
      Get.put(ApplicationController());
  //
  AccueilController accueilController = Get.put(AccueilController());
  //
  LoginController loginController = Get.put(LoginController());
  //
  RechercheController rechercheController = Get.put(RechercheController());
  //
  NotificationController notificationController =
      Get.put(NotificationController());
  //
  LieuController lieuController = Get.put(LieuController());
  //
  ResultatController resultatController = Get.put(ResultatController());
  //
  PaiementController paiementController = Get.put(PaiementController());
  //
  HistoriqueController historiqueController = Get.put(HistoriqueController());
  //
  ReservationController reservationController =
      Get.put(ReservationController());
  //
  CompteController compteController = Get.put(CompteController());
  //
  HotelController hotelController = Get.put(HotelController());
  //
  Splash() {
    Timer(const Duration(seconds: 1), () {
      load();
      //Get.off(Paiement()); //
    });
  }
  //
  load() async {
    bool c = await lieuController.getAllLieu();
    //
    if (c) {
      Get.off(Application());
    } else {
      Get.off(Application());
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(
          "assets/FINAL AYA.png",
          width: 100,
          height: 100,
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     //
      //     //ussdSendOne("*1122*1*1#");
      //     //
      //     ussdSendMulti("*1111#", 0);
      //     //
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
  //

  void printSimCardsData() async {
    try {
      SimInfo simInfo = await SimNumber.getSimData();
      //
      SimCard? simCard;
      //
      for (var s in simInfo.cards) {
        if (s.displayName == "VodaCom Congo") {
          simCard = s;
        }
        print(
            'Serial number: ${s.slotIndex} -- ${s.displayName} -- ${s.carrierName} -- ${s.carrierName} -- ${s.phoneNumber}');
      }

      UssdAdvanced.cancelSession();
      UssdAdvanced.sendUssd(code: "*1111*1*1#", subscriptionId: 1);
      //
      //print("e: $e");

      //
      //ussdSendMulti("*565#", 1);
      //
      //ussdSendOne("*1111*4*1#");
      //
    } on Exception catch (e) {
      debugPrint("error! code: ${e} - message: ${e}");
    }
  }

  ussdSendOne(String text) async {
    //*123*1*4*3#
    String? _res =
        await UssdAdvanced.sendAdvancedUssd(code: text, subscriptionId: 0);
    //
    print("rep: $_res");
  }

  ussdSendMulti(String text, int i) async {
    //
    UssdAdvanced.cancelSession();
    //
    String? _res =
        await UssdAdvanced.multisessionUssd(code: "*1111#", subscriptionId: 0);

    print("rep1: $_res");
    if (_res!.contains("1. Activation forfaits")) {
      print("rep1: $_res");
      //
      String? _res2 = await UssdAdvanced.sendMessage('1');
      print("rep2: $_res2");
      String? _res3 = await UssdAdvanced.sendMessage('1');
      print("rep3: $_res3");
      await UssdAdvanced.cancelSession();
    }
  }
}
