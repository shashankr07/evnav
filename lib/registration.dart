// import 'dart:ffi';

//import 'package:evnav/evcar_registration.dart';
import 'package:evnav/evCarRegistration.dart';
import 'package:evnav/login.dart';
import 'package:evnav/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isRememberMe = false;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final contact = TextEditingController();
  final password = TextEditingController();
  final conPassword = TextEditingController();
  List<String> type = [];

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
              child: TextField(
                  controller: email,
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

  Widget buildContactNo() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Contact No.",
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
              child: TextField(
                  controller: contact,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Color(0xff001666),
                      ),
                      hintText: "Contact no.",
                      hintStyle: TextStyle(color: Colors.black38))))
        ]);
  }

  Widget buildFirstName() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "First Name",
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
              child: TextField(
                  controller: firstname,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      prefixIcon: Icon(
                        Icons.account_box,
                        color: Color(0xff001666),
                      ),
                      hintText: "First Name",
                      hintStyle: TextStyle(color: Colors.black38))))
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
              child: TextField(
                  controller: lastname,
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
              child: TextField(
                  controller: password,
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
              child: TextField(
                  controller: conPassword,
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

  Widget buildRegistrationBtn() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    CollectionReference evcar =
        FirebaseFirestore.instance.collection('ev_cars');

    return Container(
        padding: const EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255)),

          //elevation: 5,

          onPressed: () => {
            if (firstname.text.isEmpty)
              {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Empty field'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              const Text('Enter your first name'),
                              TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Okay'),
                                  child: const Text("Okay"))
                            ],
                          ),
                        ),
                      );
                    })
              }
            else if (lastname.text.isEmpty)
              {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Empty field'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              const Text('Enter your lastname'),
                              TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Okay'),
                                  child: const Text("Okay"))
                            ],
                          ),
                        ),
                      );
                    })
              }
            else if (email.text.isEmpty)
              {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Empty field'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              const Text('Enter your email'),
                              TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Okay'),
                                  child: const Text("Okay"))
                            ],
                          ),
                        ),
                      );
                    })
              }
            else if (password.text.isEmpty)
              {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Empty field'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              const Text('Enter a password'),
                              TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Okay'),
                                  child: const Text("Okay"))
                            ],
                          ),
                        ),
                      );
                    })
              }
            else if (conPassword.text.isEmpty)
              {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Empty field'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              const Text('Confirm your password'),
                              TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Okay'),
                                  child: const Text("Okay"))
                            ],
                          ),
                        ),
                      );
                    })
              }
            else if (password.text != conPassword.text)
              {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Password doesn\'t match'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              const Text('Both the password should be same'),
                              TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Okay'),
                                  child: const Text("Okay"))
                            ],
                          ),
                        ),
                      );
                    })
              }
            else if (!email.text.contains('@') &&
                (!email.text.endsWith('.com') || !email.text.endsWith('.in')))
              {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Invalid email'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              const Text('Enter a valid email address'),
                              TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Okay'),
                                  child: const Text("Okay"))
                            ],
                          ),
                        ),
                      );
                    })
              }
            else if (password.text.length < 8)
              {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Password Error'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              const Text(
                                  'Password should be more than 8 characters'),
                              TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Okay'),
                                  child: const Text("Okay"))
                            ],
                          ),
                        ),
                      );
                    })
              }
            else
              {
                users
                    .add({
                      'first_name': firstname.text,
                      'last_name': lastname.text,
                      'email': email.text,
                      'password': password.text,
                      'contact_no': contact.text,
                      'evcar_id': "",
                      "evcar_number_plate": "",
                      "is_provider": false
                    })
                    .then((value) => print("User added"))
                    .catchError((error) => print("Failed: $error")),
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EVCarRegistration())),
                // FutureBuilder<DocumentSnapshot>(
                //     future: evcar.doc(documentId).get(),
                //     builder: (BuildContext context,
                //         AsyncSnapshot<DocumentSnapshot> snapshot) {
                //       if (snapshot.hasError) {
                //         print("Something went wrong");
                //       }
                //       if (snapshot.hasData && !snapshot.data!.exists) {
                //         print("Document does not exist");
                //       }
                //       if (snapshot.connectionState == ConnectionState.done) {
                //         Map<String, dynamic> data =
                //             snapshot.data!.data() as Map<String, dynamic>;
                //         print(data['type']);
                //       }
                //       return CircularProgressIndicator();
                //     }),
              },
          },
          // padding:
          //style: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          child: const Text(
            "Next",
            style: TextStyle(
                color: Color(0xff001666),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ));
  }

  Widget buildSignUpBtn() {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen())),
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
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      buildFirstName(),
                      const SizedBox(height: 20),
                      buildLasttName(),
                      const SizedBox(height: 20),
                      buildEmail(),
                      const SizedBox(height: 20),
                      buildContactNo(),
                      const SizedBox(height: 20),
                      buildNewPassword(),
                      const SizedBox(height: 20),
                      buildConPassword(),
                      //buildForgotPassBtn(),
                      //buildRememberCb(),
                      const SizedBox(height: 40),
                      buildRegistrationBtn(),
                      buildSignUpBtn()
                    ],
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
