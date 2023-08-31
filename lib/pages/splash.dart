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

import '';
import 'package:flutter/material.dart';

import 'accueil/accueil_controller.dart';
import 'application.dart';
import 'application_controller.dart';
import 'historique/historique_controller.dart';
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
  Splash() {
    Timer(const Duration(seconds: 3), () {
      Get.off(Application()); //
      //Get.off(Paiement()); //
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ClipPath(
          clipper: TicketWid(),
          child: Container(
            height: 250,
            width: 200,
            color: Colors.indigo.shade900,
          ),
        ),
        //const Text("..."),
      ),
    );
  }
}
