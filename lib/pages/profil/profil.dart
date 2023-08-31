import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'compte/compte.dart';

class Profil extends StatelessWidget {
  //
  var box = GetStorage();
  //
  Map profil = {};
  //
  Profil() {
    profil = box.read("profil") ?? {};
  }
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo.shade900, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text(
              "Profil",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            backgroundColor: Colors.indigo.shade900,
          ),
          body: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                // const ListTile(
                //   title: Text(
                //     "Kenda Business",
                //     style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 20,
                //       fontWeight: FontWeight.w900,
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(left: 20),
                //   child: Column(
                //     children: const [
                //       ListTile(
                //         leading: Icon(CupertinoIcons.profile_circled),
                //         title: Text("Mr. Jean Didie Mangombe"),
                //         subtitle: Text("Chauffeur"),
                //       ),
                //       ListTile(
                //         leading: Icon(CupertinoIcons.profile_circled),
                //         title: Text("Evariste Mwamba"),
                //         subtitle: Text("Receptionniste"),
                //       ),
                //     ],
                //   ),
                // ),
                // Divider(),
                ListTile(
                  title: Text(
                    "Compte",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      profil['nom'] != null
                          ? ListTile(
                              onTap: () {
                                //
                              },
                              leading: Icon(CupertinoIcons.profile_circled),
                              title: Text("${profil['nom']}"),
                              subtitle: Text("${profil['numero']}"),
                            )
                          : ListTile(
                              onTap: () {
                                //
                                Get.to(Compte());
                                //
                              },
                              leading: Icon(CupertinoIcons.profile_circled),
                              title: Text("AUCUN"),
                            ),
                      ListTile(
                        leading: Icon(CupertinoIcons.mail),
                        title: Text("Envoyer un commentaire"),
                        subtitle: Text("Aucun message"),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                const ListTile(
                  title: Text(
                    "Aide",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    children: const [
                      ListTile(
                        leading: Icon(Icons.help_outline_outlined),
                        title: Text("Aide et FAQ"),
                        subtitle: Divider(),
                      ),
                      ListTile(
                        leading: Icon(CupertinoIcons.info_circle),
                        title: Text("À propos de l'application"),
                        subtitle: Divider(),
                      ),
                    ],
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }

//
  Widget menuContent(String titre, String image) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      height: 100,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: SizedBox(
              child: Image.asset(
                "assets/$image",
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      titre,
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      titre,
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
