import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfosPersonnel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InfosPersonnel();
  }
}

class _InfosPersonnel extends State<InfosPersonnel> {
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
            title: const Text("Information personnel"),
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
          body: Container(
            height: Get.size.height,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: SizedBox(
                        child: Image.asset(
                          "assets/accounts _ user, users, profile, account, man, people, website, browser, webpage@2x.png",
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TextField(
                        //maxLength: 9,
                        decoration: InputDecoration(
                          label: Text("Nom complet"),
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        maxLength: 9,
                        decoration: InputDecoration(
                          label: Text("810111222"),
                          prefixIcon: Icon(
                            Icons.phone_android,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            //
                            //Get.to(Recherche());
                            //
                          },
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(1),
                            backgroundColor: MaterialStateProperty.all(
                              Colors.blue,
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          child: SizedBox(
                            height: 50,
                            width: Get.size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Enregistrer",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
