import 'package:aya/pages/profil/compte/compte_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class CreerCompte extends StatelessWidget {
  //
  var box = GetStorage();
  //
  CompteController compteController = Get.find();
  //
  Map profil = {};
  //
  CreerCompte(this.profil) {
    if (profil['nom'] != null) {
      //
      nom.text = profil['nom'];
      datenaissance.value = profil['datenaissance'];
    }
    //profil = box.read("profil") ?? {};
    telephone.text = profil['numero'];
  }
  //
  //
  final formKey = GlobalKey<FormState>();
  final telephone = TextEditingController();
  final nom = TextEditingController();
  RxString datenaissance = "".obs;
  //
  RxBool vue = true.obs;
  RxBool code = false.obs;

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
            padding: const EdgeInsets.symmetric(horizontal: 25),
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
                          """Information d'identification""",
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
                        controller: nom,
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "Veuilliez inserer Noms";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          //fillColor: Colors.grey.shade100,
                          //filled: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          hintText: "Noms",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: telephone,
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "Veuilliez inserer numéro de téléphone";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          //fillColor: Colors.grey.shade100,
                          //filled: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabled: false,
                          //prefix: Text("+243 "),
                          prefixIcon: const Icon(
                            Icons.phone_android,
                            color: Colors.black,
                          ),
                          hintText: "Téléphone",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade600),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1920),
                                  lastDate: DateTime(2100),
                                ).then((d) {
                                  datenaissance.value =
                                      "${d!.day}-${d.month}-${d.year}";
                                });
                              },
                              child: Icon(Icons.calendar_month),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Date de naissance"),
                            SizedBox(
                              width: 10,
                            ),
                            Obx(
                              () => Text(
                                datenaissance.value,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // TextFormField(
                      //   controller: mdp,
                      //   obscureText: masquer.value,
                      //   validator: (e) {
                      //     if (e!.isEmpty) {
                      //       return "Veuilliez inserer votre mot de passe";
                      //     }
                      //     return null;
                      //   },
                      //   decoration: InputDecoration(
                      //     //fillColor: Colors.grey.shade400,
                      //     //filled: true,
                      //     contentPadding:
                      //         const EdgeInsets.symmetric(vertical: 5),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(20),
                      //     ),
                      //     prefixIcon: Obx(
                      //       () => IconButton(
                      //         icon: vue.value
                      //             ? Icon(
                      //                 Icons.lock,
                      //                 color: Colors.black,
                      //               )
                      //             : Icon(
                      //                 Icons.lock,
                      //                 color: Colors.black,
                      //               ),
                      //         onPressed: () {
                      //           //
                      //           masquer.value = !masquer.value;
                      //         },
                      //       ),
                      //     ),
                      //     hintText: "Mot de passe",
                      //   ),
                      // ),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            //Get.off(Accueil());

                            Get.dialog(Container(
                              height: 40,
                              width: 40,
                              child: const CircularProgressIndicator(),
                              alignment: Alignment.center,
                            ));
                            if (profil['nom'] != null) {
                              Map user = {
                                "id": profil['id'],
                                "nom": nom.text,
                                "numero": telephone.text,
                                "datenaissance": datenaissance.value,
                              };
                              compteController.mettreAjour(user);
                            } else {
                              Map user = {
                                "nom": nom.text,
                                "numero": telephone.text,
                                "datenaissance": datenaissance.value,
                              };
                              compteController.creer(user);
                            }
                            // // Timer(Duration(seconds: 3), () {
                            // //   Get.back();
                            // //   Get.off(Accueil());
                            // // });
                            // Map e = {
                            //   "email": email.text,
                            //   "pwd": mdp.text,
                            // };
                            // appController.login(e);
                            //Get.off(Accueil());
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
                            "Enregistrer",
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
}
