import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/global.params.dart';

class MyDrawer extends StatelessWidget {
  //const MyDrawer({Key? key}): super (key: key);

  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.white, Colors.brown]),
            ),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("images/sihem.png"),
                radius: 80,
              ),
            ),
          ),
          ...(GlobalParams.menus as List).map((item) {
            return ListTile (
              title: Text('${item['title']}', style: TextStyle (fontSize: 18),),
              leading: item['icon'],
              trailing: Icon(Icons.arrow_right,color : Colors.brown,),
              onTap: () async{
                if('${item['title']}'!="Déconnexion") {
                  Navigator.of(context).pop();
                  Navigator.pushNamed (context, "${item['route']}");
                }
                else
                {
                  prefs = await SharedPreferences.getInstance();
                  prefs.setBool ("connecte", false);
                  Navigator.of (context).pushNamedAndRemoveUntil('/authentification',
                          (Route<dynamic> route) => false);
                }
              },
            );
          })
        ],
      ),
    );
  }
}
