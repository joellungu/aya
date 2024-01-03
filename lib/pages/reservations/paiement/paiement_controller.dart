import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:aya/pages/accueil/accueil.dart';
import 'package:aya/utils/requetes.dart';

class PaiementController extends GetxController with StateMixin<List> {
  RxList historique = RxList();
  //
  var box = GetStorage();
  //
  Requete requete = Requete();
  //
  Future<Map> paiement(Map e) async {
    Response rep = await requete.postE("paiement/paie", e);
    print("la reponse du serveur: ${rep.statusCode}");
    print("la reponse du serveur: ${rep.body}");

    if (rep.isOk) {
      return rep.body;
    } else {
      return {"erreur": rep.statusCode};
    }
  }

  //
  Future<void> achatTicket(List le) async {
    Response rep = await requete.postE("tickets", le);
    print("la reponse du serveur: ${rep.statusCode}");
    print("la reponse du serveur: ${rep.body}");

    if (rep.isOk) {
      List l = box.read("tickets") ?? [];
      l.add(le);
      box.write("tickets", l);
      //
      DateTime dateTime = DateTime.now();
      //
      Map e = {
        "date": "${dateTime.day}-${dateTime.month}-${dateTime.year}",
        "tickes": rep.body,
      };
      Get.back();
      Get.offAll(Accueil());
      //Get.snackbar("Succes", "Enregistrement du billet effectué");
      Get.dialog(
        Center(
          child: SizedBox(
            height: 250,
            width: Get.size.width / 1.2,
            child: Card(
              child: Column(
                children: [
                  Container(
                    color: Colors.blue.shade900,
                    alignment: Alignment.center,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "  Nombre de jour",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            //
                            Get.back();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 4,
                        child: InkWell(
                          onTap: () {
                            //
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            height: 50,
                            color: Colors.green.shade800,
                            alignment: Alignment.center,
                            //CDF
                            child: Text(
                              "Oui",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 4,
                        child: InkWell(
                          onTap: () {
                            //
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            height: 50,
                            color: Colors.red.shade800,
                            alignment: Alignment.center,
                            //CDF
                            child: Text(
                              "Oui",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      //eturn rep.body;
    } else {
      Get.back();
      Get.snackbar("Erreur",
          "Un problème est survenu lors de l'enregistrement du billet");
      //return {"erreur": rep.statusCode};
    }
  }

  //
  Future<Map> saveTicket(Map e) async {
    Response rep = await requete.postE("tickets", e);
    print("la reponse du serveur: ${rep.statusCode}");
    print("la reponse du serveur: ${rep.body}");

    if (rep.isOk) {
      return rep.body;
    } else {
      return {"erreur": rep.statusCode};
    }
  }

  Future<Map> verification(String orderNumber) async {
    //flexpay
    //Uri.parse("http://41.243.7.46:3006/api/rest/v1/check/$orderNumber"),
    var rep = await requete.getEE(
      "http://41.243.7.46:3006/api/rest/v1/check/$orderNumber",
      {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJcL2xvZ2luIiwicm9sZXMiOlsiTUVSQ0hBTlQiXSwiZXhwIjoxNzQ2MTg5MDk2LCJzdWIiOiJlYWVjMjJmYjIzZDRmYzIxYjc1ZmViZTdjYThjNmEyOSJ9.V36-U2YBmK5WuIR2jz6fMIt6VcsGzdn_38205UygYT8",
      },
    );
    /**
     * timeout(
      const Duration(minutes: 1),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 408); // Request Timeout response status code
      },
    );
     */
    print(rep.statusCode);
    print(rep.body);
    //Response rep = await requete
    //  .get("http://41.243.7.46:3006/flexpay/api/rest/v1/$orderNumber");
    if (rep.isOk) {
      return rep.body;
    } else {
      return rep.body;
    }
  }

  getAllBusTranson() async {
    Timer(Duration(seconds: 3), () {
      change([
        {"id": "1234567890"}
      ], status: RxStatus.success());
    });
  }

  ///
  Future<Map> getCompanie(String id) async {
    Response rep = await requete.getE("companie/$id");
    if (rep.isOk) {
      return rep.body;
    } else {
      return {};
    }
  }

  //
  Future<Map> getBuss(String id) async {
    Response rep = await requete.getE("bus/via/$id");
    if (rep.isOk) {
      return rep.body;
    } else {
      return {};
    }
  }
  //
}
