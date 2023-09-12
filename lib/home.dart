import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:evnav/login.dart';
import 'package:evnav/test.dart';
import 'package:evnav/userProfile.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'scanner.dart';
import 'marker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<HomeScreen> {
  bool isRememberMe = false;
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  late MapController mapController;
  List<String> location = [
    "Boisar",
    "Vasai",
    "Borivili",
    "Virar",
    "Nallasopara"
  ];
  List<double> lat = [19.796892, 19.404242, 19.228413, 19.456360, 19.418343];
  List<double> long = [72.745178, 72.835770, 72.858164, 72.792458, 72.795593];

  List<double> lat2 = [19.233780];
  List<double> long2 = [72.856941];
  List<String> name = ["Rakesh D'mello"];
  List<String> rating = ["4.3"];
  List<String> chargLevel = ["Level 1"];
  List<String> contact = ["9017263512"];
  List<String> acdc = ["AC"];
  List<String> addr1 = ["C2, Agatha Heights, Sector 32"];
  List<String> addr2 = ["Daulat Nagar, Borivili E"];
  List<String> addr3 = ["Maharashtra"];

  var tokenCollection = FirebaseFirestore.instance.collection('Requests');

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    FirebaseMessaging.instance.getToken().then((token) {
      tokenCollection.doc('tokens').update({'user-token': token});
    });
  }

  void someFunction(double lat, double long) {
    mapController.move(LatLng(lat, long), 14.0);
    MarkerLayer(markers: [
      Marker(
        point: LatLng(lat, long),
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
                          addrs1: "C/302, Yamuna bldg., Sector 10",
                          addrs2: "Vasant Nagari, Vasai E",
                          addrs3: "Maharashtra 401208",
                        )));
          },
        ),
      ),
    ]);
  }

  Widget buildEmail() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Email",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2))
                  ]),
              height: 60,
              child: const TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xff001666),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.black38))))
        ]);
  }

  Widget buildSearchBar() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2))
                  ]),
              height: 60,
              child: DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  showSearchBox: true,
                ),
                items: location,
                dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration:
                        InputDecoration(hintText: "Search")),
                onChanged: (String? item) {
                  int t = 0;
                  for (int i = 0; i < location.length; i++) {
                    if (item == location[i]) {
                      t = i;
                    }
                  }
                  someFunction(lat[t], long[t]);
                },
                selectedItem: "Choose a location",
              ))
        ]);
  }

  Widget buildLasttName() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Last Name",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2))
                  ]),
              height: 60,
              child: const TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      prefixIcon: Icon(
                        Icons.account_box,
                        color: Color(0xff001666),
                      ),
                      hintText: "Last Name",
                      hintStyle: TextStyle(color: Colors.black38))))
        ]);
  }

  Widget buildNewPassword() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "New Password",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2))
                  ]),
              height: 60,
              child: const TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xff001666),
                      ),
                      hintText: "New Password",
                      hintStyle: TextStyle(color: Colors.black38))))
        ]);
  }

  Widget buildConPassword() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Confirm Password",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2))
                  ]),
              height: 60,
              child: const TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xff001666),
                      ),
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Colors.black38))))
        ]);
  }

  Widget buildForgotPassBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print("Forgot Password pressed"),
        //padding: EdgeInsets.only(right: 0),
        child: const Text(
          "Forgot Password",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildRememberCb() {
    return SizedBox(
        height: 20,
        child: Row(
          children: <Widget>[
            Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: isRememberMe,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    isRememberMe = value!;
                  });
                },
              ),
            ),
            const Text(
              "Remember me",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }

  Widget buildFindCharge() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255)),

          //elevation: 5,

          onPressed: () => someFunction(19.228413, 72.858164),
          // padding:
          //style: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          child: const Text(
            "Find Charging Location",
            style: TextStyle(
                color: Color(0xff001666),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ));
  }

  Widget buildPayButton() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255)),

          //elevation: 5,

          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const QRViewExample())),
          // padding:
          //style: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          child: const Text(
            "Scanner",
            style: TextStyle(
                color: Color(0xff001666),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ));
  }

  Widget buildSignUpBtn() {
    return GestureDetector(
      onTap: () => print("Home Page"),
      child: RichText(
          text: const TextSpan(children: [
        TextSpan(
            text: "Already have an account?",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        TextSpan(
            text: "Login",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
      ])),
    );
  }

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
                        const Mark(
                          lat: 19.804630,
                          long: 72.739496,
                          col: Colors.blue,
                          name: "Pratik Shinde",
                          rating: "4.5",
                          chargeL: "Level 2",
                          cont: "9817263546",
                          acdc: "AC",
                          addrs1: "A8, Shanti Ganga",
                          addrs2: "Shivaji Nagar, Boisar E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.821860,
                          long: 72.732642,
                          col: Colors.black,
                          name: "Kajal Agarwal",
                          rating: "4.5",
                          chargeL: "Level 2",
                          cont: "9817262323",
                          acdc: "AC",
                          addrs1: "A8, Yamuna Ganga",
                          addrs2: "Gandhi Nagar, Boisar E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.790438,
                          long: 72.751744,
                          col: Colors.black,
                          name: "Arman Agarwal",
                          rating: "4.2",
                          chargeL: "Level 1",
                          cont: "7877262323",
                          acdc: "AC",
                          addrs1: "B2, Bose building",
                          addrs2: "Shivaji Nagar, Boisar E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.787692,
                          long: 72.745736,
                          col: Colors.blue,
                          name: "Sushant Shetty",
                          rating: "4.5",
                          chargeL: "Level 1",
                          cont: "7871234323",
                          acdc: "AC",
                          addrs1: "B5, Bose building",
                          addrs2: "Shivaji Nagar, Boisar E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.403619,
                          long: 72.833268,
                          col: Colors.blue,
                          name: "Rohan Khan",
                          rating: "4.7",
                          chargeL: "Level 1",
                          cont: "7871210923",
                          acdc: "AC",
                          addrs1: "C1, Archimedies Apartment",
                          addrs2: "Vasant Nagari, Vasai E",
                          addrs3: "Maharashtra - 401208",
                        ),
                        const Mark(
                          lat: 19.403699,
                          long: 72.837124,
                          col: Colors.black,
                          name: "Manali Thakur",
                          rating: "4.2",
                          chargeL: "Level 2",
                          cont: "8901210923",
                          acdc: "DC",
                          addrs1: "A1, Dream Apartments",
                          addrs2: "Vasant Nagari, Vasai E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.402618,
                          long: 72.832384,
                          col: Colors.blue,
                          name: "Karan Sharma",
                          rating: "4.3",
                          chargeL: "Level 2",
                          cont: "8561210911",
                          acdc: "AC",
                          addrs1: "B202, Gulab Apartments",
                          addrs2: "Vasant Nagari, Vasai E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.402075,
                          long: 72.839206,
                          col: Colors.blue,
                          name: "Meghan Markle",
                          rating: "4.0",
                          chargeL: "Level 2",
                          cont: "8561278121",
                          acdc: "AC",
                          addrs1: "C201, Magic Apartments",
                          addrs2: "Evershine, Vasai E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.406730,
                          long: 72.835883,
                          col: Colors.blue,
                          name: "Raven D'costa",
                          rating: "4.9",
                          chargeL: "Level 1",
                          cont: "9887278121",
                          acdc: "AC",
                          addrs1: "C201, Regal Enclave",
                          addrs2: "Evershine, Vasai E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.400011,
                          long: 72.840239,
                          col: Colors.blue,
                          name: "Rohit Kamble",
                          rating: "5.0",
                          chargeL: "Level 1",
                          cont: "9887278121",
                          acdc: "AC",
                          addrs1: "Z3, Imperial Heights",
                          addrs2: "Evershine, Vasai E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.400011,
                          long: 72.840239,
                          col: Colors.blue,
                          name: "Rohit Kamble",
                          rating: "5.0",
                          chargeL: "Level 1",
                          cont: "9887278121",
                          acdc: "AC",
                          addrs1: "Z3, Imperial Heights",
                          addrs2: "Evershine, Vasai E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.405419,
                          long: 72.835448,
                          col: Colors.blue,
                          name: "Arbaaz Sheikh",
                          rating: "5.0",
                          chargeL: "Level 1",
                          cont: "9887279090",
                          acdc: "AC",
                          addrs1: "K2, Welcome Heights",
                          addrs2: "Evershine, Vasai E",
                          addrs3: "Maharashtra",
                        ),
                        // Borivili
                        const Mark(
                          lat: 19.233780,
                          long: 72.856941,
                          col: Colors.blue,
                          name: "Shubham Jha",
                          rating: "4.6",
                          chargeL: "Level 1",
                          cont: "9880978090",
                          acdc: "AC",
                          addrs1: "K4, Chandigarh Heights",
                          addrs2: "Maharath Nagar, Borivili E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.226236,
                          long: 72.853405,
                          col: Colors.blue,
                          name: "Aamir Khan",
                          rating: "4.8",
                          chargeL: "Level 2",
                          cont: "9880978111",
                          acdc: "AC",
                          addrs1: "K10, Mangum Imperial",
                          addrs2: "Maharath Nagar, Borivili E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.244648,
                          long: 72.867464,
                          col: Colors.black,
                          name: "Riya Singh",
                          rating: "4.1",
                          chargeL: "Level 3",
                          cont: "7896748090",
                          acdc: "DC",
                          addrs1: "Z3, Shinjuku Tower",
                          addrs2: "Daulat Nagar, Borivili E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.232418,
                          long: 72.865478,
                          col: Colors.blue,
                          name: "Wanda Maximoff",
                          rating: "4.9",
                          chargeL: "Level 1",
                          cont: "9880971020",
                          acdc: "AC",
                          addrs1: "A10, Passive Heights",
                          addrs2: "Gunjan Nagar, Borivili E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.219401,
                          long: 72.861586,
                          col: Colors.blue,
                          name: "Steve Sharma",
                          rating: "4.0",
                          chargeL: "Level 1",
                          cont: "7110978090",
                          acdc: "AC",
                          addrs1: "S2, Maharaja Heights",
                          addrs2: "Magic Nagar, Borivili E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.246145,
                          long: 72.850943,
                          col: Colors.blue,
                          name: "Sakshi Kumar",
                          rating: "3.8",
                          chargeL: "Level 1",
                          cont: "9880123490",
                          acdc: "AC",
                          addrs1: "M2, Magic Heights",
                          addrs2: "Shiv Nagar, Borivili E",
                          addrs3: "Maharashtra",
                        ),
                        // Virar
                        const Mark(
                          lat: 19.456888638528937,
                          long: 72.81643866513764,
                          col: Colors.blue,
                          name: "Magnus Karlsen",
                          rating: "4.9",
                          chargeL: "Level 2",
                          cont: "9880971234",
                          acdc: "AC",
                          addrs1: "A-101, Ambala Heights",
                          addrs2: "Kotian Nagar, Virar E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.454976924175426,
                          long: 72.7976370545667,
                          col: Colors.blue,
                          name: "Pratik Kumar",
                          rating: "4.3",
                          chargeL: "Level 1",
                          cont: "7880971234",
                          acdc: "AC",
                          addrs1: "A-301, Shikhara Heights",
                          addrs2: "Magic Nagar, Virar E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.454976924175426,
                          long: 72.7976370545667,
                          col: Colors.blue,
                          name: "Pratik Kumar",
                          rating: "4.3",
                          chargeL: "Level 1",
                          cont: "7880971234",
                          acdc: "AC",
                          addrs1: "A-301, Shikhara Heights",
                          addrs2: "Magic Nagar, Virar E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.454976924175426,
                          long: 72.7976370545667,
                          col: Colors.blue,
                          name: "Pratik Kumar",
                          rating: "4.3",
                          chargeL: "Level 1",
                          cont: "7880971234",
                          acdc: "AC",
                          addrs1: "A-301, Shikhara Heights",
                          addrs2: "Magic Nagar, Virar E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.454976924175426,
                          long: 72.7976370545667,
                          col: Colors.blue,
                          name: "Shashwat Kumar",
                          rating: "4.7",
                          chargeL: "Level 2",
                          cont: "9990871234",
                          acdc: "AC",
                          addrs1: "A-302, Magatha Heights",
                          addrs2: "Shrink Nagar, Virar E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.44616542492112,
                          long: 72.79943949905069,
                          col: Colors.blue,
                          name: "Nick Fury",
                          rating: "4.5",
                          chargeL: "Level 1",
                          cont: "7890871234",
                          acdc: "AC",
                          addrs1: "B-602, Shanti Heights",
                          addrs2: "Wink Nagar, Virar E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.45642395315201,
                          long: 72.81575542787917,
                          col: Colors.blue,
                          name: "Megan Singh",
                          rating: "4.2",
                          chargeL: "Level 1",
                          cont: "7890999234",
                          acdc: "AC",
                          addrs1: "B-602, Shanti Heights",
                          addrs2: "Wink Nagar, Virar E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.448840993785282,
                          long: 72.8108234454329,
                          col: Colors.blue,
                          name: "Chand Sifarsih",
                          rating: "4.9",
                          chargeL: "Level 1",
                          cont: "8880999234",
                          acdc: "AC",
                          addrs1: "B-902, Regal Heights",
                          addrs2: "Klink Nagar, Virar E",
                          addrs3: "Maharashtra",
                        ),
                        const Mark(
                          lat: 19.419193004633087,
                          long: 72.79749370085062,
                          col: Colors.blue,
                          name: "Ambala Naik",
                          rating: "4.7",
                          chargeL: "Level 2",
                          cont: "8880912312",
                          acdc: "AC",
                          addrs1: "C3, Matapa Heights",
                          addrs2: "Jinx Nagar, Nallasopara E",
                          addrs3: "Maharashtra",
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: LatLng(currentLocation.latitude!,
                                  currentLocation.longitude!),
                              width: 100,
                              height: 100,
                              builder: (context) => IconButton(
                                icon: const Icon(Icons.location_on),
                                color: Colors.red,
                                iconSize: 45.0,
                                onPressed: () {
                                  Builder(builder: (context) {
                                    return getLatLong();
                                  });
                                  //print(data['latitude']);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const UserProfile(
                                                name: "Shashank",
                                                rating: "5.0",
                                                chargingLevel: "Level 1",
                                                contact: "9878127364",
                                                acdc: "AC",
                                                addrs1:
                                                    "C/302, Yamuna bldg., Sector 10",
                                                addrs2:
                                                    "Vasant Nagari, Vasai E",
                                                addrs3: "Maharashtra 401208",
                                              )));
                                },
                              ),
                            ),

                            // lat: 19.796892
                            // long: 72.745178

                            Marker(
                              point: LatLng(19.804325, 72.750667),
                              width: 100,
                              height: 100,
                              builder: (context) => IconButton(
                                icon: const Icon(Icons.location_on),
                                color: Colors.green,
                                iconSize: 30.0,
                                onPressed: () {
                                  Builder(builder: (context) {
                                    return getLatLong();
                                  });
                                  //print(data['latitude']);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const UserProfile(
                                                name: "Prabal Nair",
                                                rating: "0",
                                                chargingLevel: "Level 1",
                                                contact: "9156988772",
                                                acdc: "AC",
                                                addrs1:
                                                    "C2, Flat no. 8, Shanti Nivas",
                                                addrs2: "Boisar E",
                                                addrs3: "Maharashtra 501202",
                                              )));
                                },
                              ),
                            ),
                            //lat: 19.809570
                            // long: 72.747587
                            Marker(
                              point: LatLng(19.809570, 72.747587),
                              width: 100,
                              height: 100,
                              builder: (context) => IconButton(
                                icon: const Icon(Icons.location_on),
                                color: Colors.green,
                                iconSize: 30.0,
                                onPressed: () {
                                  Builder(builder: (context) {
                                    return getLatLong();
                                  });
                                  //print(data['latitude']);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const UserProfile(
                                                name: "Prabal Nair",
                                                rating: "0",
                                                chargingLevel: "Level 1",
                                                contact: "9156988772",
                                                acdc: "AC",
                                                addrs1:
                                                    "C2, Flat no. 8, Shanti Nivas",
                                                addrs2: "Boisar E",
                                                addrs3: "Maharashtra 501202",
                                              )));
                                },
                              ),
                            ),
                            Marker(
                              point: LatLng(19.792294, 72.759985),
                              width: 100,
                              height: 100,
                              builder: (context) => IconButton(
                                icon: const Icon(Icons.location_on),
                                color: Colors.green,
                                iconSize: 30.0,
                                onPressed: () {
                                  Builder(builder: (context) {
                                    return getLatLong();
                                  });
                                  //print(data['latitude']);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const UserProfile(
                                                name: "Prabal Nair",
                                                rating: "0",
                                                chargingLevel: "Level 1",
                                                contact: "9156988772",
                                                acdc: "AC",
                                                addrs1:
                                                    "C2, Flat no. 8, Shanti Nivas",
                                                addrs2: "Boisar E",
                                                addrs3: "Maharashtra 501202",
                                              )));
                                },
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

  FutureBuilder getLatLong() {
    CollectionReference latlong =
        FirebaseFirestore.instance.collection('providers');

    return FutureBuilder<DocumentSnapshot>(
        future: latlong.doc(documentId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && snapshot.data!.exists) {
            return const Text("Document does not exsit");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            late Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            print("${data['latitude']}");
            // return Text(
            //     "Latitude: ${data['latitude']} Longitude: ${data['longitude']}");
          }
          return const Text("Loading");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Find Charging Station'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Search nearby charging station")));
            },
          ),
        ],
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
            child: Stack(
          children: <Widget>[
            Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0xff001666),
                      Color(0xff001666),
                      Color(0xff001666),
                      Color(0xff001666),
                    ])),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildSearchBar(),
                      /*
                      const SizedBox(height: 20),
                      buildLasttName(),
                      const SizedBox(height: 20),
                      buildEmail(),
                      const SizedBox(height: 20),
                      buildNewPassword(),
                      const SizedBox(height: 20),
                      buildConPassword(),
                      //buildForgotPassBtn(),
                      //buildRememberCb(),
                      const SizedBox(height: 40),
                      */
                      // const SizedBox(height: 20),
                      // curretLocationMap(),
                      const SizedBox(height: 20),
                      maps(),
                      const SizedBox(height: 5),
                      buildPayButton()
                      //buildSignUpBtn()
                    ],
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
