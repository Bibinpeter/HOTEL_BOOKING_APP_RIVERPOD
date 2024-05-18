import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatabaseClass {
  final String uid;
  FirebaseDatabaseClass({required this.uid});
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');
  Future saveUserData(String email) async {
    userCollection.doc(uid).set({'email': email, 'uid': uid});
  }

  Future gettingUserData() async {
    QuerySnapshot snapshot =
        await userCollection.where("uid", isEqualTo: uid).get();
    if (snapshot.docs.isEmpty) {
      return null;
    } else {
      return snapshot;
    }
  }
}