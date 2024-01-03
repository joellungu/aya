import 'package:aya/pages/hotels/hotel_controller.dart';
import 'package:aya/widgets/lieu.dart';
import 'package:aya/widgets/modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail_hotel.dart';

class Hotel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Hotel();
  }
}

class _Hotel extends State<Hotel> {
  //
  HotelController hotelController = Get.find();
  //
  RxList categorie = [].obs;
  double top = 0.0;
  double y = -1.5;
  double y1 = -1.5;
  double y2 = -1;
  //
  RxBool renverser = false.obs;
  //
  //String jour = "", mois = "", annee = "";
  //
  String nombreP = '1';
  //

  RxInt jour = 1.obs;
  //
  RxList hotels = [
    "Chapitre_LM_780_2071.webp",
    "hotel-memling-cgha.jpg",
    "istockphoto-104731717-612x612.jpg",
    "jardi-n-2020900.avif",
    "Royal-Champagne-Hotel-Spa_Suite-Royal_Overview.jpg",
  ].obs;
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      color: Colors.indigo.shade900, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          //backgroundColor: Colors.grey.shade150,
          body: Stack(
            children: [
              NotificationListener<ScrollNotification>(
                onNotification: (sn) {
                  print("p: ${sn.metrics.pixels}");
                  print("eA: ${sn.metrics.extentAfter}");
                  print("eB: ${sn.metrics.extentBefore}");
                  print("eI: ${sn.metrics.extentInside}");
                  print("msE: ${sn.metrics.maxScrollExtent}");
                  print("msE: ${sn.metrics.minScrollExtent}");

                  if (sn.metrics.pixels <= 190) {
                    print('Get more data');
                    y = y1;
                    setState(() {});
                  } else {
                    y = y2;
                    setState(() {});
                  }
                  return true;
                },
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      backgroundColor: Colors.indigo.shade900,
                      onStretchTrigger: () {
                        print("Le truc strck");
                        return Future.value();
                      },
                      pinned: true,
                      snap: false,
                      floating: false,
                      expandedHeight: Get.size.height / 5,
                      flexibleSpace: FlexibleSpaceBar(
                        expandedTitleScale: 2,
                        background: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          //
                                        },
                                        icon: const Icon(
                                          Icons.help,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const Text(
                                        "Reservation Hotels",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          //
                                        },
                                        icon: Icon(
                                          Icons.help,
                                          color: Colors.indigo.shade900,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      showSimpleModal(Lieu(1), context);
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.indigo.shade800,
                                      ),
                                      elevation: MaterialStateProperty.all(0),
                                    ),
                                    child: SizedBox(
                                      width: Get.size.width / 1.2,
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              "Destination",
                                              style: TextStyle(
                                                color: Colors.grey.shade500,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 9,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        centerTitle: false,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 50,
                              width: Get.size.width / 1.1,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Expanded(
                                    flex: 4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.calendar_month,
                                          size: 30,
                                          color: Colors.black,
                                        ),
                                        Text(
                                          " Jour ",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Container(),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Obx(
                                      () => DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          value: jour.value,
                                          isExpanded: true,
                                          items: List.generate(
                                            7,
                                            (index) => DropdownMenuItem(
                                              value: index + 1,
                                              child: Text([
                                                "Lundi",
                                                "Mardi",
                                                "Mercredi",
                                                "Jeudi",
                                                "Vendredi",
                                                "Samedi",
                                                "Dimanche"
                                              ][index]),
                                            ),
                                          ),
                                          onChanged: (j) {
                                            jour.value = j as int;
                                            print(jour.value);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            /*
                              Container(
                                height: 50,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                width: Get.size.width / 1,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Adulte",
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 8,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Aller ",
                                              style: TextStyle(
                                                fontSize: 17,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.grey.shade600,
                                              size: 13,
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            */
                            ElevatedButton(
                              onPressed: () {
                                //Get.to(Resultat({}));
                                // if (lieuController.depart.value.isNotEmpty &&
                                //     lieuController.arrive.value.isNotEmpty) {
                                //   //
                                //   liste.add(
                                //       "${lieuController.depart.value}|${lieuController.arrive.value}|${jour.value}");
                                //   box.write("historiques", liste.value);
                                //   //
                                //   Get.to(
                                //     Resultat(
                                //         lieuController.depart.value,
                                //         lieuController.arrive.value,
                                //         jour.value),
                                //   );
                                //   //
                                // } else {
                                //   //
                                //   Get.snackbar(
                                //     "Attention",
                                //     "Veuillez selectionner le lieu de départ et d'arrivé.",
                                //     colorText: Colors.white,
                                //     snackStyle: SnackStyle.GROUNDED,
                                //   );
                                //   //
                                // }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.green.shade700,
                                ),
                                elevation: MaterialStateProperty.all(0),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                child: Text(
                                  "Rechercher",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                width: Get.size.width / 1.2,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20, top: 20),
                                child: Text(
                                  "Résultat de la recherche",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Obx(
                      () => SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            //String e = liste.toList()[index];
                            var h = hotels[index];

                            return ListTile(
                              onTap: () {
                                //
                                Get.to(
                                  HotelDetails(
                                    {
                                      "photo": hotels[index],
                                      "nom": "Hotel les délices du Ciel",
                                      "adresse":
                                          "Matadit Q/Tsimba, Av: bulimo, N°20/22B",
                                    },
                                  ),
                                );
                              },
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: ExactAssetImage(
                                          "assets/${hotels[index]}"),
                                      fit: BoxFit.cover),
                                  //border: Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              title: const Text(
                                "Hotel les délices du Ciel",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: RichText(
                                text: TextSpan(
                                  text: "",
                                  children: [
                                    WidgetSpan(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                    ),
                                    const TextSpan(text: "\n"),
                                    TextSpan(
                                      text:
                                          "Matadit Q/Tsimba, Av: bulimo, N°20/22B",
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          childCount: hotels.length,
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 200,
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedAlign(
                alignment: Alignment(0, y),
                duration: const Duration(milliseconds: 800),
                child: Container(
                  height: 55,
                  color: Colors.indigo.shade900,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const Text(
                        "AYA",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //Get.to(Lunette());
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reservartion d'hotel",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo.shade900,
      ),
      body: ListView(
        children: List.generate(hotels.length, (index) {
          //
        }),
      ),
    );
  }
}
