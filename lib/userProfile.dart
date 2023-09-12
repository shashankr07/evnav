import 'package:evnav/appointment.dart';
import 'package:evnav/firestore/requestPush.dart';
import 'package:evnav/home.dart';
import 'package:evnav/notifyAdmin.dart';
import 'package:evnav/setUpInteractedMessage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'models/notification_api.dart';

final FlutterLocalNotificationsPlugin flutterNote =
    FlutterLocalNotificationsPlugin();

class UserProfile extends StatefulWidget {
  final String name;
  final String rating;
  final String chargingLevel;
  final String contact;
  final String acdc;
  final String addrs1;
  final String addrs2;
  final String addrs3;
  const UserProfile(
      {Key? key,
      required this.name,
      required this.rating,
      required this.chargingLevel,
      required this.contact,
      required this.acdc,
      required this.addrs1,
      required this.addrs2,
      required this.addrs3})
      : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    super.initState();

    //   FirebaseMessaging.instance.getInitialMessage();
    //   FirebaseMessaging.onMessage.listen((message) {
    //     if (message.notification != null) {
    //       print(message.notification!.body);
    //       print(message.notification!.title);
    //     }
    //   });

    //   FirebaseMessaging.onMessageOpenedApp.listen((message) {
    //     final routFromMessage = message.data['route'];
    //     print(routFromMessage);
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff001666),
      appBar: AppBar(
        title: const Text(
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            "Profile"),
        centerTitle: true,
        backgroundColor: Color(0xff001666),
        elevation: 0.0,
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/boy2.png'),
                  radius: 60.0,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(children: <Widget>[
                SizedBox(
                  width: 10,
                ),
              ]),
              const SizedBox(height: 10.0),
              Center(
                child: Text(widget.name,
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2.0,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(height: 20.0),
              const Center(
                child: Text('Rating',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2.0,
                    )),
              ),
              const SizedBox(height: 10.0),
              Center(
                child: Text(widget.rating,
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2.0,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.charging_station,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    widget.chargingLevel,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(width: 20.0),
                  Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    widget.contact,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.energy_savings_leaf,
                    color: Colors.white,
                  ),
                  Text(
                    widget.acdc,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 40.0),
              Column(children: <Widget>[
                Center(
                  child: Text('Address',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(height: 10.0),
                Center(
                  child: Text(widget.addrs1,
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.0,
                          fontSize: 18.0)),
                ),
                Center(
                  child: Text(widget.addrs2,
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.0,
                          fontSize: 18.0)),
                ),
                Center(
                  child: Text(widget.addrs3,
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.0,
                          fontSize: 18.0)),
                ),
              ]),
              const SizedBox(height: 30.0),
              Center(
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Color(0xff001666),
                          padding: const EdgeInsets.all(15.0),
                          textStyle: const TextStyle(fontSize: 20),
                          minimumSize: Size.fromHeight(50)),
                      onPressed: () {
                        //setUpInteractedMessage();
                        PushRequest("Shashank", "Karkera", "0987654321")
                            .addRequest();
                        sendNotificationToAdmin(
                            appointment: Appointment(
                                time: DateTime.parse('1969-07-20 20:18:04Z'),
                                name: "Shashank",
                                service: "Charging",
                                status: "Requested",
                                id: '1'));
                      },
                      child: const Text('Request'),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Color(0xff001666),
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(16.0),
                          textStyle: const TextStyle(fontSize: 20),
                          minimumSize: Size.fromHeight(50)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child: const Text('View Location'),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
