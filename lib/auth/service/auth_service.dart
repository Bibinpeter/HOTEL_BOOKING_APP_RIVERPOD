import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel/auth/service/firebaseclass.dart';
import 'package:hotel/auth/service/helper.dart';
import 'package:hotel/auth/service/service.dart';
import 'package:hotel/screen/home/pages/home.dart';

enum UserCredentialConstant { user, adim, error, admin }

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<bool> loginWithUserNameandPassword(
      String email, String password) async {
       
    try {
      // ignore: unused_local_variable
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      
        return true;
     
    } on FirebaseAuthException {
      return false;
    }
  }

  Future registerUserWithEmailandPassword(
      String fullName, String email, String password, String profile) async {
    
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword( email: email, password: password)).user!;
      await DatabaseService(uid: user.uid)  .savingUserData(fullName, email, profile);
      
      return true;
    } on FirebaseAuthException catch (e) {
      
      return e.message;
    }
  }
  

    Future signOut() async {
    try {
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserEmailSF("");
      await HelperFunctions.saveUserNameSF("");
      firebaseAuth.signOut();
    } catch (e) {
      return e;
    }
  }

  Future<void> googleSignUp(BuildContext context) async {
  try {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    if (gUser == null) {
      return;
    } else {
      final GoogleSignInAuthentication gAuth = await gUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        QuerySnapshot? snapshot =await FirebaseDatabaseClass(uid: user.uid).gettingUserData();
        if (snapshot == null) {
          await FirebaseDatabaseClass(uid: user.uid).saveUserData(user.email!);
        }
     
        HelperFunctions.saveUserEmailSF(user.email!);
        
      
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Homepage()),
        );
      }
    }
  } catch (e) {
  //  print(e);
  }
}



}
