import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaysDetailsPage extends StatefulWidget {

  String ville = '';

  PaysDetailsPage(this.ville);

  @override
  State<PaysDetailsPage> createState() => PaysDetailsPageState();
}

class PaysDetailsPageState extends State<PaysDetailsPage> {
  Map<String, dynamic>? prayerTimes;

  @override
  void initState() {
    super.initState();
    getCountryData(widget.ville);
  }

  void getCountryData(String countryName) {
    print("Details de la ville / Pays: $countryName");
    String url = "https://muslimsalat.com/api/$countryName.json";
    http.get(Uri.parse(url)).then((resp) {
      final Map<String, dynamic> data = json.decode(resp.body);
      if (data['status_code'] == 1) {
        setState(() {
          this.prayerTimes = data;
          print(this.prayerTimes);
        });
      } else {
        print("No valid data found for $countryName");
      }
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Country Details: ${widget.ville}',
          style: TextStyle(color: Colors.brown.shade800),
        ),
      ),
      body: prayerTimes == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Section: Image with Title
            Image.asset(
              'images/priere.png',
              width: double.infinity,
              height: 150.0,
              fit: BoxFit.cover,
            ),
              Center(
                child: Text(
                'اوقات الصلاة اليوم',
                style: TextStyle(fontSize: 20.0),
              ),
            ),

            // Second Card: Prayer Times
            Column(
              children: [
                ListTile(
                  title: Text('Fajr - الفجر'),
                  subtitle: Text(prayerTimes!['items'][0]['fajr']),
                ),
                ListTile(
                  title: Text('Dhuhr -الظهر'),
                  subtitle: Text(prayerTimes!['items'][0]['dhuhr']),
                ),
                ListTile(
                  title: Text('Asr -العصر'),
                  subtitle: Text(prayerTimes!['items'][0]['asr']),
                ),
                ListTile(
                  title: Text('Maghrib -المغرب'),
                  subtitle: Text(prayerTimes!['items'][0]['maghrib']),
                ),
                ListTile(
                  title: Text('Isha -العشاء'),
                  subtitle: Text(prayerTimes!['items'][0]['isha']),
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Third Card: Lever de Soleil
            Card(
              child: Column(
                children: [
                  Image.asset(
                    'images/jour.png',
                    width: double.infinity,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Lever ',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  ListTile(
                    title: Text('الشروق'),
                    subtitle: Text(prayerTimes!['items'][0]['shurooq']),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // Fourth Card: Coucher de Soleil
            Card(
              child: Column(
                children: [
                  Image.asset(
                    'images/nuit.png',
                    width: double.infinity,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Coucher ',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  ListTile(
                    title: Text('الغروب'),
                    subtitle: Text(prayerTimes!['items'][0]['maghrib']),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


