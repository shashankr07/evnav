import 'package:cloud_firestore/cloud_firestore.dart';

class PushRequest {
  final String firstName;
  final String lastName;
  final String contact;

  PushRequest(this.firstName, this.lastName, this.contact);

  CollectionReference pushReq =
      FirebaseFirestore.instance.collection('ProvierRequests');

  Future<void> addRequest() {
    return pushReq
        .add({
          'first_name': firstName,
          'last_name': lastName,
          'contact': contact
        })
        .then((value) => print("User added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
