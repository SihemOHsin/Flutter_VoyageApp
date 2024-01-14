import 'package:flutter/material.dart';
class GlobalParams {
  static List<Map<String, dynamic>>menus=[
    {"title":"Accueil", "icon":Icon (Icons.home, color: Colors.brown,), "route":"/home"},
    {"title":"Météo", "icon":Icon (Icons.sunny_snowing, color: Colors.brown,), "route":"/meteo"},
    {"title":"Gallerie","icon":Icon(Icons.photo, color: Colors.brown,),"route":"/gallerie"},
    {"title":"Pays","icon":Icon(Icons.location_city, color: Colors.brown,), "route":"/pays"},
    {"title":"Contact", "icon":Icon (Icons.contact_page, color: Colors.brown,), " route":"/contact"},
    {"title":"Paramètres", "icon":Icon(Icons.settings, color: Colors.brown,), "route":"/parametres"},
    {"title":"Déconnexion","icon":Icon (Icons.logout, color: Colors.brown,), "route":"/authentification"},
];
  static List<Map<String, dynamic>>accueil=[
    {"image": AssetImage('images/meteo.png',), "route":"/meteo"},
    {"image":AssetImage('images/gallerie.png',), "route":"/gallerie"},
    {"image":AssetImage('images/pays.png',), "route":"/pays"},
    {"image":AssetImage('images/contact.png',), "route":"/contact"},
    {"image": AssetImage('images/parametres.png',), "route": "/parametres"},
    {"image":AssetImage('images/deconnexion.png',), "route":"/authentification"}, ];
}

