// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mini_project_xml/profile.dart';

class card extends StatelessWidget {
  String first_name;
  String last_name;
  String email;
  String phone;
  String city;
  String country;
  String qrCode;
  String picture;
  card(
      {Key? key,
      required this.picture,
      required this.city,
      required this.country,
      required this.email,
      required this.qrCode,
      required this.first_name,
      required this.last_name,
      required this.phone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => profile(
                  picture: picture,
                  qrCode: qrCode,
                  city: city,
                  country: country,
                  email: email,
                  first_name: first_name,
                  last_name: last_name,
                  phone: phone)));
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage(picture),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  first_name + " " + last_name,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
