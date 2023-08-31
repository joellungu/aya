import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NousContacetr extends StatelessWidget {
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
            title: const Text("Contactez-nous!"),
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
                          "assets/emails, communication _ email, mail, mailbox, postage, letter, send, man, people@2x.png",
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Expanded(
                          flex: 3,
                          child: TextField(
                            //maxLength: 9,
                            //maxLines: 7,
                            decoration: InputDecoration(
                              label: Text("Votre email"),
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          flex: 7,
                          child: TextField(
                            //maxLength: 9,
                            maxLines: 7,
                            decoration: InputDecoration(
                              label: Text("Votre message"),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
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
                                  "Envoyer",
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
