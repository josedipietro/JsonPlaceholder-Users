import 'package:flutter/material.dart';

class User {
  final int id;
  final String name;
  final String userName;
  final String email;
  final UserAddress address;
  final String phone;
  final String website;
  final UserCompany company;

  User(
      {@required this.id,
      @required this.name,
      @required this.userName,
      @required this.email,
      @required this.address,
      @required this.phone,
      @required this.website,
      @required this.company});

  factory User.fromMap(Map<String, dynamic> map) {
    final address = map['address'];
    final geo = address['geo'];
    final company = map['company'];

    UserAddress userAddress = UserAddress(
        street: address['street'],
        suite: address['street'],
        city: address['street'],
        zipcode: address['street'],
        geo: GeoLocation(lat: geo['lat'], lgn: geo['lgn']));
    return User(
        id: map['id'],
        name: map['name'],
        userName: map['userName'],
        email: map['email'],
        address: userAddress,
        phone: map['phone'],
        website: map['website'],
        company: UserCompany(
            name: company['name'],
            catchPhrase: company['catchPhrase'],
            bs: company['bs']));
  }
}

class UserAddress {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoLocation geo;

  UserAddress(
      {@required this.street,
      @required this.suite,
      @required this.city,
      @required this.zipcode,
      @required this.geo});
}

class UserCompany {
  final String name;
  final String catchPhrase;
  final String bs;

  UserCompany(
      {@required this.name, @required this.catchPhrase, @required this.bs});
}

class GeoLocation {
  final String lat;
  final String lgn;

  GeoLocation({@required this.lat, @required this.lgn});
}
