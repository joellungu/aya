import 'package:aya/pages/hotels/hotel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DetailAppartement extends StatelessWidget {
  Map cat;
  DetailAppartement(this.cat);
  //
  List hotels = [
    "Chapitre_LM_780_2071.webp",
    "hotel-memling-cgha.jpg",
    "istockphoto-104731717-612x612.jpg",
    "jardi-n-2020900.avif",
    "Royal-Champagne-Hotel-Spa_Suite-Royal_Overview.jpg",
  ];
  //
  List services = [
    {"nom": "Climatisation", "prix": "3000", "devise": "CDF"},
    {"nom": "Internet", "prix": "5000", "devise": "CDF"},
    {"nom": "Décodeur", "prix": "7000", "devise": "CDF"},
  ];
  //
  @override
  Widget build(BuildContext context) {
    //
    /**DefaultTabController(
      length: 2,
      child: 
    */

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              // title: RichText(
              //   textAlign: TextAlign.left,
              //   text: const TextSpan(
              //     style: TextStyle(
              //       //color: Colors.black,
              //       fontSize: 25,
              //       fontWeight: FontWeight.bold,
              //     ),
              //     text: "Details appartement\n",
              //     children: [
              //       TextSpan(
              //         text: "...",
              //         style: TextStyle(
              //           //color: Colors.black,
              //           fontSize: 20,
              //           fontWeight: FontWeight.normal,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              background: Container(
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   image: ExactAssetImage("${cat['profil']}"),
                  //   fit: BoxFit.contain,
                  // ),
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(2),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue.shade100.withOpacity(0.1),
                      Colors.blue.shade100.withOpacity(0.1),
                      Colors.blue.shade100.withOpacity(0.2),
                      Colors.blue.shade100.withOpacity(0.3),
                      Colors.blue.shade100.withOpacity(0.4),
                      Colors.blue.shade100.withOpacity(0.5),
                      Colors.blue.shade100.withOpacity(0.6),
                      Colors.blue.shade100.withOpacity(0.7),
                      Colors.blue.shade100,
                      Colors.blue.shade100,
                      Colors.blue.shade200,
                      //Colors.blue.shade300,
                      //Colors.blue.shade400,
                      //Colors.blue.shade500,
                      Colors.blue.shade500,
                      Colors.blue.shade700,
                      Colors.blue.shade900,
                      Colors.blue.shade900,
                    ],
                    //tileMode: TileMode.decal,
                    //stops: [0.1, 0.2, 0.3],
                  ),
                ),
                child: PageView(
                  children: List.generate(
                    hotels.length,
                    (index) {
                      return Container(
                        height: Get.size.height / 2,
                        width: Get.size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage("assets/${hotels[index]}"),
                            fit: BoxFit.cover,
                          ),
                          //color: Colors.blue,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      );
                    },
                  ),
                ),
                // child: Hero(
                //   tag: "${cat['profil']}",
                //   child: Image.asset(
                //     "${cat['profil']}",
                //     fit: BoxFit.contain,
                //     height: double.maxFinite,
                //     width: double.maxFinite,
                //   ),
                // ),
              ),
            ),
          ),
          // SliverGrid(
          //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //     maxCrossAxisExtent: 200.0,
          //     mainAxisSpacing: 10.0,
          //     crossAxisSpacing: 10.0,
          //     childAspectRatio: 4.0,
          //   ),
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return Container(
          //         alignment: Alignment.center,
          //         color: Colors.teal[100 * (index % 9)],
          //         child: Text('Grid Item $index'),
          //       );
          //     },
          //     childCount: 20,
          //   ),
          // ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    const ListTile(
                      title: Text(
                        "Hotel les délices du Ciel",
                        style: TextStyle(
                          //color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text("Matadit Q/Tsimba, Av: bulimo, N°20/22B"),
                      //trailing: Icon(CupertinoIcons.person),
                    ),
                    ListTile(
                      onTap: () {
                        //
                      },
                      title: const Text(
                        "Note",
                        style: TextStyle(
                          //color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow.shade700,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow.shade700,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow.shade700,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow.shade700,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow.shade700,
                            size: 15,
                          ),
                        ],
                      ),
                      trailing: const Icon(
                        Icons.favorite,
                        color: Colors.grey,
                      ),
                    ),
                    // ListTile(
                    //   title: Text(
                    //     "Capacités",
                    //     style: TextStyle(
                    //       //color: Colors.black,
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    //   subtitle: Text(
                    //       "Maquillage, Coiffure homme & dame, Manicure, Pédicure, Meche, Cabelo, tissage, Barbe"),
                    // ),

                    ListTile(
                      onTap: () {
                        //
                        //Get.to(Catalogue(cat));
                      },
                      title: const Text(
                        "Prix",
                        style: TextStyle(
                          //color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: RichText(
                        text: TextSpan(text: "", children: [
                          TextSpan(
                            text: "4 Pieces\n",
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          TextSpan(
                            text: "30000 CDF / ",
                            style: TextStyle(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          TextSpan(
                            text: "Nuit",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          )
                        ]),
                      ),
                      //trailing: const Icon(Icons.photo_camera),
                    ),
                    // ListTile(
                    //   onTap: () {
                    //     //
                    //     //Get.to(Catalogue(cat));
                    //   },
                    //   title: const Text(
                    //     "Catalogue",
                    //     style: TextStyle(
                    //       //color: Colors.black,
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    //   subtitle: const Text("Voir ses realisations"),
                    //   trailing: const Icon(Icons.photo_camera),
                    // ),

                    ListTile(
                      onTap: () {
                        //
                        //Get.to(Catalogue(cat));
                        TextEditingController nombre = TextEditingController();
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextField(
                                              autofocus: true,
                                              controller: nombre,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        //
                                      },
                                      // style: ButtonStyle(
                                      //   backgroundColor:
                                      //       MaterialStateProperty.all(Colors.blue.shade100),
                                      //   shape: MaterialStateProperty.all(
                                      //     RoundedRectangleBorder(
                                      //       borderRadius: BorderRadius.circular(5),
                                      //     ),
                                      //   ),
                                      // ),

                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        height: 50,
                                        color: Colors.green.shade800,
                                        alignment: Alignment.center,
                                        //CDF
                                        child: Text(
                                          "Ajouter",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
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
                      },
                      title: const Text(
                        "Nombre de jour",
                        style: TextStyle(
                          //color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text(
                        "1",
                        style: TextStyle(
                          //color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: const Icon(Icons.add_circle),
                    ),

                    // ListTile(
                    //   onTap: () {
                    //     showModalBottomSheet(
                    //       context: context,
                    //       builder: (c) {
                    //         return Container();
                    //       },
                    //     );
                    //   },
                    //   title: Text(
                    //     "Distance",
                    //     style: TextStyle(
                    //       //color: Colors.black,
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    //   subtitle: Text("À 5 min de vous"),
                    //   trailing: Icon(Icons.location_on),
                    // ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Infos suppl. ",
                              style: TextStyle(
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 10,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                width: double.maxFinite,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(services.length, (index) {
                        Map s = services[index];
                        return ListTile(
                          onTap: () {
                            //
                            //Get.to(Catalogue(cat));
                          },
                          title: Text(
                            "${s['nom']}",
                            style: const TextStyle(
                              //color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text("${s['nom']}"),
                          trailing: s['nom'] == "Climatisation"
                              ? const Icon(CupertinoIcons.thermometer_snowflake)
                              : s['nom'] == "Internet"
                                  ? const Icon(Icons.wifi)
                                  : const Icon(Icons.tv),
                        );
                      }),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Total ",
                              style: TextStyle(
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 10,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                width: double.maxFinite,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: const Text(
                        "30000 CDF ",
                        style: TextStyle(
                          //color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: RichText(
                        text: const TextSpan(text: "", children: [
                          TextSpan(
                            text: "x ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          TextSpan(
                            text: "2",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ]),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        //
                      },
                      // style: ButtonStyle(
                      //   backgroundColor:
                      //       MaterialStateProperty.all(Colors.blue.shade100),
                      //   shape: MaterialStateProperty.all(
                      //     RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(5),
                      //     ),
                      //   ),
                      // ),

                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        height: 70,
                        color: Colors.green.shade800,
                        alignment: Alignment.center,
                        //CDF
                        child: Text(
                          "15000 CDF",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // child: Container(
                      //   height: 70,
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Text(
                      //         "Reserver maintenant",
                      //         textAlign: TextAlign.center,
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.normal,
                      //           fontSize: 20,
                      //           color: Colors.black,
                      //         ),
                      //       ),
                      //       Text(
                      //         "15000 CDF",
                      //         textAlign: TextAlign.center,
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 20,
                      //           color: Colors.black,
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
    //
  }
}
