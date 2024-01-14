import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage_app/pages/Authentification.page.dart';
import 'package:voyage_app/pages/Home.page.dart';
import 'package:voyage_app/pages/Inscription.page.dart';
import 'package:voyage_app/pages/contact.page.dart';
import 'package:voyage_app/pages/gallerie.page.dart';
import 'package:voyage_app/pages/meteo.page.dart';
import 'package:voyage_app/pages/parametres.page.dart';
import 'package:voyage_app/pages/pays.page.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  final ThemeData appTheme = ThemeData(
      primaryColor: Colors.brown.shade800,
      hintColor: Colors.brown.shade200);
  final routes = {
    '/home': (context) => HomePage(),
    '/inscription': (context) => InscriptionPage(),
    '/authentification': (context) => AuthentificationPage(),
    '/gallerie': (context) => GalleriePage(),
    '/meteo': (context) => MeteoPage(),
    '/pays': (context) => PaysPage(),
    '/contact': (context) => ContactPage(),
    '/parametres': (context) => ParametresPage()
  };

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> prefs) {
          var x = prefs.data;
          if (prefs.hasData) {
            bool conn = x?.getBool('connecte') ?? false;
            if (conn)
// return MaterialApp (home: Home Page ());
              return MaterialApp (
                  debugShowCheckedModeBanner: false,
                home: HomePage (),
                routes: routes,
                theme: ThemeData(
                  primaryColor: Colors.brown.shade800, hintColor: Colors.brown.shade200), // Set your desired primary color
          );
          }
// return MaterialApp (home: AuthentificationPage ());
          return MaterialApp(
          debugShowCheckedModeBanner: false,
            theme: ThemeData(
                  primaryColor:Colors.brown.shade800, hintColor: Colors.brown.shade200),
          home: AuthentificationPage(),
          routes: routes,
          );
        });
  }
}



