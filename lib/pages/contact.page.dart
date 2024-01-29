import 'package:flutter/material.dart';
import '../menu/drawer.widget.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/list_helper.dart';
import '../model/contact.model.dart';
import '../services/contact.service.dart';
import 'ajout_modif_contact.page.dart';

class ContactPage extends StatefulWidget {
  ContactService contactService = ContactService();

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Page Contact'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FormHelper.submitButton(
                "Ajout",
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AjoutModifContactPage(),
                    ),
                  ).then((value) {
                    setState(() {});
                  });
                },
                borderRadius: 10,
                btnColor: Colors.brown.shade200,
                borderColor: Colors.brown.shade200,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _fetchData(),
          ],
        ),
      ),
    );
  }

  _fetchData() {
    return FutureBuilder<List<Contact>>(
      future: widget.contactService.listeContacts(),
      builder: (BuildContext context, AsyncSnapshot<List<Contact>> contacts) {
        if (contacts.hasData) return _buildDataTable(contacts.data!);
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  _buildDataTable(List<Contact> listContacts) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListUtils.buildDataTable(
        context,
        ["Nom", "Telephone", "Action"],
        ["nom", "tel", ""],
        false,
        0,
        listContacts,
            (Contact c) {
          // Modifier contact
              Navigator.push(
                  context,
                  MaterialPageRoute (
                  builder: (context) => AjoutModifContactPage (
                  modifMode: true,
                  contact: c,
                  ),
                  ),
              ).then((value) {
                setState(() {});
              });
              ;
        },
            (Contact c) {
          // Supprimer contact
              return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Supprimer Contact"),
                    content: const Text(
                        "Etes vous sur de vouloir supprimer ce contact?"
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FormHelper.submitButton(
                            "Oui",
                                () {
                              widget.contactService.supprimerContact(c).then((value) {
                                setState(() {
                                  Navigator.of(context).pop();
                                });
                              });
                            },
                            width: 100,
                            borderRadius: 5,
                            btnColor: Colors.brown.shade300,
                            borderColor: Colors.brown.shade300,
                          ),
                          const SizedBox(width: 20),
                          FormHelper.submitButton(
                            "Non",
                                () {
                              Navigator.of(context).pop();
                            },
                            width: 100,
                            borderRadius: 5,
                            btnColor: Colors.brown.shade600,
                            borderColor: Colors.brown.shade600,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );


            },
        headingRowColor: Colors.brown.shade200,
        isScrollable: true,
        columnTextFontSize: 20,
        columnTextBold: false,
        columnSpacing: 50,
        onSort: (columnIndex, columnName, asc) {},
      ),
    );
  }
}
