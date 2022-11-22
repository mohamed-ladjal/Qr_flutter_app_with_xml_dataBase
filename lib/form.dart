// ignore_for_file: unnecessary_new

import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

import 'Storage.dart';

class MyCustomForm extends StatefulWidget {
  var document;
  String contats;
  final Function callbackFunction;
  String first_name, last_name;
  String email;
  String phone;
  String city;
  String country;
  String? qrCode;
  String? picture;
  MyCustomForm(
      {Key? key,
      this.first_name = "",
      this.last_name = "",
      this.city = "",
      this.country = "",
      this.email = "",
      this.phone = "",
      required this.document,
      required this.contats,
      required this.callbackFunction})
      : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  File f = new File(
      'C:\\Users\\ASUS\\Desktop\\mini_project_xml\\assets\\contacts.xml');

  final builder = XmlBuilder();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //final file = File("path");
    //final document = XmlDocument.parse(file.readAsStringSync());
    //final builder = XmlBuilder();
    final first_namec = TextEditingController();
    final last_namec = TextEditingController();

    final cityc = TextEditingController();

    final countryc = TextEditingController();

    final emailc = TextEditingController();
    final phonec = TextEditingController();
    first_namec.text = widget.first_name;
    last_namec.text = widget.last_name;
    cityc.text = widget.city;
    countryc.text = widget.country;
    emailc.text = widget.email;
    phonec.text = widget.phone;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Form"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: first_namec,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  labelText: 'First Name',
                ),
              ),
              TextFormField(
                controller: last_namec,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  labelText: 'Last Name',
                ),
              ),
              TextFormField(
                controller: cityc,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.location_city),
                  labelText: 'City',
                ),
              ),
              TextFormField(
                controller: countryc,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.flag_outlined),
                  labelText: 'Country',
                ),
              ),
              TextFormField(
                controller: emailc,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.email),
                  labelText: 'Email',
                ),
              ),
              TextFormField(
                controller: phonec,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.phone),
                  labelText: 'Phone',
                ),
              ),
              new Container(
                  padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                  child: new TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      //final document = XmlDocument.parse(bookshelfXml);
                      buildContact(builder, first_namec.text, last_namec.text,
                          cityc.text, countryc.text, emailc.text, phonec.text);
                      widget.document.rootElement.children
                          .add(builder.buildFragment());
                      Navigator.pop(context);

                      widget.callbackFunction((widget.document
                          .toXmlString(pretty: true, indent: '\t')));
                      print(widget.contats +
                          (widget.document
                              .toXmlString(pretty: true, indent: '\t')));
                    },
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  // void buildcontact(XmlBuilder builder, String first_name, String last_name,
  void buildContact(XmlBuilder builder, String f, String l, String c, String co,
      String e, String p) {
    builder.element('Contact', nest: () {
      builder.element('FirstName', nest: () {
        builder.text(f);
      });
      builder.element('LastName', nest: () {
        builder.text(l);
      });
      builder.element('City', nest: () {
        builder.text(c);
      });
      builder.element('Country', nest: () {
        builder.text(co);
      });
      builder.element('Email', nest: () {
        builder.text(e);
      });
      builder.element('Phone', nest: () {
        builder.text(p);
      });
      builder.element('QrCode', nest: () {
        builder.text('images/new.png');
      });
      builder.element('Picture', nest: () {
        builder.text('images/new.png');
      });
    });
  }
}
