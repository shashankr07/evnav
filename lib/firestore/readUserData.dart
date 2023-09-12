import 'package:cloud_firestore/cloud_firestore.dart';

class ReadUserData {
  final String email;

  ReadUserData(this.email);

  CollectionReference users = FirebaseFirestore.instance
      .collection('user')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      print(doc['first_name']);
    });
  }) as CollectionReference<Object?>;
}
