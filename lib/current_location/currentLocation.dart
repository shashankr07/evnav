import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location/location.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({super.key});

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  Future<LocationData?> _currentLocation() async {
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LocationData?>(
        future: _currentLocation(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapchat) {
          if (snapchat.hasData) {
            final LocationData currentLocation = snapchat.data;
            return SfMaps(layers: <MapLayer>[
              MapTileLayer(
                  initialFocalLatLng: MapLatLng(
                      currentLocation.latitude!, currentLocation.longitude!),
                  initialZoomLevel: 14,
                  initialMarkersCount: 1,
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  markerBuilder: (BuildContext context, int index) {
                    return MapMarker(
                      latitude: currentLocation.latitude!,
                      longitude: currentLocation.longitude!,
                      child: Icon(
                        Icons.location_on,
                        color: Colors.red[800],
                      ),
                      size: Size(20, 20),
                    );
                  })
            ]);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
