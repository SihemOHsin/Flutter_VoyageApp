import 'package:flutter/material.dart';
import 'gallery-details.page.dart';

class GalleryPage extends StatelessWidget {
  TextEditingController txtGallery = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Gallery', style: TextStyle(color: Colors.brown.shade800))),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txtGallery,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.photo_library),
                hintText: "Keyword",
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50), primary : Colors.brown.shade200),
              onPressed: () {
                onGetGalleryDetails(context);
              },
              child: Text('Chercher', style: TextStyle(fontSize: 22, color: Colors.brown.shade800)),
            ),
          ),
        ],
      ),
    );
  }

  void onGetGalleryDetails(BuildContext context) {
    String keyword = txtGallery.text;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GalleryDetailsPage(keyword)),
    );
    txtGallery.text = "";
  }
}
