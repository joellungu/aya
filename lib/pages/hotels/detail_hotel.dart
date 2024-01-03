import 'package:aya/pages/hotels/hotel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'details_appartement.dart';

class HotelDetails extends StatelessWidget {
  Map hotel;
  HotelDetails(this.hotel);
  //
  @override
  Widget build(BuildContext context) {
    //
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              //
              Get.back();
              //
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text(
            "${hotel['nom']}",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.indigo.shade900,
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey.shade500,
            isScrollable: true,
            tabs: [
              Tab(
                //icon: Icon(Icons.location_on),
                text: "Etage n° 1",
              ),
              Tab(
                //icon: Icon(Icons.workspaces),
                text: "Etage n° 2",
              ),
              Tab(
                //icon: Icon(Icons.calendar_month),
                text: "Etage n° 3",
              ),
              Tab(
                //icon: Icon(Icons.airplanemode_on),
                text: "Etage n° 4",
              ),
            ],
          ),
        ),
        body: TabBarView(
          //physics: BouncingScrollPhysics(),
          children: [
            ListView(
              children: List.generate(10, (index) {
                //
                return ListTile(
                  onTap: () {
                    //
                    Get.to(DetailAppartement({"nom": "f"}));
                  },
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  title: const Text(
                    "Appartement standare",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  subtitle: RichText(
                    text: TextSpan(text: "", children: [
                      TextSpan(
                        text: "4 Pieces\n",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: "30000 CDF / ",
                        style: TextStyle(
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: "Nuit",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    ]),
                  ),
                );
              }),
            ),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
