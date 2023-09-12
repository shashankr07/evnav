import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'appointment.dart';

sendNotificationToAdmin({required Appointment appointment}) async {
  print("REQUEST BUTTON PRESSED");
  final tokenCollection = FirebaseFirestore.instance.collection('Requests');
  var serverKey = dotenv.get('API-KEY');

  var token;
  await tokenCollection
      .doc("tokens")
      .get()
      .then((snapshot) => token = snapshot['admin-token']);

  // Creating message with Notification
  String constructFCMPayload(String token) {
    String day = appointment.time;
    String time = appointment.time;
    print("ENTERED FCM PAYLOAD");
    return jsonEncode(
      <String, dynamic>{
        'notification': <String, dynamic>{
          'body': "You have a new appointment for $time $day",
          'title': "New Appointment",
        },
        'data': <String, dynamic>{
          'name': appointment.name,
          'time': appointment.time.toString(),
          'service': appointment.service,
          'status': appointment.status,
          'id': appointment.id
        },
        'to': token
      },
    );
  }

  if (token.isEmpty) {
    return print("Unable to send FCM message, no token exists");
  }

  try {
    //Send Message
    http.Response response =
        await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
            headers: <String, String>{
              'Context-Type': 'application/json',
              'Authorization': 'key=$serverKey',
            },
            body: constructFCMPayload(token));

    print("Status ${response.statusCode} | Message Sent Successfully!");
  } catch (e) {
    print("Error push notification $e");
  }
}
