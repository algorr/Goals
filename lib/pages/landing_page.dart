import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goals/pages/home_page.dart';
import 'package:goals/pages/sign_up_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}


class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    if(_firebaseAuth.currentUser == null){
      return const SignUpPage();
    }else {
      return const HomePage();
    }
  }

  Future<void> _checkUser() async {
    var user = await FirebaseAuth.instance.currentUser;
  }
}
