import 'package:evnav/login.dart';
import 'package:evnav/providerDashboard.dart';
import 'package:evnav/setUpInteractedMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';
import 'profile.dart';
// import 'user.dart' as Users;

class Provider extends StatefulWidget {
  const Provider({super.key});

  @override
  _ProviderState createState() => _ProviderState();
}

class _ProviderState extends State<Provider> {
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
            if (butText == "Login as User") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            } else if (butText == "Login as Provider") {
              //setUpInteractedMessage();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProviderDashboard()));
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
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
                        "Welcome",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 50),
                      const SizedBox(height: 20),
                      buildLoginBtn("Login as User"),
                      const SizedBox(height: 40),
                      buildLoginBtn("Login as Provider"),
                      const SizedBox(height: 40),
                      buildLoginBtn("Logout"),
                    ],
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
