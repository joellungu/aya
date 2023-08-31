import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications extends StatelessWidget {
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //height: 50,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                alignment: Alignment.center,
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.search,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView(
                  padding: EdgeInsets.all(10),
                  children: List.generate(
                    6,
                    (index) {
                      return InkWell(
                        onTap: () {
                          //
                        },
                        child: menuContent("Nous contacter", "Lu",
                            "emails, communication _ email, mail, surprise, letter, envelope, woman, people@2x.png"),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//
  Widget menuContent(String titre, String status, String image) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      height: Get.size.height / 10,
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
                      "12/12/2022",
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      status,
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.normal,
                        color: Colors.blue,
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
