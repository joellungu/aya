import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import 'compte_controller.dart';
import 'creer_compte.dart';

class Compte extends StatelessWidget {
  //
  var box = GetStorage();
  //
  Map profil = {};
  //
  Compte() {
    profil = box.read("profil") ?? {};
  }
  //
  CompteController compteController = Get.find();

  //
  //
  final formKey = GlobalKey<FormState>();
  final telephone = TextEditingController();
  final mdp = TextEditingController();
  //
  RxBool vue = true.obs;
  RxBool codeshow = false.obs;
  RxString codeText = "".obs;
  RxString codeErreur = "".obs;

  //AppController appController = Get.find();
  RxBool masquer = true.obs;

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
              "Compte",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            backgroundColor: Colors.indigo.shade900,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade900,
                          // image: DecorationImage(
                          //   image:
                          //       ExactAssetImage("assets/LOGO TRANSPARANT.png"),
                          //   fit: BoxFit.contain,
                          // ),
                        ),
                      ),
                      // Image.asset(
                      //   "assets/logo_MIN SANTE.png",
                      //   width: 300,
                      //   height: 300,
                      // ),

                      const SizedBox(
                        height: 70,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          """Saisisez votre numéro de téléphone pour récevoir votre code d'authentification""",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.labrada(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      TextFormField(
                        controller: telephone,
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "Veuilliez inserer numéro de téléphone";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          //fillColor: Colors.grey.shade100,
                          //filled: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),

                          prefix: Text("+243 "),
                          prefixIcon: const Icon(
                            Icons.phone_android,
                            color: Colors.black,
                          ),
                          hintText: "Téléphone",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => codeshow.value
                            ? TextFormField(
                                textAlign: TextAlign.center,
                                onChanged: (t) {
                                  if (t == codeText.value) {
                                    //
                                    codeshow.value = false;
                                    Get.to(CreerCompte(profil));
                                    //
                                  } else {
                                    codeErreur.value = "Code incorrecte";
                                  }
                                },
                                controller: mdp,
                                //obscureText: masquer.value,
                                validator: (e) {
                                  if (e!.isEmpty) {
                                    return "Veuilliez inserer votre code";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  //fillColor: Colors.grey.shade400,
                                  //filled: true,
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  label: Text(codeErreur.value),
                                  hintText: "Votre code",
                                ),
                              )
                            : OTPTextField(
                                length: 9,
                                width: Get.size.width / 1.2,
                                fieldWidth: 10,
                                style: const TextStyle(fontSize: 17),
                                textFieldAlignment:
                                    MainAxisAlignment.spaceAround,
                                fieldStyle: FieldStyle.underline,
                                onCompleted: (pin) {
                                  //print("Completed: " + pin);
                                },
                              ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            //Get.off(Accueil());

                            Get.dialog(Container(
                              height: 40,
                              width: 40,
                              child: const CircularProgressIndicator(),
                              alignment: Alignment.center,
                            ));

                            // // Timer(Duration(seconds: 3), () {
                            // //   Get.back();
                            // //   Get.off(Accueil());
                            // // });
                            // Map e = {
                            //   "email": email.text,
                            //   "pwd": mdp.text,
                            // };
                            //
                            String code = getCode();
                            codeText.value = code;
                            // appController.login(e);
                            Map rep = await compteController.verification(
                                "243${telephone.text}", code);
                            if (rep["serveurerreur"] == "oui") {
                              Get.snackbar("Erreur",
                                  "Un problème est survenu dans le serveur.");
                            } else {
                              if (rep["erreur"] == "oui") {
                                Get.snackbar("Erreur", rep["message"]);
                              } else {
                                if (rep["compte"] == "oui") {
                                  //
                                  codeshow.value = true;
                                  profil = rep["utilisateur"];
                                  //
                                } else {
                                  //
                                  profil = {"numero": "+243${telephone.text}"};
                                  codeshow.value = true;
                                }
                              }
                            }
//code.value

                            //Get.off(CreerCompte(
                            //  {"numero": "+243${telephone.text}"}));
                            //loginController.deja.value = true;
                          }
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                            Size(
                              double.maxFinite,
                              45,
                            ),
                          ),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          )),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue.shade900),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          child: Text(
                            "S'authentifier",
                            style: GoogleFonts.lato(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // OutlinedButton(
                      //   onPressed: () {
                      //     //
                      //     //Get.to(MdpOublie());
                      //   },
                      //   style: ButtonStyle(
                      //     fixedSize: MaterialStateProperty.all(
                      //       Size(
                      //         double.maxFinite,
                      //         45,
                      //       ),
                      //     ),
                      //     shape: MaterialStateProperty.all(
                      //       RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(3),
                      //         side: BorderSide(color: Colors.green.shade700),
                      //       ),
                      //     ),
                      //     //backgroundColor:
                      //     //  MaterialStateProperty.all(Colors.red.shade900),
                      //   ),
                      //   child: Container(
                      //     alignment: Alignment.center,
                      //     width: double.maxFinite,
                      //     child: Text(
                      //       "Créer un compte",
                      //       style: GoogleFonts.lato(
                      //         fontSize: 17,
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                  //)
                ),
              ),
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

  String getCode() {
    var n = Random();
    int t1 = n.nextInt(9);
    int t2 = n.nextInt(9);
    int t3 = n.nextInt(9);
    int t4 = n.nextInt(9);
    int t5 = n.nextInt(9);
    int t6 = n.nextInt(9);
    int t7 = n.nextInt(9);
    int t8 = n.nextInt(9);
    int t9 = n.nextInt(9);
    return "$t1$t2$t3$t4$t5$t6$t7$t8$t9";
  }
}
