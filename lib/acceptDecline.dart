import 'package:evnav/providerDashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'home.dart';
import 'login.dart';

class AcceptDecline extends StatefulWidget {
  const AcceptDecline({super.key});

  @override
  State<AcceptDecline> createState() => _AcceptDeclineState();
}

class _AcceptDeclineState extends State<AcceptDecline> {
  bool isRememberMe = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool validate = false;

  Widget buildLoginBtn(String butText) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        height: 120,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
          onPressed: () {
            if (butText == "Accept") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ));
            } else if (butText == "Decline") {
              //setUpInteractedMessage();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProviderDashboard()));
            }
          },
          child: Text(
            butText,
            style: const TextStyle(
                color: Color(0xff001666),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
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
                        "",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 50),
                      const SizedBox(height: 20),
                      buildLoginBtn("Accept"),
                      const SizedBox(height: 40),
                      buildLoginBtn("Decline"),
                    ],
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
