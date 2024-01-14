import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/global.params.dart';
import '../menu/drawer.widget.dart';

class HomePage extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text('Page Home')),
      body: Center(
        child: Wrap(
          children: [
            ... (GlobalParams.accueil as List).map((item) {
              return InkWell(
                child: Ink.image (
                  height: 180,
                  width: 180,
                  image: item['image'],
                ) ,
                onTap: () {
                  if ('${item['image']}' !=
                      AssetImage (
                        'images/deconnexion.png', ))
                    Navigator.pushNamed (context, "${item['route']}"); else
                    Deconnexion (context);
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  Future<void> Deconnexion(context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("connecte", false);
    Navigator.of(context).pushNamedAndRemoveUntil('/authentification', (Route<dynamic> route) => false);
  }
}
