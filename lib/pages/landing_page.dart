import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goals/pages/home_page.dart';
import 'package:goals/pages/sign_up_page.dart';
import 'package:goals/services/firebase_auth.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  final Future<User?> user;

  const LandingPage({Key? key, required this.user}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final myAuth = Provider.of<AuthService>(context);
    var user = Provider.of<AuthService>(context).currentUser();
    switch (myAuth.userState) {
      case UserState.signedIn:
        return HomePage(user: user);
      case UserState.notSignedIn:
        return const SignUpPage();
    }
  }
}
