import 'package:flutter/material.dart';
import 'pays-details.page.dart';


class PaysPage extends StatelessWidget {
  TextEditingController txtPays = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Pays', style: TextStyle(color: Colors.brown.shade800))),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txtPays,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.place),
                hintText: "Ville",
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
                  minimumSize: const Size.fromHeight(50), primary: Colors.brown.shade200),
              onPressed: () {
                onGetPaysDetails(context);
              },
              child: Text('OK', style: TextStyle(fontSize: 22, color: Colors.brown.shade800)),
            ),
          ),
        ],
      ),
    );
  }

  void onGetPaysDetails(BuildContext context) {
    String keyword = txtPays.text;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaysDetailsPage(keyword)),
    );
    txtPays.text = "";
  }
}

