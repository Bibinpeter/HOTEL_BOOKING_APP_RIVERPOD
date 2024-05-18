 

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // Reference for our collections
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  // Saving the userdata
  Future<void> savingUserData(String fullName, String email,String profile) async {
    try {
      await userCollection.doc(uid).set({
        "fullName": fullName,
        "email": email,
        "uid": uid,
        "profile":profile,
      });
    } catch (error) {
      
 //   print(error);
    }
  }

  // Getting user data
  Future<QuerySnapshot> gettingUserData(String email) async {
    try {
      return await userCollection.where("email", isEqualTo: email).get();
    } catch (error) {
      
   // print(error);
      rethrow;
    }
  }

  Stream<DocumentSnapshot>getuserdetails(String uid){
    if(uid.isNotEmpty){
      return userCollection.doc(uid).snapshots();
    }else{
      return const Stream.empty();
    }
  }
}