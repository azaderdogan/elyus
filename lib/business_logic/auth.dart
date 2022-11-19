import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  /*
  // giris yap fonskiyonu
  Future<User?> signIn(String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }*/

  //cikis yap fonskiyonu
  signOut() async {
    return await _auth.signOut();
  }

  // kayit ol fonksiyonu
  /*Future<String> createPerson(
      String name, String email, String password, ) async {
    var user =
        _auth.createUserWithEmailAndPassword(email: email, password: password);
    
  }*/

}
