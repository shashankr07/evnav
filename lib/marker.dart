import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'userProfile.dart';
import 'package:latlong2/latlong.dart';

class Mark extends StatelessWidget {
  final double lat;
  final double long;
  final Color col;
  final String name;
  final String rating;
  final String chargeL;
  final String cont;
  final String acdc;
  final String addrs1;
  final String addrs2;
  final String addrs3;

  const Mark(
      {super.key,
      required this.lat,
      required this.long,
      required this.col,
      required this.name,
      required this.rating,
      required this.chargeL,
      required this.cont,
      required this.acdc,
      required this.addrs1,
      required this.addrs2,
      required this.addrs3});

  @override
  Widget build(BuildContext context) {
    return MarkerLayer(
      markers: [
        Marker(
          point: LatLng(lat, long),
          width: 100,
          height: 100,
          builder: (context) => IconButton(
            icon: const Icon(Icons.location_on),
            color: col,
            iconSize: 30.0,
            onPressed: () {
              //print(data['latitude']);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserProfile(
                            name: name,
                            rating: rating,
                            chargingLevel: chargeL,
                            contact: cont,
                            acdc: acdc,
                            addrs1: addrs1,
                            addrs2: addrs2,
                            addrs3: addrs3,
                          )));
            },
          ),
        )
      ],
    );
  }
}
