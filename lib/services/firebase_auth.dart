import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signUp(String email, String password) async {
    var user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore.collection("users").doc(user.user!.uid).set({
      'email': email,
    });
    return user.user;
  }

  Future<User?> signIn(String email, String password) async {
    var user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  /*Future<User?> isCurrentUser() async {
    var user = await _firebaseAuth.currentUser;
    if (user != null) {
      return user;
    } else {
      return null;
    }
  }*/
}
