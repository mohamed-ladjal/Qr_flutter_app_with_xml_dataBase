import 'package:flutter/material.dart';

class User {
  String first_name, last_name;
  String email;
  String phone;
  String city;
  String country;
  String qrCode;
  String picture;
  User(
    this.first_name,
    this.last_name,
    this.city,
    this.country,
    this.email,
    this.phone,
    this.qrCode,
    this.picture,
  );
}
