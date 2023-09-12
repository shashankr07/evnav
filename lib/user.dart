import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  final String fname;
  final String lname;
  final String email;
  final String password;

  User(
      {this.id = '',
      required this.fname,
      required this.lname,
      required this.email,
      required this.password});

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': fname,
        'last_name': lname,
        'email': email,
        'password': password
      };

  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      fname: json['first_name'],
      lname: json['last_name'],
      email: json['email'],
      password: json['password']);
}
