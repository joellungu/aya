import 'package:aya/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:aya/pages/splash.dart';

import 'pages/hotels/hotel.dart';

void main() async {
  //

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  //
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kenda',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(),
        textTheme: TextTheme(),
      ).copyWith(
        // floatingActionButtonTheme: FloatingActionButtonThemeData(
        //     backgroundColor: Colors.yellow,
        //     sizeConstraints: BoxConstraints.loose(Size(40, 40))),
        colorScheme: ColorScheme.light(
          primary: Colors.indigo.shade900, // <-- SEE HERE
          onPrimary: Colors.white, // <-- SEE HERE
          //onSurface: Color.fromARGB(255, 66, 125, 145), // <-- SEE HERE
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          modalBackgroundColor: Colors.transparent,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
        primaryColor: Colors.blue,
        backgroundColor: Colors.grey.shade200,
        appBarTheme: AppBarTheme(
          color: Colors.grey.shade200,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
        ),
        // textTheme: const TextTheme(
        //   bodySmall: TextStyle(
        //     color: Colors.black,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        // primaryTextTheme: const TextTheme(
        //   bodySmall: TextStyle(
        //     color: Colors.black,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        scaffoldBackgroundColor: Colors.grey.shade200,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: Colors.blue.shade700,
          linearMinHeight: 1.5,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.blue,
          ),
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.blue,
            primary: Colors.white,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: Colors.purple,
            backgroundColor: Colors.green,
          ),
        ),
      ),
      home:
          //Hotel()
          Splash(),
    );
  }
}
