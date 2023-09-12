import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EVRegistrationForm extends StatefulWidget {
  const EVRegistrationForm({super.key});

  @override
  State<EVRegistrationForm> createState() => _EVRegistrationFormState();
}

class _EVRegistrationFormState extends State<EVRegistrationForm> {
  String dropdownvalue = 'Choose a car';
  var items = ['Choose a car'];
  var item = FirebaseFirestore.instance
      .collection('ev_cars')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {});
  }).toString();
  final Stream<QuerySnapshot> _userStream =
      FirebaseFirestore.instance.collection('ev_cars').snapshots();

  data() {
    FirebaseFirestore.instance
        .collection('ev_cars')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        items.add(doc['company_name'].toString());
      });
    });
    print(items);
  }

  Widget dropDown() {
    return MaterialApp(
        home: StreamBuilder<QuerySnapshot>(
      stream: _userStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            print(data['company_name']);
            return Builder(builder: (context) {
              return SizedBox(
                height: 100,
                width: 200,
                child: Scaffold(
                  body: ListTile(
                    title: Text(data['company_name']),
                    subtitle: Text(data['model']),
                  ),
                ),
              );
            });
          }).toList(),
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "EV Car details",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //dropDown(),
                      //data(),
                      DropdownButton(
                        // Initial Value
                        value: dropdownvalue,
                        borderRadius: BorderRadius.circular(32),
                        dropdownColor: Colors.white,
                        focusColor: Colors.white,
                        isExpanded: true,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        style: const TextStyle(
                            backgroundColor: Colors.white,
                            color: Colors.black,
                            fontSize: 30),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
