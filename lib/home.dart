import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mini_project_xml/card.dart';
import 'package:mini_project_xml/form.dart';
import 'package:mini_project_xml/scan.dart';
import 'package:mini_project_xml/showDataBase.dart';
import 'package:xml/xml.dart';
import 'CustomSearchDelegate .dart';
import 'user.dart';
import 'package:xml/xml.dart' as xml;

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  XmlDocument raw = new XmlDocument();

  List<String> searchTerms = [];
  var contacts = '''<?xml version="1.0"?>
<Contacts>
  <Contact >
      <FirstName>mouhamed</FirstName>
      <LastName>laadjel</LastName>
      <City>tebessa</City>
      <Email>mohamed.laadjel2019@gmail.com</Email>
      <Phone>0699479120</Phone>
      <Country>algeria</Country>
      <QrCode>images/qr/mohamed.png</QrCode>
      <Picture>images/1.png</Picture>
  </Contact>
<Contact >
  <FirstName>lucas</FirstName>
  <LastName>hood</LastName>
  <City>banshee</City>
  <Email>lucas.hood@gmail.com</Email>
  <Phone>0112993939</Phone>
  <Country>united states</Country>
  <QrCode>images/qr/lucas.png</QrCode>
  <Picture>images/lucas.jpg</Picture>
</Contact>
<Contact >
  <FirstName>tom</FirstName>
  <LastName>hardy</LastName>
  <City>london</City>
  <Email>tom_hardy@yahoo.fr</Email>
  <Phone>002123343434</Phone>
  <Country>united kingdom</Country>
  <QrCode>images/qr/tom.png</QrCode>
  <Picture>images/tom.jpg</Picture>
</Contact>
<Contact >
  <FirstName>moulay</FirstName>
  <LastName>3achour</LastName>
  <City>alger</City>
  <Email>achour.10@gmail.com</Email>
  <Phone>06003923903</Phone>
  <Country>algeria</Country>
  <QrCode>images/qr/3achour.png</QrCode>
  <Picture>images/3achour.jpg</Picture>
</Contact>
<Contact >
  <FirstName>donald</FirstName>
  <LastName>trump</LastName>
  <City>new york</City>
  <Email>donal.trump@gmail.com</Email>
  <Phone>091139391066</Phone>
  <Country>united states</Country>
  <QrCode>images/qr/trump.png</QrCode>
  <Picture>images/trump.jpg</Picture>
</Contact>
<Contact >
  <FirstName>elliot</FirstName>
  <LastName>robot</LastName>
  <City>fsosity</City>
  <Email>MrRobot@robot.com</Email>
  <Phone>0929089330</Phone>
  <Country>united states</Country>
  <QrCode>images/qr/mrrobot.png</QrCode>
  <Picture>images/mrrobot.jpg</Picture>
</Contact>
<Contact >
  <FirstName>joe</FirstName>
  <LastName>baiden</LastName>
  <City>Pennsylvania</City>
  <Email>joe.baiden@gmail.com</Email>
  <Phone>011939203038</Phone>
  <Country>united states</Country>
  <QrCode>images/qr/baiden.png</QrCode>
  <Picture>images/baiden.jpg</Picture>
</Contact>
<Contact >
  <FirstName>authman</FirstName>
  <LastName>ariouete</LastName>
  <City>aumdakoul</City>
  <Email>authman.ariouete@gmail.com</Email>
  <Phone>0699473838</Phone>
  <Country>algeria</Country>
  <QrCode>images/qr/authman.png</QrCode>
  <Picture>images/authman.jpg</Picture>
</Contact>
</Contacts>

''';

  callback(varContacts) {
    setState(() {
      contacts = varContacts;
    });
  }

  Future<List<User>> getContactsFromXml(BuildContext context) async {
    // String xmlString =
    //   await DefaultAssetBundle.of(context).loadString(Contacts);

    raw = XmlDocument.parse(contacts);

    var elements = raw.findAllElements("Contact");
    return elements.map((e) {
      searchTerms.add(e.findElements("FirstName").first.text +
          " " +
          e.findElements("LastName").first.text);
      return User(
        e.findElements("FirstName").first.text,
        e.findElements("LastName").first.text,
        e.findElements("City").first.text,
        e.findElements("Country").first.text,
        e.findElements("Email").first.text,
        e.findElements("Phone").first.text,
        e.findElements("QrCode").first.text,
        e.findElements("Picture").first.text,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("XML Editor"),
          actions: [
            IconButton(
              onPressed: () {
                // method to show the search bar
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate:
                        CustomSearchDelegate(searchTerms: this.searchTerms));
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: getContactsFromXml(context),
            builder: (context, data) {
              if (data.hasData) {
                List<User> contacts = data.data as List<User>;
                return Column(
                  children: [
                    Expanded(
                      flex: 9,
                      child: ListView.builder(
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            return card(
                              picture: contacts[index].picture,
                              first_name: contacts[index].first_name,
                              last_name: contacts[index].last_name,
                              city: contacts[index].city,
                              country: contacts[index].country,
                              email: contacts[index].email,
                              phone: contacts[index].phone,
                              qrCode: contacts[index].qrCode,
                            );
                          }),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                              FloatingActionButton(
                                backgroundColor: Colors.red,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          showDataBase(data: this.contacts)));
                                },
                                heroTag: "btn3",
                                child: const Icon(Icons.file_open),
                                elevation: 7,
                              ),
                              Spacer(),
                              FloatingActionButton(
                                backgroundColor: Colors.red,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ScanPage(
                                            document: raw,
                                            contats: this.contacts,
                                            callbackFunction: callback,
                                          )));
                                },
                                heroTag: "btn1",
                                child: const Icon(Icons.qr_code_scanner),
                                elevation: 5,
                              ),
                              Spacer(),
                              FloatingActionButton(
                                backgroundColor: Colors.red,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MyCustomForm(
                                            document: raw,
                                            contats: this.contacts,
                                            callbackFunction: callback,
                                          )));
                                },
                                heroTag: "btn2",
                                child: const Icon(Icons.add),
                                elevation: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
