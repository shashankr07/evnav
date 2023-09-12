import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'appointment.dart';

final tokenCollection = FirebaseFirestore.instance.collection('Requests');

sendNotificationToUser({required Appointment appointment}) async {
  var serverKey = dotenv.get('API-KEY');

  var token;
  await tokenCollection
      .doc("tokens")
      .get()
      .then((snapshot) => token = snapshot['user-token']);

  // Creating message with Notification
  String constructFCMPayload(String token) {
    return jsonEncode(
      <String, dynamic>{
        'notification': <String, dynamic>{
          'body':
              "Hi ${appointment.name}, Your ${appointment.service} appointment has been confirmed",
          'title': 'Appointment confirmed',
        },
        'data': <String, dynamic>{
          'name': appointment.name,
        },
        'to': token
      },
    );
  }

  if (token.isEmpty) {
    return log("Unable to send FCM message, no token exists of user");
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

    log("Status ${response.statusCode} | Message Sent Successfully!");
  } catch (e) {
    log("Error push notification $e");
  }
}
