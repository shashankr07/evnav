// This file is only used to test certain code which will later be used in the main codebase
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnav/login.dart';
import 'package:evnav/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

import 'package:location/location.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'scanner.dart';

late MapController mapController;
Future<LocationData?> _currentLocations() async {
  bool serviceEnabled;
  PermissionStatus permissionGranted;

  Location location = new Location();

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return null;
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return null;
    }
  }
  return await location.getLocation();
}

Widget maps() {
  return FutureBuilder(
      future: _currentLocations(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapchat) {
        if (snapchat.hasData) {
          final LocationData currentLocation = snapchat.data;
          return Center(
            child: SizedBox(
                height: 500,
                width: 500,
                child: FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                        enableScrollWheel: true,
                        scrollWheelVelocity: 0.005,
                        interactiveFlags: InteractiveFlag.all,
                        center: LatLng(currentLocation.latitude!,
                            currentLocation.longitude!),
                        zoom: 16.0,
                        maxZoom: 18.0,
                        minZoom: 3.0),
                    nonRotatedChildren: [
                      AttributionWidget.defaultWidget(
                        source: 'OpenStreetMap contributors',
                        onSourceTapped: null,
                      ),
                    ],
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(19.239424, 72.852382),
                            width: 100,
                            height: 100,
                            builder: (context) => IconButton(
                              icon: const Icon(Icons.location_on),
                              color: Colors.red,
                              iconSize: 45.0,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const UserProfile(
                                              name: "Shashank",
                                              rating: "5.0",
                                              chargingLevel: "Level 1",
                                              contact: "9878127364",
                                              acdc: "AC",
                                              addrs1:
                                                  "C/302, Yamuna bldg., Sector 10",
                                              addrs2: "Vasant Nagari, Vasai E",
                                              addrs3: "Maharashtra 401208",
                                            )));
                              },
                            ),
                          ),

                          // lat: 19.796892
                          // long: 72.745178

                          Marker(
                            point: LatLng(19.238844, 72.848832),
                            width: 100,
                            height: 100,
                            builder: (context) => const Icon(
                              Icons.charging_station,
                              size: 50,
                            ),
                          ),
                          Marker(
                            point: LatLng(19.244275, 72.852618),
                            width: 100,
                            height: 100,
                            builder: (context) => const Icon(
                              Icons.charging_station,
                              size: 50,
                            ),
                          ),
                        ],
                      ),
                    ])),
          );
        }
        return const Center(child: CircularProgressIndicator());
      });
}

// Old map code
Widget mapss() {
  return Center(
    child: SizedBox(
      height: 580,
      width: 500,
      child: FlutterMap(
        mapController: mapController,
        options: MapOptions(
            enableScrollWheel: true,
            scrollWheelVelocity: 0.005,
            interactiveFlags: InteractiveFlag.all,
            center: LatLng(19.239424, 72.852382),
            zoom: 16.0,
            maxZoom: 18.0,
            minZoom: 3.0),
        nonRotatedChildren: [
          AttributionWidget.defaultWidget(
            source: 'OpenStreetMap contributors',
            onSourceTapped: null,
          ),
        ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(19.239424, 72.852382),
                width: 100,
                height: 100,
                builder: (context) => IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.red,
                  iconSize: 45.0,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserProfile(
                                  name: "Prabal Nair",
                                  rating: "5.0",
                                  chargingLevel: "Level 1",
                                  contact: "9878127364",
                                  acdc: "AC",
                                  addrs1: "C/302, Yamuna bldg., Sector 10",
                                  addrs2: "Vasant Nagari, Vasai E",
                                  addrs3: "Maharashtra 401208",
                                )));
                  },
                ),
              ),

              // lat: 19.796892
              // long: 72.745178

              Marker(
                point: LatLng(19.238844, 72.848832),
                width: 100,
                height: 100,
                builder: (context) => const Icon(
                  Icons.charging_station,
                  size: 50,
                ),
              ),
              Marker(
                point: LatLng(19.244275, 72.852618),
                width: 100,
                height: 100,
                builder: (context) => const Icon(
                  Icons.charging_station,
                  size: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

String? documentId;
List<String> list1 = ["Select type"];

Widget companyDropDown() {
  CollectionReference users = FirebaseFirestore.instance.collection('ev_cars');

  return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("$data['type']");
        }

        return const Text("Loading");
      });
}

class TestingWidget extends StatefulWidget {
  const TestingWidget({super.key});

  @override
  State<TestingWidget> createState() => _TestingWidgetState();
}

class _TestingWidgetState extends State<TestingWidget> {
  @override
  Widget build(BuildContext context) {
    return companyDropDown();
  }
}
